<script setup>
import {reactive, ref} from "vue";
import {adminDeleteBatch, adminDeleteById, adminInsert, adminSelectByPage, adminUpdate} from "@/utils/adminApi.js";
import {ElMessage, ElMessageBox} from "element-plus";
import {
  Check,
  Delete,
  Edit,
  Message,
  Search,
  Star,
} from '@element-plus/icons-vue'


const data = reactive({
  search: '',
  pageNum: 1,
  pageSize: 5,
  total: 0,
  tableData: [],
  employeeList: [],
  formVisible: false,
  form: {},
  ids: [],
  rules:{
    username: [{required:true,message:'请输入账号',trigger:'blur'}],
    name: [{required:true,message:'请输入姓名',trigger:'blur'}],
    en: [{required:true,message:'请输入工号',trigger:'blur'}],
  },
})

const formRef = ref();

const save = (row) => {
  formRef.value.validate((valid) => {
    if (valid) {
      data.form.id ? update() : insert();
    }
  })
}

const insert = () => {
  adminInsert(data.form).then(res => {
    if (res.code === '200') {
      ElMessage.success('新增成功！！');
      data.formVisible = false;
      load();
    } else {
      ElMessage.error(res.msg || '新增失败');
    }
  }).catch(error => {
    ElMessage.error('新增失败：' + error.message);
  });
}

const update = () => {
  adminUpdate(data.form).then(res => {
    if (res.code === '200') {
      ElMessage.success('更新成功！！');
      data.formVisible = false;
      load(); // 刷新数据列表
    } else {
      ElMessage.error(res.msg || '更新失败');
    }
  }).catch(error => {
    ElMessage.error('更新失败：' + error.message);
  });
}

const remove = (id) => {
  ElMessageBox.confirm('删除后无法恢复，您确认删除吗？','确认删除',{type:'warning'}).then(() => {
    adminDeleteById(id).then(res => {
      if (res.code === '200') {
        ElMessage.success('删除成功！！');
        load(); // 刷新数据列表
      } else {
        ElMessage.error(res.msg || '删除失败');
      }
    }).catch(error => {
      ElMessage.error('删除失败：' + error.message);
    });
  })
}

const deleteSelected = () => {
  if(data.ids.length === 0) {
    ElMessage.warning("未选择数据");
  }else{
    ElMessageBox.confirm('删除后无法恢复，您确认删除吗？','确认删除',{type:'warning'}).then(() => {
      adminDeleteBatch(data.ids).then(res => {
        if (res.code === '200') {
          ElMessage.success('删除成功！！');
          load(); // 刷新数据列表
        } else {
          ElMessage.error(res.msg || '删除失败');
        }
      }).catch(error => {
        ElMessage.error('删除失败：' + error.message);
      });
    })
  }
}

const handleAdd = () =>{
  data.form = {
    gender: "男",
    age: 18,
  };
  data.formVisible = true;
}

const handleEdit = (row) =>{
  data.form = JSON.parse(JSON.stringify(row));
  data.formVisible = true;
}

const handleSelectionChange = (rows) => {
  data.ids = rows.map(row=>row.id);
  console.log(data.ids);
}

const reset = () => {
  data.search = '';
  load();
}

const handleAvatarSuccess = (res) => {
  console.log(res);
  data.form.avatar = res.data;
}


const load = () =>{
  adminSelectByPage({
    pageNum: data.pageNum,
    pageSize: data.pageSize,
    search: data.search
  }).then(res=>{
    data.tableData = res.data.records;
    data.total = res.data.total;
    console.log(res.data);
  })
}

load();

</script>

<template>
  <div>
    <div class="card" style="margin-bottom:5px; margin-right: 10px">
      <el-input style="width: 240px" v-model="data.search" placeholder="查询" :prefix-icon="Search"/>
      <el-button type="primary" plain style="margin-left: 10px" @click="load">查询</el-button>
      <el-button type="primary" plain @click="reset">重置</el-button>
    </div>
    <div class="card" style="margin-bottom:5px">
      <el-button type="primary" plain style="margin-left: 10px" @click="handleAdd">新增</el-button>
      <el-button type="primary" plain @click="deleteSelected">批量删除 </el-button>
      <el-button type="primary" plain >导入</el-button>
      <el-button type="primary" plain >导出</el-button>
    </div>
    <div class="card" style="margin-bottom:5px">
      <el-table :data='data.tableData' stripe @selection-change="handleSelectionChange">
        <el-table-column type="selection" />
        <el-table-column label="账号" prop="username" />
        <el-table-column label="头像" >
          <template #default="scope">
            <img v-if="scope.row.avatar" :src="scope.row.avatar" alt="" style="width:40px; height:40px; border-radius: 50%;">
          </template>
        </el-table-column>
        <el-table-column label="姓名" prop="name" />
        <el-table-column label="工号" prop="en" />
        <el-table-column label="操作">
          <template #default="scope">
            <el-button type="primary" :icon="Edit" circle @click="handleEdit(scope.row)" />
            <el-button type="danger" :icon="Delete" circle @click="remove(scope.row.id)"/>
          </template>
        </el-table-column>
      </el-table>
      <div  style="margin-bottom:5px; margin-top: 10px">
        <el-pagination
            @change = 'load'
            v-model:current-page="data.pageNum"
            v-model:page-size="data.pageSize"
            :page-sizes="[5,10,20,50,100]"
            background
            layout="total, sizes, prev, pager, next, jumper"
            :total="data.total"
        />
      </div>
    </div>
    <el-dialog v-model="data.formVisible" title="员工信息" width="500" destroy-on-close>
      <el-form ref="formRef" :rules="data.rules" :model="data.form" label-width="80px" style="margin-right:40px">
        <div style="width: 100%; display: flex; justify-content: center; margin-bottom: 20px">
          <el-upload
              class="avatar-uploader"
              action="http://localhost:8080/files/upload"
              :show-file-list="false"
              :on-success="handleAvatarSuccess">
            <img v-if="data.form.avatar" :src="data.form.avatar" class="avatar" />
            <el-icon v-else class="avatar-uploader-icon"><Plus /></el-icon>
          </el-upload>
        </div>
        <el-form-item label="账号" prop="username">
          <el-input v-model="data.form.username" placeholder="请输入账号"/>
        </el-form-item>
        <el-form-item label="姓名" prop="name">
          <el-input v-model="data.form.name" placeholder="请输入姓名"/>
        </el-form-item>
        <el-form-item label="工号" prop="en">
          <el-input v-model="data.form.en"  placeholder="请输入工号"/>
        </el-form-item>
      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button type="primary" @click="save">保存</el-button>
          <el-button @click="data.formVisible = false">取消</el-button>
        </div>
      </template>
    </el-dialog>

  </div>
</template>

<style scoped>
.avatar-uploader .avatar {
  width: 120px;
  height: 120px;
  display: block;
}
</style>

<style>
.avatar-uploader .el-upload {
  border: 1px dashed var(--el-border-color);
  border-radius: 50%;
  cursor: pointer;
  position: relative;
  overflow: hidden;
  transition: var(--el-transition-duration-fast);
}

.avatar-uploader .el-upload:hover {
  border-color: var(--el-color-primary);
}

.el-icon.avatar-uploader-icon {
  font-size: 28px;
  color: #8c939d;
  width: 120px;
  height: 120px;
  text-align: center;
}
</style>
<script setup>
import {reactive} from "vue";
import {deleteBatch, deleteById, insert, selectAll, selectByPage, update} from "@/utils/employeeApi.js";
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
})

const save = (row) => {
  data.form.id ? updateEmployee() : insertEmployee();
}

const insertEmployee = () => {
  insert(data.form).then(res => {
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

const updateEmployee = () => {
  update(data.form).then(res => {
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

const deleteEmployee = (id) => {
  ElMessageBox.confirm('删除后无法恢复，您确认删除吗？','确认删除',{type:'warning'}).then(() => {
    deleteById(id).then(res => {
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
      deleteBatch(data.ids).then(res => {
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

const load = () =>{
  selectByPage({
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
        <el-table-column label="姓名" prop="name" />
        <el-table-column label="性别" prop="gender" />
        <el-table-column label="工号" prop="en" />
        <el-table-column label="年龄" prop="age" />
        <el-table-column label="简历" prop="descr"  show-overflow-tooltip/>
        <el-table-column label="部门" prop="department" />
        <el-table-column label="操作">
          <template #default="scope">
            <el-button type="primary" :icon="Edit" circle @click="handleEdit(scope.row)" />
            <el-button type="danger" :icon="Delete" circle @click="deleteEmployee(scope.row.id)"/>
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
    <el-dialog v-model="data.formVisible" title="员工信息" width="500">
      <el-form :model="data.form" label-width="80px" style="margin-right:40px">
        <el-form-item label="姓名" >
          <el-input v-model="data.form.name" placeholder="请输入姓名"/>
        </el-form-item>
        <el-form-item label="性别">
          <el-radio-group v-model="data.form.gender">
            <el-radio value="男" label="男">男</el-radio>
            <el-radio value="女" label="女">女</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="工号">
          <el-input v-model="data.form.en"  placeholder="请输入工号"/>
        </el-form-item>
        <el-form-item label="年龄" >
          <el-input-number style="width: 200px" v-model="data.form.age" min="18" />
        </el-form-item>
        <el-form-item label="简历">
          <el-input rows="5" type="textarea" v-model="data.form.descr"  placeholder="你是谁" />
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

</style>
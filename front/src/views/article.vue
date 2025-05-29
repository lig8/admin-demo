<script setup>
import {reactive, ref,onBeforeUnmount,shallowRef} from "vue";
import {
  articleDeleteBatch,
  articleDeleteById,
  articleInsert,
  articleSelectByPage,
  articleUpdate,
} from "@/utils/articleApi.js";
import {ElMessage, ElMessageBox} from "element-plus";
import {
  Check,
  Delete,
  Edit,
  Message,
  Search,
  Star,
} from '@element-plus/icons-vue'

import '@wangeditor/editor/dist/css/style.css'
import {Editor, Toolbar} from '@wangeditor/editor-for-vue'
import '@/assets/view.css'


const data = reactive({
  search: '',
  pageNum: 1,
  pageSize: 5,
  total: 0,
  tableData: [],
  articleList: [],
  formVisible: false,
  form: {},
  ids: [],
  rules:{
    username: [{required:true,message:'请输入账号',trigger:'blur'}],
    name: [{required:true,message:'请输入姓名',trigger:'blur'}],
    en: [{required:true,message:'请输入工号',trigger:'blur'}],
  },
  content: [],
  viewVisible: false,
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
  articleInsert(data.form).then(res => {
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
  articleUpdate(data.form).then(res => {
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
    articleDeleteById(id).then(res => {
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
      articleDeleteBatch(data.ids).then(res => {
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

const handleImgSuccess = (res) => {
  console.log(res);
  data.form.img = res.data;
}

// wangeditor 初始化开始
const baseUrl = 'http://localhost:8080/'
const editorRef = shallowRef();
const mode = 'default';
const editorConfig = {
  MENU_CONF:{}
}
editorConfig.MENU_CONF['uploadImage'] = {
  server: baseUrl + 'files/wang/upload',  //图片上传接口
  fieldName: 'file', // 图片上传参数
}

onBeforeUnmount(() => {
  const editor = editorRef.value;
  if (editor == null) return;
  editor.destroy();
})

const handleCreated = (editor) => {
  editorRef.value = editor;
}

// wangeditor 初始化结束

const view = (content) => {
  data.content = content;
  data.viewVisible = true;
}

const load = () =>{
  articleSelectByPage({
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
        <el-table-column label="title" prop="title" />
        <el-table-column label="封面" >
          <template #default="scope">
            <el-image :preview-src-list=[scope.row.img] preview-teleported v-if="scope.row.img" :src="scope.row.img" alt="封面" style="width:100px; height:60px;" />
          </template>
        </el-table-column>
        <el-table-column label="摘要" prop="description" show-overflow-tooltip/>
        <el-table-column label="内容">
          <template #default="scope">
            <el-button type="primary" @click="view(scope.row.content)"> 查看内容 </el-button>
          </template>
        </el-table-column>
        <el-table-column label="发布时间" prop="createTime" />
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
    <el-dialog v-model="data.formVisible" title="文章信息" width="80%" style="text-align: center" destroy-on-close>
      <el-form ref="formRef" :rules="data.rules" :model="data.form" label-width="80px" style="margin-right:40px">
        <el-form-item label="标题" prop="title">
          <el-input v-model="data.form.title" placeholder="请输入标题"/>
        </el-form-item>
        <el-form-item >
          <el-upload
              action="http://localhost:8080/files/upload"
              list-type="picture"
              :on-success="handleImgSuccess">
            <el-button type="primary"> 上传封面 </el-button>
          </el-upload>
        </el-form-item>
        <el-form-item label="摘要" prop="description">
          <el-input type="textarea" :rows="3" v-model="data.form.description" placeholder="请输入简介"/>
        </el-form-item>
        <el-form-item label="内容">
          <div style="border:1px solid #ccc; width:100%;">
            <toolbar
                style="border:1px solid #ccc; "
                :editor = "editorRef"
                :mode = "mode" />
            <Editor
                style="height:500px; overflow-y:hidden"
                v-model="data.form.content"
                :mode="mode"
                :default-config = "editorConfig"
                @onCreated = "handleCreated" />
          </div>
        </el-form-item>
      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button type="primary" @click="save">保存</el-button>
          <el-button @click="data.formVisible = false">取消</el-button>
        </div>
      </template>
    </el-dialog>
    <el-dialog title="内容" v-model="data.viewVisible" width="80%" :close-on-click-modal="false" destroy-on-close>
      <div class="editor-content-view" style="padding:20px" v-html="data.content"></div>
      <template #footer>
        <span class="dialog-footer">
          <el-button @click="data.viewVisible = false">关闭</el-button>
        </span>
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
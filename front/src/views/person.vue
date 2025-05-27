<script setup>
import {reactive, ref} from "vue";
import {adminUpdate} from "@/utils/adminApi.js";
import {employeeUpdate} from "@/utils/employeeApi.js";
import {ElMessage} from "element-plus";

const formRef = ref();
const data = reactive({
  form: JSON.parse(localStorage.getItem("userinfo")),
  rules:{
    username: [{required:true,message:'请输入账号',trigger:'blur'}],
    name: [{required:true,message:'请输入姓名',trigger:'blur'}],
    en: [{required:true,message:'请输入工号',trigger:'blur'}],
  },
})

const emit = defineEmits(["updateUserInfo"]);

const updateUserInfo = () =>{
  if(data.form.role == 'ADMIN'){
    adminUpdate(data.form).then(res => {
      if (res.code === '200') {
        ElMessage.success('更新成功！！');
        localStorage.setItem("userinfo", JSON.stringify(res.data));
        emit('updateUserInfo');

      } else {
        ElMessage.error(res.msg || '更新失败');
      }
    });
  }else {
    employeeUpdate(data.form).then(res => {
      if (res.code === '200') {
        ElMessage.success('更新成功！！');
        localStorage.setItem("userinfo", JSON.stringify(res.data));
        emit('updateUserInfo');
      } else {
        ElMessage.error(res.msg || '更新失败');
      }
    });
  }
}

const handleAvatarSuccess = (res) => {
  console.log(res);
  data.form.avatar = res.data;
}
</script>

<template>
  <div class="card" style="width: 50%; padding: 40px 20px;" >
    <el-form ref="formRef" :rules="data.rules" :model="data.form" label-width="80px" style="margin-right:40px">
      <div style="width: 100%; display: flex; justify-content: center; margin-bottom: 20px">
        <el-upload
            class="avatar-uploader"
            action="http://localhost:8080/files/upload"
            :show-file-list="false"
            :on-success="handleAvatarSuccess"
            :before-upload="beforeAvatarUpload">
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
        <el-input disabled v-model="data.form.en"  placeholder="请输入工号"/>
      </el-form-item>
      <div v-if="data.form.role === 'EMP'">
        <el-form-item label="性别">
          <el-radio-group v-model="data.form.gender">
            <el-radio value="男" label="男">男</el-radio>
            <el-radio value="女" label="女">女</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="年龄" >
          <el-input-number style="width: 200px" v-model="data.form.age" min="18" />
        </el-form-item>
        <el-form-item label="简历">
          <el-input rows="5" type="textarea" v-model="data.form.descr"  placeholder="你是谁" />
        </el-form-item>
      </div>
      <div style="text-align: center">
        <el-button @click="updateUserInfo" type="primary" style="width: 40%; padding:20px 30px"> 更 新 个 人 信 息 </el-button>
      </div>
    </el-form>
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
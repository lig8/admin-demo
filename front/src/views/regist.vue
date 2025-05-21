<script setup>
import {reactive, ref} from "vue";
import {User,Lock} from "@element-plus/icons-vue"
import {regist} from "@/utils/employeeApi.js";
import {ElMessage} from "element-plus";

const validatePass2 = (rule, value, callback) => {
  if (value === '') {
    callback(new Error('请再次输入密码'))
  } else if (value !== data.form.password) {
    callback(new Error("两次输入不一致!"))
  } else {
    callback()
  }
}

const data = reactive({
  form: {
    name: '',
    password: '',
    confirmPass: '',
  },
  rules:{
    username:[{required:true, message:'请输入账号',trigger:"blur"}],
    password:[{required:true, message:'请输入密码',trigger:"blur"}],
    confirmPass: [{ validator: validatePass2, trigger: 'blur' }],
  }
});



const formRef = ref();

const registSystem = () => {
  formRef.value.validate((valid) => {
    if (valid) {
      regist(data.form).then(res => {
        if (res.code === '200') {
          ElMessage.success("注册成功")
          location.href = "/login"
        } else {
          ElMessage.error(res.msg );
        }
      });
    }
  })
}
</script>

<template>
  <div class="login-container">
    <div class="login-box">
      <div style="padding:20px; background-color: white; margin-left:120px; border-radius:10px; box-shadow: 0 0 10px rgba(0,0,0,0.2)" >
        <el-form ref="formRef" :rules="data.rules" :model="data.form" style="width: 300px">
          <div style="text-align: center; margin-bottom: 10px; font-size:24px; color: #0742b1; font-weight: bold;"> 欢 迎 注 册 </div>
          <el-form-item prop="username">
            <el-input size="large" v-model="data.form.username" placeholder="请输入账号" prefix-icon="User"></el-input>
          </el-form-item>
          <el-form-item prop="password">
            <el-input show-password size="large" v-model="data.form.password" placeholder="请输入密码" prefix-icon="Lock"></el-input>
          </el-form-item>
          <el-form-item prop="confirmPass">
            <el-input show-password size="large" v-model="data.form.confirmPass" placeholder="请确认密码" prefix-icon="Lock"></el-input>
          </el-form-item>
          <div style="margin-bottom: 20px">
            <el-button @click="registSystem" size="large" style="width:100%" type="primary"> 注册 </el-button>
          </div>
          <div style="text-align: right">已有账号，请<a style="color:#0742b1; text-decoration: none"  href="/login">登录</a></div>
        </el-form>
      </div>
    </div>
  </div>

</template>

<style scoped>
.login-container {
  height: 100vh;
  overflow: hidden;
  background-image: url("@/assets/img/login.jpg");
  background-size: cover;
  background-position: -300px 0;
}

.login-box {
  width: 50%;
  height: 100%;
  right: 0;
  position: absolute;
  display: flex;
  align-items: center;
}
</style>


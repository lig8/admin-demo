<script setup>
import {reactive, ref} from "vue";
import {User,Lock} from "@element-plus/icons-vue"
import {login} from "@/utils/employeeApi.js";
import {ElMessage} from "element-plus";

const data = reactive({
  form: {},
  rules:{
    username:[{required:true, message:'请输入账号',trigger:"blur"}],
    password:[{required:true, message:'请输入密码',trigger:"blur"}],
  }
});

const formRef = ref();

const loginSystem = () => {
  formRef.value.validate((valid) => {
    if (valid) {
      login(data.form).then(res => {
        if (res.code === '200') {
          localStorage.setItem("userinfo", JSON.stringify(res.data));
          ElMessage.success("登录成功")
          location.href = "/manager/home"
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
          <div style="text-align: center; margin-bottom: 10px; font-size:24px; color: #0742b1; font-weight: bold;"> 欢迎登录后台管理系统 </div>
          <el-form-item prop="username">
            <el-input size="large" v-model="data.form.username" placeholder="请输入账号" prefix-icon="User"></el-input>
          </el-form-item>
          <el-form-item prop="password">
            <el-input show-password size="large" v-model="data.form.password" placeholder="请输入密码" prefix-icon="Lock"></el-input>
          </el-form-item>
          <div style="margin-bottom: 20px">
            <el-button @click="loginSystem" size="large" style="width:100%" type="primary"> 登录 </el-button>
          </div>
          <div style="text-align: right">还没有账号？请<a style="color:#0742b1; text-decoration: none"  href="/regist">注册</a></div>
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


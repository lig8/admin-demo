<script setup>
import {reactive, ref} from "vue";
import {adminUpdatePass} from "@/utils/adminApi.js";
import {employeeUpdatePass} from "@/utils/employeeApi.js";
import {ElMessage} from "element-plus";

const validatePass = (rule, value, callback) => {
  if (value === '') {
    callback(new Error('请再次输入密码'))
  } else if (value !== data.form.newPass) {
    callback(new Error("两次输入不一致!"))
  } else {
    callback()
  }
}

const data = reactive({
  user: JSON.parse(localStorage.getItem("userinfo")),
  form: {
    password: "",
    newPass: "",
    confirmPass: "",
  },
  rules:{
    password: [{required:true,message:'请输入原密码',trigger:'blur'}],
    newPass: [{required:true,message:'请输入新密码',trigger:'blur'}],
    confirmPass: [{ validator: validatePass, trigger: 'blur' }],
  },
})
const formRef = ref();


  const updatePassword = () => {
    data.form.username = data.user.username;
    formRef.value.validate((valid) => {
      if (valid) {
        if (data.user.role === "ADMIN") {
          adminUpdatePass(data.form).then(res => {
            if (res.code === '200') {
              ElMessage.success(res.msg)
            } else {
              ElMessage.error(res.msg );
            }
          });
        }else{
          employeeUpdatePass(data.form).then(res => {
            if (res.code === '200') {
              ElMessage.success(res.msg)
            } else {
              ElMessage.error(res.msg );
            }
          });
        }
      }
    })
  }


</script>

<template>
  <div class="card" style="width: 35%; padding: 40px 20px;" >
    <el-form ref="formRef" :rules="data.rules" :model="data.form" label-width="80px" style="margin-right:40px">
      <el-form-item label="原密码" prop="password">
        <el-input v-model="data.form.password" placeholder="请输入原密码"/>
      </el-form-item>
      <el-form-item label="新密码" prop="newPass">
        <el-input v-model="data.form.newPass" placeholder="请输入新密码"/>
      </el-form-item>
      <el-form-item label="确认密码" prop="confirmPass">
        <el-input v-model="data.form.confirmPass"  placeholder="请再次输入新密码"/>
      </el-form-item>
      <div style="text-align: center">
        <el-button @click="updatePassword" type="primary" style="width: 40%; padding:20px 30px"> 立即修改 </el-button>
      </div>
    </el-form>
  </div>
</template>

<style scoped>

</style>
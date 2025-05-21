<script setup>
import router from "../router";
import {reactive} from "vue";

const data = reactive({
  user: JSON.parse(localStorage.getItem("userinfo")),
})
</script>

<template>

<div style="">
  <!-- header start -->
  <div style="height: 60px; background-color: #3c7fff; display: flex; align-items: center">
    <div style="margin-left: 10px; width: 200px; display: flex; align-items: center">
      <img style="width: 30px" src="../assets/img/logo.png" alt="" />
      <span style="font-size: 20px; color: white"> 后台管理系统</span>
    </div>
    <div style="flex:1;">  </div>
    <div style="width: fit-content; padding-right: 10px; display: flex; align-items: center">
      <el-image src="https://cube.elemecdn.com/3/7c/3ea6beec64369c2642b92c6726f1epng.png" alt="" style="width:40px; height:40px;"/>
      <span style="color: white; margin-left: 5px"> {{data.user.name}} </span>
    </div>
  </div>
  <!-- head end -->

  <!--body start  -->
  <div style="display:flex">
    <!--  left menu start  -->
    <div style="width: 200px; border-right: 1px solid #ddd; min-height: calc(100vh - 60px);">
      <el-menu style="border: 0" router :default-active= "router.currentRoute.value.path" :default-openeds="['1']" >
        <el-menu-item index="/manager/home"><el-icon><HomeFilled /></el-icon>系统首页</el-menu-item>
        <el-menu-item index="/manager/data"><el-icon><DataAnalysis /></el-icon>数据统计</el-menu-item>
        <el-sub-menu index="1"  >
          <template #title>
            <el-icon><user /></el-icon>
            <span>用户管理</span>
          </template>
            <el-menu-item index=""><el-icon><Apple /></el-icon>管理员信息</el-menu-item>
            <el-menu-item index="/manager/employee"><el-icon><Orange /></el-icon>员工信息</el-menu-item>
        </el-sub-menu>
        <el-menu-item index=""><el-icon><UserFilled /></el-icon>个人信息</el-menu-item>
        <el-menu-item index="/login"><el-icon><SwitchButton /></el-icon>退出系统</el-menu-item>
      </el-menu>
    </div>
    <!--  left menu end  -->

    <!--  right area start  -->
    <div style="flex: 1; width: 0; background-color: #f8f8ff; padding: 10px;">
      <RouterView />
    </div>
    <!--  right area end  -->

  </div>
  <!-- body end -->

</div>
</template>

<style scoped>
  .el-menu .is-active {
    background-color: #e6ecf7 !important;
  }

</style>
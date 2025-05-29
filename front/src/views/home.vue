<script setup>
import {reactive} from 'vue'
import router from '../router'
import {
  Check,
  Delete,
  Edit,
  Message,
  Search,
  Star,
} from '@element-plus/icons-vue'

import '@wangeditor/editor/dist/css/style.css'
import {onBeforeUnmount, ref, shallowRef} from "vue";
import {Editor, Toolbar} from '@wangeditor/editor-for-vue'


const data = reactive({
  box: {
    width: '100px',
    height: '100px',
    background: 'red'
  },
  box1: {
    width: '100px',
    height: '100px',
    background: 'blue'
  },
  box2: {
    width: '100px',
    height: '100px',
    background: 'green'
  },
})

function changeColor(){
  if(data.box === data.box1){
    data.box = data.box2;
  }else{
    data.box = data.box1;
  }
}


</script>

<template>
  <div class="home">
    <div class="" :style="data.box"></div>

    <div class="" style="display: flex;">
        <button @click="changeColor" style="font-size: 30px"> 点我 </button>
        <div @click="changeColor" style="font-size: 30px"> 点我 </div>
    </div>
    <div>
      <RouterLink to="/test"> 点击到test </RouterLink>
      <a href="/test">点我到TEST</a>
      <div  style="font-size: 30px"> router </div>

    </div>

    <div class="mb-4">
      <el-button round>Round</el-button>
      <el-button type="primary" round>Primary</el-button>
      <el-button type="success" round @click="router.push('/test')">Push</el-button>
      <el-button type="success" round @click="router.replace('/test')">Replace</el-button>
      <el-button type="info" round @click="router.push({path: '/test', query: {id:35, name: 'ligang'}})">ID</el-button>
      <el-button type="warning" round>Warning</el-button>
      <el-button type="danger" round>Danger</el-button>
    </div>

    <div>
      <el-button :icon="Search" circle />
      <el-button type="primary" :icon="Edit" circle />
      <el-button type="success" :icon="Check" circle />
      <el-button type="info" :icon="Message" circle />
      <el-button type="warning" :icon="Star" circle />
      <el-button type="danger" :icon="Delete" circle />
    </div>

  </div>
</template>

<style scoped>

</style>
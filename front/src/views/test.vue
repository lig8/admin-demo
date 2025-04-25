<script setup>
import {reactive} from "vue";
import router from "../router";
const data = reactive({
  id: router.currentRoute.value.query.id,
  name: router.currentRoute.value.query.name,
})
// alert("id=" + data.id + " name = " + data.name);
</script>

<template>
  <div>
    <el-button @click="router.back()"> 返回 </el-button>
  </div>


  <div style="font-size: 30px">
    hello router
  </div>

  <div>

    <div class="" style="display: flex;">
      <button style="font-size: 30px"> 点我 </button>
      <div  style="font-size: 30px; width: 100px; height: 100px; background: hotpink; text-align: center; line-height: 100px;"> 点我 </div>
    </div>
    <div>
      <div  style="font-size: 30px"> router </div>
    </div>

  </div>
</template>

<style scoped>

</style>
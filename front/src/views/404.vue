<script setup>
  import router from "../router";
</script>

<template>
  <div class="el-result__icon" style="width: 200px; height: 200px; margin-left: 150px;">
    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1024 1024" class="icon-error">
      <path fill="currentColor" d="M512 64a448 448 0 1 1 0 896 448 448 0 0 1 0-896m0 393.664L407.936 353.6a38.4 38.4 0 1 0-54.336 54.336L457.664 512 353.6 616.064a38.4 38.4 0 1 0 54.336 54.336L512 566.336 616.064 670.4a38.4 38.4 0 1 0 54.336-54.336L566.336 512 670.4 407.936a38.4 38.4 0 1 0-54.336-54.336z">
      </path>
    </svg>
  </div>
  <div>
    <el-button @click="router.push('/home')"> 返回主页 </el-button>
  </div>
</template>

<style scoped>

</style>
<template>
  <div>
    <!-- 文件上传表单 -->
    <input type="file" @change="handleFileUpload" ref="fileInput">
    <button @click="uploadFile">上传文件</button>

    <!-- 显示上传结果 -->
    <div v-if="uploadResult">
      <p>文件名: {{ uploadResult.originalFilename }}</p>
      <p>新文件名: {{ uploadResult.filename }}</p>
      <p>消息: {{ uploadResult.message }}</p>
    </div>

    <!-- 显示错误信息 -->
    <div v-if="errorMessage" style="color: red;">
      {{ errorMessage }}
    </div>
  </div>
</template>

<script>

import {updateFile} from "@/utils/employeeApi.js";

export default {
  data() {
    return {
      selectedFile: null,
      uploadResult: null,
      errorMessage: null
    }
  },
  methods: {
    // 选择文件时的处理函数
    handleFileUpload(event) {
      this.selectedFile = event.target.files[0]
      this.errorMessage = null // 清除之前的错误信息
    },

    // 上传文件
    async uploadFile() {
      if (!this.selectedFile) {
        this.errorMessage = '请先选择文件'
        return
      }

      // 创建 FormData 对象
      const formData = new FormData()
      formData.append('file', this.selectedFile)

      try {
        const response = updateFile(formData)
        this.uploadResult = response.data
        this.errorMessage = null
        console.log('上传成功：', response.data)
      } catch (error) {
        console.error('上传失败：', error)
        // 更详细的错误处理
        if (error.response) {
          // 服务器返回了错误响应
          this.errorMessage = error.response.data?.error || '服务器返回错误'
        } else if (error.request) {
          // 请求发出但没有收到响应
          this.errorMessage = '无法连接到服务器'
        } else {
          // 请求配置出错
          this.errorMessage = '请求配置错误：' + error.message
        }
      }
    }
  }
}
</script>
<script setup>
import {reactive} from "vue";
import { Search }  from "@element-plus/icons-vue";
import {selectAll} from "@/utils/employeeApi.js";

const data = reactive({
  name: "请输入查询",
  pageNum: 1,
  pageSize: 13,
  total: 47,
  tableData: [
    {id:1, date:'2004-10-01', name:'李大头', address:"新疆乌鲁木齐"},
    {id:2, date:'2024-10-01', name:'王妹妹', address:"北京海淀"},
    {id:3, date:'2034-10-01', name:'李小天', address:"美国纽约"},
  ],
  employeeList: [],
})

data.employeeList = selectAll();
console.log('data.employeeList: ', data.employeeList);

</script>

<template>
  <div>
    <div class="card" style="margin-bottom:5px; margin-right: 10px">
      <el-input style="width: 240px" v-model="data.name" placeholder="查询" :prefix-icon="Search"/>
      <el-button type="primary" plain style="margin-left: 10px">查询</el-button>
      <el-button type="primary" plain >重置</el-button>
    </div>
    <div class="card" style="margin-bottom:5px">
      <el-button type="primary" plain style="margin-left: 10px">新增</el-button>
      <el-button type="primary" plain >批量删除</el-button>
      <el-button type="primary" plain >导入</el-button>
      <el-button type="primary" plain >导出</el-button>
    </div>
    <div class="card" style="margin-bottom:5px">
      <el-table :data='data.tableData' stripe>
        <el-table-column label="id" prop="id" />
        <el-table-column label="日期" prop="date" />
        <el-table-column label="名称" prop="name" />
        <el-table-column label="地址" prop="address" />
      </el-table>
      <div  style="margin-bottom:5px; margin-top: 10px">
        <el-pagination
          v-model:current-page="data.pageNum"
          v-model:page-size="data.pageSize"
          :page-sizes="[5,13,15,20]"
          background
          layout="total, sizes, prev, pager, next, jumper"
          :total="data.total"
        />
      </div>
    </div>

  </div>
</template>

<style scoped>

</style>
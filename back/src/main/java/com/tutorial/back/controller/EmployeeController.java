package com.tutorial.back.controller;
import com.tutorial.back.common.Result;
import com.tutorial.back.entity.Employee;
import com.tutorial.back.entity.PageQuery;
import com.tutorial.back.service.EmployeeService;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/employee")
public class EmployeeController {
    @Resource
    EmployeeService employeeService;

    @GetMapping
    public Result selectAll(){
        List<Employee> list = employeeService.selectAll();
        return Result.success(list);
    }
    
    @GetMapping("/{id}")
    public Result selectById(@PathVariable Integer id) {
        Employee employee = employeeService.selectById(id);
        return Result.success(employee);
    }

//  http://localhost:8080/employee/id?id=13
    @GetMapping("/id")
    public Result retrieveById(@RequestParam Integer id) {
        Employee employee = employeeService.selectById(id);
        return Result.success(employee);
    }
    
    @PostMapping
    public Result insert(@RequestBody Employee employee) {
        Employee savedEmployee = employeeService.insert(employee);
        return Result.success(savedEmployee);
    }
    
    @PutMapping
    public Result update(@RequestBody Employee employee) {
        Employee updatedEmployee = employeeService.update(employee);
        return Result.success(updatedEmployee);
    }
    
    @DeleteMapping("/delete/{id}")
    public Result deleteById(@PathVariable Integer id) {
        int rows = employeeService.deleteById(id);
        return Result.success(rows);
    }
    
    @DeleteMapping("/truncate")
    public Result deleteAll() {
        int rows = employeeService.deleteAll();
        return Result.success(rows);
    }
    
    @GetMapping("/testDB")
    public Result testDB() {
        Map<String, Object> dbInfo = employeeService.testDB();
        return Result.success(dbInfo);
    }
    
    @GetMapping("/page")
    public Result selectByPage(PageQuery pageQuery) {
        Map<String, Object> result = employeeService.selectByPage(pageQuery);
        return Result.success(result);
    }
    
    @DeleteMapping("/batch")
    public Result deleteBatch(@RequestBody List<Integer> ids) {
        int rows = employeeService.deleteBatch(ids);
        return Result.success(rows);
    }
    
    @GetMapping("/username/{username}")
    public Result selectByUsername(@PathVariable String username) {
        Employee employee = employeeService.selectByUsername(username);
        return Result.success(employee);
    }
    
    @PostMapping("/login")
    public Result login(@RequestBody Map<String, String> loginForm) {
        String username = loginForm.get("username");
        String password = loginForm.get("password");
        Employee employee = employeeService.login(username, password);
        return Result.success(employee);
    }
}

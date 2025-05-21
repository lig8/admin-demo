package com.tutorial.back.controller;

import com.tutorial.back.common.Result;
import com.tutorial.back.entity.Employee;
import com.tutorial.back.exception.CustomException;
import com.tutorial.back.service.EmployeeService;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/web")
public class WebController {
    
    @Resource
    private EmployeeService employeeService;
    
    @PostMapping("/login")
    public Result login(@RequestBody Employee employee) {
        // 参数非空检查
        if (employee == null) {
            throw new CustomException("登录信息不能为空");
        }
        if (employee.getUsername() == null || employee.getUsername().trim().isEmpty()) {
            throw new CustomException("用户名不能为空");
        }
        if (employee.getPassword() == null || employee.getPassword().trim().isEmpty()) {
            throw new CustomException("密码不能为空");
        }
        
        // 查询用户信息
        Employee dbEmployee = employeeService.selectByUsername(employee.getUsername());
        if (dbEmployee == null) {
            throw new CustomException("用户不存在");
        }
        
        // 验证密码
        if (!employee.getPassword().equals(dbEmployee.getPassword())) {
            throw new CustomException("密码错误");
        }
        
        // 登录成功，返回用户信息（注意：实际项目中应该去除敏感信息）
        return Result.success(dbEmployee);
    }

    @PostMapping("/regist")
    public Result regist(@RequestBody Employee employee) {
        // 参数非空检查
        if (employee == null) {
            throw new CustomException("注册信息不能为空");
        }
        if (employee.getUsername() == null || employee.getUsername().trim().isEmpty()) {
            throw new CustomException("用户名不能为空");
        }
        if (employee.getPassword() == null || employee.getPassword().trim().isEmpty()) {
            throw new CustomException("密码不能为空");
        }

        // 查询用户信息
        Employee dbEmployee = employeeService.selectByUsername(employee.getUsername());
        if (dbEmployee != null) {
            throw new CustomException("用户已存在");
        }

        Employee savedEmployee = employeeService.insert(employee);
        return Result.success(savedEmployee);
    }
}
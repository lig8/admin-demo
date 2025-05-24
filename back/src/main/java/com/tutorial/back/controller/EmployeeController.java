package com.tutorial.back.controller;
import cn.hutool.core.lang.Console;
import com.tutorial.back.common.Result;
import com.tutorial.back.entity.Employee;
import com.tutorial.back.entity.PageQuery;
import com.tutorial.back.entity.UpdatePass;
import com.tutorial.back.exception.CustomException;
import com.tutorial.back.service.EmployeeService;
import jakarta.annotation.Resource;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@Slf4j
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
    
    @PostMapping("/signin")
    public Result signin(@RequestBody Map<String, String> loginForm) {
        String username = loginForm.get("username");
        String password = loginForm.get("password");
        Employee employee = employeeService.login(username, password);
        return Result.success(employee);
    }

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

    @PostMapping("/updatePass")
    public Result updatePass(@RequestBody UpdatePass updatePass) {
        // 参数非空检查
        if (updatePass == null) {
            throw new CustomException("修改密码信息不能为空");
        }
        if (updatePass.getUsername() == null || updatePass.getUsername().trim().isEmpty()) {
            throw new CustomException("用户名不能为空");
        }
        if (updatePass.getPassword() == null || updatePass.getPassword().trim().isEmpty()) {
            throw new CustomException("原密码不能为空");
        }
        if (updatePass.getNewPass() == null || updatePass.getNewPass().trim().isEmpty()) {
            throw new CustomException("新密码不能为空");
        }

        // 查询用户信息
        Employee employee = employeeService.selectByUsername(updatePass.getUsername());
        if (employee == null) {
            throw new CustomException("用户不存在");
        }

        // 验证原密码
        if (!updatePass.getPassword().equals(employee.getPassword())) {
            throw new CustomException("原密码错误");
        }

        // 更新密码
        employee.setPassword(updatePass.getNewPass());
        Console.log(updatePass.getNewPass());
        Console.log(employee);
        Console.log(employeeService.update(employee));
        return Result.success("密码修改成功");
    }
}

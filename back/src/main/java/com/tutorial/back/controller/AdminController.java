package com.tutorial.back.controller;

import com.tutorial.back.common.Result;
import com.tutorial.back.entity.Admin;
import com.tutorial.back.entity.PageQuery;
import com.tutorial.back.entity.UpdatePass;
import com.tutorial.back.exception.CustomException;
import com.tutorial.back.service.AdminService;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/admin")
public class AdminController {
    @Resource
    private AdminService adminService;

    @GetMapping
    public Result selectAll() {
        List<Admin> list = adminService.selectAll();
        return Result.success(list);
    }
    
    @GetMapping("/{id}")
    public Result selectById(@PathVariable Integer id) {
        Admin admin = adminService.selectById(id);
        return Result.success(admin);
    }

    @GetMapping("/id")
    public Result retrieveById(@RequestParam Integer id) {
        Admin admin = adminService.selectById(id);
        return Result.success(admin);
    }
    
    @PostMapping
    public Result insert(@RequestBody Admin admin) {
        Admin savedAdmin = adminService.insert(admin);
        return Result.success(savedAdmin);
    }
    
    @PutMapping
    public Result update(@RequestBody Admin admin) {
        Admin updatedAdmin = adminService.update(admin);
        return Result.success(updatedAdmin);
    }
    
    @DeleteMapping("/delete/{id}")
    public Result deleteById(@PathVariable Integer id) {
        int rows = adminService.deleteById(id);
        return Result.success(rows);
    }
    
    @DeleteMapping("/truncate")
    public Result deleteAll() {
        int rows = adminService.deleteAll();
        return Result.success(rows);
    }
    
    @GetMapping("/testDB")
    public Result testDB() {
        Map<String, Object> dbInfo = adminService.testDB();
        return Result.success(dbInfo);
    }
    
    @GetMapping("/page")
    public Result selectByPage(PageQuery pageQuery) {
        Map<String, Object> result = adminService.selectByPage(pageQuery);
        return Result.success(result);
    }
    
    @DeleteMapping("/batch")
    public Result deleteBatch(@RequestBody List<Integer> ids) {
        int rows = adminService.deleteBatch(ids);
        return Result.success(rows);
    }
    
    @GetMapping("/username/{username}")
    public Result selectByUsername(@PathVariable String username) {
        Admin admin = adminService.selectByUsername(username);
        return Result.success(admin);
    }
    
    @PostMapping("/signin")
    public Result signin(@RequestBody Map<String, String> loginForm) {
        String username = loginForm.get("username");
        String password = loginForm.get("password");
        Admin admin = adminService.login(username, password);
        return Result.success(admin);
    }

    @PostMapping("/login")
    public Result login(@RequestBody Admin admin) {
        // 参数非空检查
        if (admin == null) {
            throw new CustomException("登录信息不能为空");
        }
        if (admin.getUsername() == null || admin.getUsername().trim().isEmpty()) {
            throw new CustomException("用户名不能为空");
        }
        if (admin.getPassword() == null || admin.getPassword().trim().isEmpty()) {
            throw new CustomException("密码不能为空");
        }

        // 查询用户信息
        Admin dbAdmin= adminService.selectByUsername(admin.getUsername());
        if (dbAdmin == null) {
            throw new CustomException("用户不存在");
        }

        // 验证密码
        if (!admin.getPassword().equals(dbAdmin.getPassword())) {
            throw new CustomException("密码错误");
        }

        // 登录成功，返回用户信息（注意：实际项目中应该去除敏感信息）
        return Result.success(dbAdmin);
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
        Admin admin = adminService.selectByUsername(updatePass.getUsername());
        if (admin == null) {
            throw new CustomException("用户不存在");
        }

        // 验证原密码
        if (!updatePass.getPassword().equals(admin.getPassword())) {
            throw new CustomException("原密码错误");
        }

        // 更新密码
        admin.setPassword(updatePass.getNewPass());
        adminService.update(admin);
        return Result.success("密码修改成功");
    }
} 
package com.tutorial.back.service;

import com.tutorial.back.entity.Admin;
import com.tutorial.back.entity.PageQuery;
import com.tutorial.back.exception.CustomException;
import com.tutorial.back.mapper.AdminMapper;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.HashMap;

@Service
public class AdminService {
    @Resource
    private AdminMapper adminMapper;

    public List<Admin> selectAll() {
        return adminMapper.selectAll();
    }
    
    public Admin selectById(Integer id) {
        return adminMapper.selectById(id);
    }
    
    public Admin insert(Admin admin) {
        // 校验对象是否为空
        if (admin == null) {
            throw new CustomException("管理员信息不能为空");
        }
        
        // 校验必填字段
        if (admin.getUsername() == null || admin.getUsername().trim().isEmpty()) {
            throw new CustomException("用户名不能为空");
        }
        if (admin.getEn() == null || admin.getEn().trim().isEmpty()) {
            throw new CustomException("员工编号不能为空");
        }
        
        // 设置默认值
        if (admin.getPassword() == null || admin.getPassword().trim().isEmpty()) {
            admin.setPassword("123");
        }
        if (admin.getName() == null || admin.getName().trim().isEmpty()) {
            admin.setName(admin.getUsername());
        }
        // 判断role是否为'ADMIN'，如果不是则设置
        if (!"ADMIN".equals(admin.getRole())) {
            admin.setRole("ADMIN");
        }
        
        adminMapper.insert(admin);
        return admin;
    }
    
    public Admin update(Admin admin) {
        // 校验数据是否存在
        Admin existingAdmin = adminMapper.selectById(admin.getId());
        if (existingAdmin == null) {
            throw new CustomException("管理员不存在");
        }
        
        // 只更新变化的字段
        if (admin.getUsername() != null && !admin.getUsername().equals(existingAdmin.getUsername())) {
            existingAdmin.setUsername(admin.getUsername());
        }
        if (admin.getPassword() != null && !admin.getPassword().equals(existingAdmin.getPassword())) {
            existingAdmin.setPassword(admin.getPassword());
        }
        if (admin.getRole() != null && !admin.getRole().equals(existingAdmin.getRole())) {
            existingAdmin.setRole(admin.getRole());
        }
        if (admin.getName() != null && !admin.getName().equals(existingAdmin.getName())) {
            existingAdmin.setName(admin.getName());
        }
        if (admin.getEn() != null && !admin.getEn().equals(existingAdmin.getEn())) {
            existingAdmin.setEn(admin.getEn());
        }
        if (admin.getAvatar() != null && !admin.getAvatar().equals(existingAdmin.getAvatar())) {
            existingAdmin.setAvatar(admin.getAvatar());
        }
        
        adminMapper.update(existingAdmin);
        return existingAdmin;
    }
    
    public int deleteById(Integer id) {
        return adminMapper.deleteById(id);
    }
    
    public int deleteAll() {
        return adminMapper.deleteAll();
    }
    
    public Map<String, Object> testDB() {
        return adminMapper.testDB();
    }
    
    public Map<String, Object> selectByPage(PageQuery pageQuery) {
        Map<String, Object> result = new HashMap<>();
        result.put("records", adminMapper.selectByPage(pageQuery));
        result.put("total", adminMapper.selectCount(pageQuery));
        return result;
    }
    
    public int deleteBatch(List<Integer> ids) {
        if (ids == null || ids.isEmpty()) {
            throw new CustomException("删除的ID列表不能为空");
        }
        return adminMapper.deleteBatch(ids);
    }
    
    public Admin selectByUsername(String username) {
        if (username == null || username.trim().isEmpty()) {
            throw new CustomException("用户名不能为空");
        }
        return adminMapper.selectByUsername(username);
    }
    
    public Admin login(String username, String password) {
        if (username == null || username.trim().isEmpty()) {
            throw new CustomException("用户名不能为空");
        }
        if (password == null || password.trim().isEmpty()) {
            throw new CustomException("密码不能为空");
        }
        
        Admin admin = adminMapper.login(username, password);
        if (admin == null) {
            throw new CustomException("用户名或密码错误");
        }
        return admin;
    }
} 
package com.tutorial.back.service;

import com.tutorial.back.entity.Employee;
import com.tutorial.back.entity.PageQuery;
import com.tutorial.back.exception.CustomException;
import com.tutorial.back.mapper.EmployeeMapper;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.HashMap;

@Service
public class EmployeeService {
    @Resource
    private EmployeeMapper employeeMapper;

    public List<Employee> selectAll() {
        return employeeMapper.selectAll();
    }
    
    public Employee selectById(Integer id) {
        return employeeMapper.selectById(id);
    }
    
    public Employee insert(Employee employee) {
        employeeMapper.insert(employee);
        return employee;
    }
    
    public Employee update(Employee employee) {
        // 校验数据是否存在
        Employee existingEmployee = employeeMapper.selectById(employee.getId());
        if (existingEmployee == null) {
            throw new CustomException("员工不存在");
        }
        
        // 只更新变化的字段
        if (employee.getUsername() != null && !employee.getUsername().equals(existingEmployee.getUsername())) {
            existingEmployee.setUsername(employee.getUsername());
        }
        if (employee.getPassword() != null && !employee.getPassword().equals(existingEmployee.getPassword())) {
            existingEmployee.setPassword(employee.getPassword());
        }
        if (employee.getRole() != null && !employee.getRole().equals(existingEmployee.getRole())) {
            existingEmployee.setRole(employee.getRole());
        }
        if (employee.getName() != null && !employee.getName().equals(existingEmployee.getName())) {
            existingEmployee.setName(employee.getName());
        }
        if (employee.getGender() != null && !employee.getGender().equals(existingEmployee.getGender())) {
            existingEmployee.setGender(employee.getGender());
        }
        if (employee.getEn() != null && !employee.getEn().equals(existingEmployee.getEn())) {
            existingEmployee.setEn(employee.getEn());
        }
        if (employee.getAge() != null && !employee.getAge().equals(existingEmployee.getAge())) {
            existingEmployee.setAge(employee.getAge());
        }
        if (employee.getDescr() != null && !employee.getDescr().equals(existingEmployee.getDescr())) {
            existingEmployee.setDescr(employee.getDescr());
        }
        if (employee.getDepartment() != null && !employee.getDepartment().equals(existingEmployee.getDepartment())) {
            existingEmployee.setDepartment(employee.getDepartment());
        }
        if (employee.getAvatar() != null && !employee.getAvatar().equals(existingEmployee.getAvatar())) {
            existingEmployee.setAvatar(employee.getAvatar());
        }
        
        employeeMapper.update(existingEmployee);
        return existingEmployee;
    }
    
    public int deleteById(Integer id) {
        return employeeMapper.deleteById(id);
    }
    
    public int deleteAll() {
        return employeeMapper.deleteAll();
    }
    
    public Map<String, Object> testDB() {
        return employeeMapper.testDB();
    }
    
    public Map<String, Object> selectByPage(PageQuery pageQuery) {
        Map<String, Object> result = new HashMap<>();
        result.put("records", employeeMapper.selectByPage(pageQuery));
        result.put("total", employeeMapper.selectCount(pageQuery));
        return result;
    }
    
    public int deleteBatch(List<Integer> ids) {
        if (ids == null || ids.isEmpty()) {
            throw new CustomException("删除的ID列表不能为空");
        }
        return employeeMapper.deleteBatch(ids);
    }
    
    public Employee selectByUsername(String username) {
        if (username == null || username.trim().isEmpty()) {
            throw new CustomException("用户名不能为空");
        }
        return employeeMapper.selectByUsername(username);
    }
    
    public Employee login(String username, String password) {
        if (username == null || username.trim().isEmpty()) {
            throw new CustomException("用户名不能为空");
        }
        if (password == null || password.trim().isEmpty()) {
            throw new CustomException("密码不能为空");
        }
        
        Employee employee = employeeMapper.login(username, password);
        if (employee == null) {
            throw new CustomException("用户名或密码错误");
        }
        return employee;
    }
}

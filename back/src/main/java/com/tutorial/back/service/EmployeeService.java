package com.tutorial.back.service;

import com.tutorial.back.entity.Employee;
import com.tutorial.back.entity.PageQuery;
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
            throw new RuntimeException("员工不存在");
        }
        
        // 只更新变化的字段
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
        result.put("total", employeeMapper.selectCount());
        return result;
    }
}

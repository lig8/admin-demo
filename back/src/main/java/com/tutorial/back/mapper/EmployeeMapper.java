package com.tutorial.back.mapper;
import com.tutorial.back.entity.Employee;
import com.tutorial.back.entity.PageQuery;
import java.util.List;
import java.util.Map;

public interface EmployeeMapper {
    List<Employee> selectAll();
    int insert(Employee employee);
    int update(Employee employee);
    Employee selectById(Integer id);
    Employee selectByUsername(String username);
    Employee login(String username, String password);
    int deleteById(Integer id);
    int deleteAll();
    Map<String, Object> testDB();
    List<Employee> selectByPage(PageQuery pageQuery);
    int selectCount(PageQuery pageQuery);
    int deleteBatch(List<Integer> ids);
}

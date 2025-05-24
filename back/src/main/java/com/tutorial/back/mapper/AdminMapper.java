package com.tutorial.back.mapper;
import com.tutorial.back.entity.Admin;
import com.tutorial.back.entity.PageQuery;
import java.util.List;
import java.util.Map;

public interface AdminMapper {
    List<Admin> selectAll();
    int insert(Admin admin);
    int update(Admin admin);
    Admin selectById(Integer id);
    Admin selectByUsername(String username);
    Admin login(String username, String password);
    int deleteById(Integer id);
    int deleteAll();
    Map<String, Object> testDB();
    List<Admin> selectByPage(PageQuery pageQuery);
    int selectCount(PageQuery pageQuery);
    int deleteBatch(List<Integer> ids);
} 
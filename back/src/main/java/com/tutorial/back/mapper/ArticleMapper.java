package com.tutorial.back.mapper;

import com.tutorial.back.entity.Article;
import com.tutorial.back.entity.PageQuery;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

@Mapper
public interface ArticleMapper {
    List<Article> selectAll();
    
    Article selectById(@Param("id") Integer id);
    
    int insert(Article article);
    
    int update(Article article);
    
    int deleteById(@Param("id") Integer id);
    
    int deleteAll();
    
    Map<String, Object> testDB();
    
    List<Article> selectByPage(PageQuery pageQuery);
    
    int selectCount(PageQuery pageQuery);
    
    int deleteBatch(@Param("ids") List<Integer> ids);
    
    Article selectByTitle(@Param("title") String title);
} 
package com.tutorial.back.service;

import com.tutorial.back.entity.Article;
import com.tutorial.back.entity.PageQuery;
import com.tutorial.back.exception.CustomException;
import com.tutorial.back.mapper.ArticleMapper;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.HashMap;

@Service
public class ArticleService {
    @Resource
    private ArticleMapper articleMapper;

    public List<Article> selectAll() {
        return articleMapper.selectAll();
    }
    
    public Article selectById(Integer id) {
        return articleMapper.selectById(id);
    }
    
    public Article insert(Article article) {
        // 校验对象是否为空
        if (article == null) {
            throw new CustomException("文章信息不能为空");
        }
        
        // 校验必填字段
        if (article.getTitle() == null || article.getTitle().trim().isEmpty()) {
            throw new CustomException("标题不能为空");
        }
        if (article.getContent() == null || article.getContent().trim().isEmpty()) {
            throw new CustomException("内容不能为空");
        }
        
        articleMapper.insert(article);
        return article;
    }
    
    public Article update(Article article) {
        // 校验数据是否存在
        Article existingArticle = articleMapper.selectById(article.getId());
        if (existingArticle == null) {
            throw new CustomException("文章不存在");
        }
        
        // 只更新变化的字段
        if (article.getTitle() != null && !article.getTitle().equals(existingArticle.getTitle())) {
            existingArticle.setTitle(article.getTitle());
        }
        if (article.getImg() != null && !article.getImg().equals(existingArticle.getImg())) {
            existingArticle.setImg(article.getImg());
        }
        if (article.getDescription() != null && !article.getDescription().equals(existingArticle.getDescription())) {
            existingArticle.setDescription(article.getDescription());
        }
        if (article.getContent() != null && !article.getContent().equals(existingArticle.getContent())) {
            existingArticle.setContent(article.getContent());
        }
        if (article.getUpdateTime() != null && !article.getUpdateTime().equals(existingArticle.getUpdateTime())) {
            existingArticle.setUpdateTime(article.getUpdateTime());
        }
        
        articleMapper.update(existingArticle);
        return existingArticle;
    }
    
    public int deleteById(Integer id) {
        return articleMapper.deleteById(id);
    }
    
    public int deleteAll() {
        return articleMapper.deleteAll();
    }
    
    public Map<String, Object> testDB() {
        return articleMapper.testDB();
    }
    
    public Map<String, Object> selectByPage(PageQuery pageQuery) {
        Map<String, Object> result = new HashMap<>();
        result.put("records", articleMapper.selectByPage(pageQuery));
        result.put("total", articleMapper.selectCount(pageQuery));
        return result;
    }
    
    public int deleteBatch(List<Integer> ids) {
        if (ids == null || ids.isEmpty()) {
            throw new CustomException("删除的ID列表不能为空");
        }
        return articleMapper.deleteBatch(ids);
    }
    
    public Article selectByTitle(String title) {
        if (title == null || title.trim().isEmpty()) {
            throw new CustomException("标题不能为空");
        }
        return articleMapper.selectByTitle(title);
    }
} 
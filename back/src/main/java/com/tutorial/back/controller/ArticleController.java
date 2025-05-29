package com.tutorial.back.controller;

import com.tutorial.back.common.Result;
import com.tutorial.back.entity.Article;
import com.tutorial.back.entity.PageQuery;
import com.tutorial.back.service.ArticleService;
import jakarta.annotation.Resource;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@Slf4j
@RestController
@RequestMapping("/article")
public class ArticleController {
    @Resource
    ArticleService articleService;

    @GetMapping
    public Result selectAll() {
        List<Article> list = articleService.selectAll();
        return Result.success(list);
    }
    
    @GetMapping("/{id}")
    public Result selectById(@PathVariable Integer id) {
        Article article = articleService.selectById(id);
        return Result.success(article);
    }

    @GetMapping("/id")
    public Result retrieveById(@RequestParam Integer id) {
        Article article = articleService.selectById(id);
        return Result.success(article);
    }
    
    @PostMapping
    public Result insert(@RequestBody Article article) {
        Article savedArticle = articleService.insert(article);
        return Result.success(savedArticle);
    }
    
    @PutMapping
    public Result update(@RequestBody Article article) {
        Article updatedArticle = articleService.update(article);
        return Result.success(updatedArticle);
    }
    
    @DeleteMapping("/delete/{id}")
    public Result deleteById(@PathVariable Integer id) {
        int rows = articleService.deleteById(id);
        return Result.success(rows);
    }
    
    @DeleteMapping("/truncate")
    public Result deleteAll() {
        int rows = articleService.deleteAll();
        return Result.success(rows);
    }
    
    @GetMapping("/testDB")
    public Result testDB() {
        Map<String, Object> dbInfo = articleService.testDB();
        return Result.success(dbInfo);
    }
    
    @GetMapping("/page")
    public Result selectByPage(PageQuery pageQuery) {
        Map<String, Object> result = articleService.selectByPage(pageQuery);
        return Result.success(result);
    }
    
    @DeleteMapping("/batch")
    public Result deleteBatch(@RequestBody List<Integer> ids) {
        int rows = articleService.deleteBatch(ids);
        return Result.success(rows);
    }
    
    @GetMapping("/title/{title}")
    public Result selectByTitle(@PathVariable String title) {
        Article article = articleService.selectByTitle(title);
        return Result.success(article);
    }
} 
package com.tutorial.back.entity;
import lombok.Data;

@Data
public class PageQuery {
    private Integer pageNum = 1;
    private Integer pageSize = 10;
    private String search;  // 模糊搜索参数
    
    public Integer getOffset() {
        return (pageNum - 1) * pageSize;
    }
} 
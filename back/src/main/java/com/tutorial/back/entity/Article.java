package com.tutorial.back.entity;
import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class Article {
    private Integer id;
    private String title;
    private String img;
    private String description;
    private String content;
    private String createTime;
    private String updateTime;
}

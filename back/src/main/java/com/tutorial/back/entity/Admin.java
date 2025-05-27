package com.tutorial.back.entity;
import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class Admin {
    private Integer id;
    private String username;
    private String password;
    private String role;
    private String name;
    private String en;
    private String avatar;
}

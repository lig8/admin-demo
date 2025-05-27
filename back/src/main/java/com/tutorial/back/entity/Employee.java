package com.tutorial.back.entity;
import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class Employee {
    private Integer id;
    private String username;
    private String password;
    private String role;
    private String name;
    private String gender;
    private String en;
    private Integer age;
    private String descr;
    private Integer department;
    private String avatar;
}

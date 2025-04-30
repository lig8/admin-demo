package com.tutorial.back.entity;
import lombok.Data;
import lombok.ToString;

@Data
public class Employee {
    private Integer id;
    private String name;
    private String gender;
    private String en;
    private Integer age;
    private String descr;
    private Integer department;

}

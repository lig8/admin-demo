package com.tutorial.back.controller;

import com.tutorial.back.common.Result;
import com.tutorial.back.entity.Employee;
import com.tutorial.back.exception.CustomException;
import com.tutorial.back.service.EmployeeService;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/web")
public class WebController {
    
    @Resource
    private EmployeeService employeeService;

}
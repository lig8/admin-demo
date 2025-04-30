package com.tutorial.back.controller;

import com.tutorial.back.common.Result;
import com.tutorial.back.exception.CustomException;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;

@RestController
public class TestController {
    @GetMapping("/hello")
    public String hello() {
        return "hello";
    }

    @GetMapping("/map")
    public Result map() {
        HashMap<String,Object> map = new HashMap<>();
        map.put("name","ligang");
        map.put("age",45);
        return Result.success(map);
    }

    @GetMapping("/count")
    public Result count() {
//        int a = 1 / 0;
        if (true) {
            throw new CustomException("系统请求错误！！！");
        }else {
            return Result.success(200);
        }
    }
}


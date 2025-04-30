package com.tutorial.back.exception;
import com.tutorial.back.common.Result;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

@ControllerAdvice("com.tutorial.back.controller")
public class GlobalExceptionHandler {
    @ExceptionHandler(Exception.class)
    @ResponseBody   // output by jason
    public Result error(Exception e){
        e.printStackTrace();
        return Result.error(e);
    }

    @ExceptionHandler(CustomException.class)
    @ResponseBody   // output by jason
    public Result error(CustomException e){
        return Result.error(e);
    }
}

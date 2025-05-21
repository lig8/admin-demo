package com.tutorial.back.common;
import com.tutorial.back.exception.CustomException;
import lombok.Data;

@Data
public class Result {
    private String code;
    private String msg;
    private Object data;

    public static Result success() {
        Result result = new Result();
        result.setCode("200");
        result.setMsg("success");
        return result;
    }

    public static Result success(Object data) {
        Result result = Result.success();
        result.setData(data);
        return result;
    }

    public static Result error(Exception e) {
        Result result = new Result();
        result.setCode("500");
        result.setMsg("Exception Throwing !!!!!");
        result.setData(e);
        return result;
    }

    public static Result error(CustomException e) {
        Result result = new Result();
        result.setCode("500");
        result.setMsg(e.getReason());
        result.setData(e);
        return result;
    }

    public static Result error(String msg) {
        Result result = new Result();
        result.setCode("500");
        result.setMsg(msg);
        return result;
    }
}

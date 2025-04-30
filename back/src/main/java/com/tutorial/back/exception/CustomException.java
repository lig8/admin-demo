package com.tutorial.back.exception;
import lombok.Data;

@Data
public class CustomException extends RuntimeException {
    private String reason;
    public CustomException(String r) {
        this.reason = r;
    }
}

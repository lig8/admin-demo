package com.tutorial.back.entity;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class UpdatePass {
    private String username;
    private String password;
    private String newPass;
}

package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @project: demo
 * @author: wangchengda
 * @email: wangchengda1990@gmail.com
 * @date: 2019-05-09
 * @Description:
 * @Copyright: 2019 broderickwang.github.io Inc. All rights reserved.
 * @version: V1.0
 */
@RestController
public class TestController {

    @GetMapping("/test")
    public String test(){
        return "test";
    }
}

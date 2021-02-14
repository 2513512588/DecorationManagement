package com.runnersoftware.decoration.controller;

import io.swagger.annotations.Api;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Api(tags = {"视图控制器"})
@Controller
public class ViewController {

    @GetMapping("/index")
    public String index(){
        return "backstage/index";
    }

}

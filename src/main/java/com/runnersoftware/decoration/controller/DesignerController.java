package com.runnersoftware.decoration.controller;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author HHY
 */
@Api(tags = {"设计师管理"})
@Controller
@RequestMapping("/designer")
public class DesignerController {

    @ApiOperation("查找所有设计师数据")
    @PostMapping("/index")
    public String findAll(Model model){
        model.addAttribute("","");
        return "index";
    }





}

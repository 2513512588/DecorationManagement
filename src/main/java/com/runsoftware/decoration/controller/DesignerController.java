package com.runsoftware.decoration.controller;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author HHY
 */
@Api(tags = {"设计师管理"})
@Controller
@RequestMapping("/designer")
public class DesignerController {

    @ApiOperation("查找所有设计师数据")
    @RequestMapping("/findAll")
    public String findAll(){
        return "";
    }


}

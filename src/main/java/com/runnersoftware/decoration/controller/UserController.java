package com.runnersoftware.decoration.controller;


import com.runnersoftware.decoration.model.User;
import com.runnersoftware.decoration.service.UserService;
import com.runnersoftware.decoration.utils.R;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;


@Api(tags = {"用户管理"})
@RestController
@RequestMapping("/user")
public class UserController {

    private UserService userService;

    @Autowired
    public void setUserService(UserService userService) {
        this.userService = userService;
    }


    @ApiOperation("查找所有用户数据")
    @GetMapping("/query")
    public R findAll(@RequestParam("page") int pageNum , @RequestParam("limit") int pageSize){
        Map<String, Object> params = new HashMap<String, Object>(2);
        params.put("pageNum", pageNum);
        params.put("pageSize", pageSize);
        return R.ok().data(userService.findAllByPage(params));
    }

    @ApiOperation("更新用户数据")
    @PostMapping("/update")
    public R updateModel(User user) {
        return R.auto(userService.update(user));
    }

}

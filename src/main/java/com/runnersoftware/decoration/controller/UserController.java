package com.runnersoftware.decoration.controller;


import com.runnersoftware.decoration.model.User;
import com.runnersoftware.decoration.model.VerificationCode;
import com.runnersoftware.decoration.service.UserService;
import com.runnersoftware.decoration.utils.R;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
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
    public R findAll(@RequestParam(value = "page",defaultValue = "1",required = false) int pageNum ,
                     @RequestParam(value = "limit",defaultValue = "10",required = false) int pageSize){
        Map<String, Object> params = new HashMap<String, Object>(2);
        params.put("pageNum", pageNum);
        params.put("pageSize", pageSize);
        return R.ok().data(userService.findAllByPage(params));
    }

    @ApiOperation("根据id查找用户")
    @PostMapping("/query/{id}")
    public R findById(@PathVariable Long id){
        return R.ok().data("designer", userService.findById(id));
    }


    @ApiOperation("添加用户")
    @PostMapping("/create")
    public R insertModel(User user) {
        return R.auto(userService.createUser(user));
    }

    @ApiOperation("用户注册")
    @PostMapping("/register")
    public R register(User user, @RequestParam String code , HttpSession session){
        VerificationCode verificationCode = (VerificationCode) session.getAttribute("code");
        session.removeAttribute("code");
        if (!verificationCode.isExpired()){
            if (verificationCode.getCode().equals(code)){
                return R.auto(userService.createUser(user));
            }else{
                return R.error().message("验证码错误!");
            }
        }else{
            return R.error().message("验证码已过期!");
        }
    }

    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @ApiOperation("删除用户数据")
    @GetMapping("/remove/{id}")
    public R removeModel(@PathVariable Long id){
        return R.auto(userService.removeById(id));
    }

    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @ApiOperation("更新用户数据")
    @PostMapping("/update")
    public R updateModel(User user) {
        return R.auto(userService.update(user));
    }

}

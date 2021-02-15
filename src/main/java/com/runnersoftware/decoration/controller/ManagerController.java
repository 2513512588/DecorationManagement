package com.runnersoftware.decoration.controller;

import com.runnersoftware.decoration.model.User;
import com.runnersoftware.decoration.model.dto.SecurityUser;
import com.runnersoftware.decoration.utils.ManagerProperties;
import com.runnersoftware.decoration.utils.R;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Arrays;

@Api(tags = {"管理员管理"})
@RestController
@RequestMapping("/manager")
public class ManagerController {

    private ManagerProperties managerProperties;

    private PasswordEncoder passwordEncoder;

    @Autowired
    public void setPasswordEncoder(PasswordEncoder passwordEncoder) {
        this.passwordEncoder = passwordEncoder;
    }

    @Autowired
    public void setManagerProperties(ManagerProperties managerProperties) {
        this.managerProperties = managerProperties;
    }


    @Qualifier("simpleAuthenticationManager")
    @Autowired
    private AuthenticationManager authenticationManager;

    @ApiOperation("管理员登录")
    @PostMapping("/login")
    public R login(User user){
        if (managerProperties.getUsername().equals(user.getUsername()) && passwordEncoder.matches(user.getPassword(), managerProperties.getPassword())){
            UsernamePasswordAuthenticationToken authReq =
                    new UsernamePasswordAuthenticationToken(new SecurityUser(user, Arrays.asList(new SimpleGrantedAuthority("ROLE_USER"),new SimpleGrantedAuthority("ROLE_ADMIN"))), passwordEncoder.encode(user.getPassword()));
            Authentication result = authenticationManager.authenticate(authReq);
            SecurityContextHolder.getContext().setAuthentication(result);
            return R.ok();
        }else {
            return R.error();
        }
    }

}

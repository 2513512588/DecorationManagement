package com.runnersoftware.decoration.service.Impl;

import com.runnersoftware.decoration.service.UserService;
import com.runnersoftware.decoration.mapper.UserMapper;
import com.runnersoftware.decoration.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {

    private UserMapper userMapper;

    @Autowired
    public void setUserMapper(UserMapper userMapper) {
        this.userMapper = userMapper;
    }

    public UserDetails loadUserByUsername(String s) throws UsernameNotFoundException {
        User user = userMapper.find(new User().setUsername(s)).get(0);
        return null;
    }
}

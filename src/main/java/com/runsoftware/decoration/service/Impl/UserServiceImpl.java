package com.runsoftware.decoration.service.Impl;

import com.runsoftware.decoration.service.UserService;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {


    public UserDetails loadUserByUsername(String s) throws UsernameNotFoundException {
        return null;
    }
}

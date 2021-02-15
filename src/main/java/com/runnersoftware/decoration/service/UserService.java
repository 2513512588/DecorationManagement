package com.runnersoftware.decoration.service;

import com.runnersoftware.decoration.model.User;
import org.springframework.security.core.userdetails.UserDetailsService;

import java.util.Map;


public interface UserService extends UserDetailsService {

    Boolean update(User user);

    Boolean removeById(Long id);

    Boolean createUser(User user);

    Map<String, Object> findAllByPage(Map<String, Object> params);

    User findById(Long id);
}

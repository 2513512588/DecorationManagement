package com.runnersoftware.decoration.service.Impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.runnersoftware.decoration.service.DesignerService;
import com.runnersoftware.decoration.service.UserService;
import com.runnersoftware.decoration.mapper.UserMapper;
import com.runnersoftware.decoration.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class UserServiceImpl implements UserService {

    private UserMapper userMapper;
    private DesignerService designerService;

    @Autowired
    public void setUserMapper(UserMapper userMapper) {
        this.userMapper = userMapper;
    }

    @Autowired
    public void setDesignerService(DesignerService designerService) {
        this.designerService = designerService;
    }

    public UserDetails loadUserByUsername(String s) throws UsernameNotFoundException {
        User user = userMapper.find(new User().setUsername(s)).get(0);
        return null;
    }

    @Autowired
    private PasswordEncoder passwordEncoder;

    public Boolean update(User user) {
        return userMapper.update(user.setPassword(passwordEncoder.encode(user.getPassword()))) != 0;
    }


    public Boolean removeById(Long id) {
        designerService.removeById(id);
        return userMapper.delete(new User().setId(id)) != 0;
    }

    public Boolean createUser(User user) {
        return userMapper.insert(user.setPassword(passwordEncoder.encode(user.getPassword()))) != 0;
    }

    public Map<String, Object> findAllByPage(Map<String, Object> params) {
        Map<String, Object> map = new HashMap<String, Object>(2);
        Page<User> page = PageHelper.startPage(Integer.parseInt(params.get("pageNum").toString()),Integer.parseInt(params.get("pageSize").toString()));
        List<User> designers = userMapper.find((User) params.get("data"));
        map.put("rows", designers);
        map.put("count", page.getTotal());
        return map;
    }

    public User findById(Long id) {
        return userMapper.find(new User().setId(id)).get(0);
    }
}

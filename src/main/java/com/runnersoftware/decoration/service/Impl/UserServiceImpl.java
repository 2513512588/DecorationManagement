package com.runnersoftware.decoration.service.Impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.runnersoftware.decoration.mapper.DesignerMapper;
import com.runnersoftware.decoration.model.Designer;
import com.runnersoftware.decoration.model.dto.SecurityUser;
import com.runnersoftware.decoration.service.UserService;
import com.runnersoftware.decoration.mapper.UserMapper;
import com.runnersoftware.decoration.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.*;

@Service
public class UserServiceImpl implements UserService {

    private UserMapper userMapper;
    private DesignerMapper designerMapper;

    @Autowired
    public void setUserMapper(UserMapper userMapper) {
        this.userMapper = userMapper;
    }

    @Autowired
    public void setDesignerMapper(DesignerMapper designerMapper) {
        this.designerMapper = designerMapper;
    }


    @Override
    public UserDetails loadUserByUsername(String s) throws UsernameNotFoundException {
        List<User> users = userMapper.find(new User().setUsername(s).setEnable(true));
        if (users.size() == 0){
            throw new UsernameNotFoundException("用户不存在!");
        }
        User user = users.get(0);
        List<Designer> designers = designerMapper.find(new Designer().setId(user.getId()));
        Collection<GrantedAuthority> collection = new ArrayList<>();
        collection.add(new SimpleGrantedAuthority("ROLE_USER"));
        if (designers.size() == 1){
            collection.add(new SimpleGrantedAuthority("ROLE_DESIGNER"));
        }
        return new SecurityUser(user, collection);
    }

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Override
    public Boolean update(User user) {
        if(!StringUtils.isEmpty(user.getPassword())){
            user.setPassword(passwordEncoder.encode(user.getPassword()));
        }
        return userMapper.update(user) != 0;
    }


    @Override
    public Boolean removeById(Long id) {
        designerMapper.delete(new Designer().setId(id));
        return userMapper.delete(new User().setId(id)) != 0;
    }

    @Override
    public Boolean createUser(User user) {
        if (!StringUtils.isEmpty(user.getPassword())){
            user.setPassword(passwordEncoder.encode(user.getPassword()));
        }
        return userMapper.insert(user) != 0;
    }

    @Override
    public Map<String, Object> findAllByPage(Map<String, Object> params) {
        Map<String, Object> map = new HashMap<String, Object>(2);
        Page<User> page = PageHelper.startPage(Integer.parseInt(params.get("pageNum").toString()),Integer.parseInt(params.get("pageSize").toString()));
        List<User> designers = userMapper.find((User) params.get("data"));
        map.put("rows", designers);
        map.put("count", page.getTotal());
        return map;
    }

    @Override
    public User findById(Long id) {
        return userMapper.find(new User().setId(id)).get(0);
    }
}

package com.runnersoftware.decoration.service.Impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.runnersoftware.decoration.mapper.DesignerMapper;
import com.runnersoftware.decoration.model.Designer;
import com.runnersoftware.decoration.model.User;
import com.runnersoftware.decoration.service.DesignerService;
import com.runnersoftware.decoration.service.UserService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Service
public class DesignerServiceImpl implements DesignerService {

    private DesignerMapper designerMapper;
    private UserService userService;

    @Autowired
    public void setDesignerMapper(DesignerMapper designerMapper) {
        this.designerMapper = designerMapper;
    }

    @Autowired
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    public Map<String, Object> findAllByPage(Map<String, Object> params) {
        Map<String, Object> map = new HashMap<String, Object>(2);
        Page<Designer> page = PageHelper.startPage(Integer.parseInt(params.get("pageNum").toString()),Integer.parseInt(params.get("pageSize").toString()));
        List<Designer> designers = designerMapper.find((Designer) params.get("data"));
        map.put("rows", designers);
        map.put("count", page.getTotal());
        return map;
    }

    @Transactional(rollbackFor = Exception.class)
    public Boolean createDesigner(Designer designer) {
        User user = new User();
        boolean b1 = designerMapper.insert(designer) != 0;
        BeanUtils.copyProperties(designer, user);
        boolean b2 = userService.insert(user);
        if (b1 && b2){
            return true;
        }else {
            throw new RuntimeException();
        }
    }

    @Transactional(rollbackFor = Exception.class)
    public Boolean updateDesigner(Designer designer) {
        User user = new User();
        BeanUtils.copyProperties(designer, user);
        boolean b1 = designerMapper.update(designer) != 0;
        boolean b2 = userService.update(user);
        if (b1 && b2){
            return true;
        }else {
            throw new RuntimeException();
        }
    }

    @Transactional(rollbackFor = Exception.class)
    public Boolean removeById(Long id) {
        boolean b1 = designerMapper.delete(new Designer().setId(id)) != 0;
        boolean b2 = userService.removeById(id);
        if (b1 && b2){
            return true;
        }else {
            throw new RuntimeException();
        }
    }

    public Designer findById(Long id) {
        return designerMapper.find(new Designer().setId(id)).get(0);
    }


}

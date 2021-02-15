package com.runnersoftware.decoration.service.Impl;


import com.runnersoftware.decoration.mapper.MaterialMapper;
import com.runnersoftware.decoration.model.Material;
import com.runnersoftware.decoration.model.vo.MaterialVO;
import com.runnersoftware.decoration.service.MaterialService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class MaterialServiceImpl implements MaterialService {

    private MaterialMapper materialMapper;

    @Autowired
    public void setMaterialMapper(MaterialMapper materialMapper) {
        this.materialMapper = materialMapper;
    }


    @Override
    @Transactional(rollbackFor = Exception.class)
    public Boolean createMaterial(final List<Material> materials) {
        final Long[] groupId = {null};
        final boolean[] result = {false};
        materials.forEach(item ->{
            if (!StringUtils.isEmpty(groupId[0])){
                item.setGroupId(groupId[0]);
            }
            result[0] = materialMapper.insert(item) != 0;
            if (StringUtils.isEmpty(groupId[0])){
                groupId[0] = item.getGroupId();
            }
        });
        if (!result[0]){
            throw new RuntimeException();
        }
        return true;
    }

    @Override
    public Boolean removeByGroupId(Long id) {
        return materialMapper.delete(new Material().setGroupId(id)) != 0;
    }

    @Override
    public Boolean removeById(Long id) {
        return materialMapper.delete(new Material().setId(id)) != 0;
    }

    @Override
    public Boolean updateMaterial(Material material) {
        return materialMapper.update(material) != 0;
    }

    @Override
    public Map<String, Object> findAllByPage(Map<String, Object> params) {
        Map<String, Object> map = new HashMap<String, Object>(2);
//        Page<List<MaterialVO>> page = PageHelper.startPage(Integer.parseInt(params.get("pageNum").toString()),Integer.parseInt(params.get("pageSize").toString()));
        List<MaterialVO> designers = materialMapper.findAll();
        map.put("rows", designers);
//        map.put("count", page.getTotal());
        return map;
    }


}

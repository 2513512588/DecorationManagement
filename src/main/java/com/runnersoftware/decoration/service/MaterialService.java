package com.runnersoftware.decoration.service;

import com.runnersoftware.decoration.model.Material;

import java.util.List;
import java.util.Map;

public interface MaterialService {

    Boolean createMaterial(List<Material> materials);

    Boolean removeByGroupId(Long id);

    Boolean removeById(Long id);

    Boolean updateMaterial(Material material);

    Map<String, Object> findAllByPage(Map<String, Object> params);
}

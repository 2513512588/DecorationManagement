package com.runnersoftware.decoration.service;

import com.runnersoftware.decoration.model.Designer;

import java.util.Map;

public interface DesignerService {

    Map<String, Object> findAllByPage(Map<String, Object> params);

    Boolean createDesigner(Designer designer);

    Boolean updateDesigner(Designer designer);

    Boolean removeById(Long id);

    Designer findById(Long id);
}

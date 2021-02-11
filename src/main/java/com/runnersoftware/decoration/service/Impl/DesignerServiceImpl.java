package com.runnersoftware.decoration.service.Impl;

import com.runnersoftware.decoration.mapper.DesignerMapper;
import com.runnersoftware.decoration.model.Designer;
import com.runnersoftware.decoration.service.DesignerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author HHY
 */
@Service
public class DesignerServiceImpl implements DesignerService {

    private DesignerMapper designerMapper;

    @Autowired
    public void setDesignerMapper(DesignerMapper designerMapper) {
        this.designerMapper = designerMapper;
    }

    public List<Designer> find(Designer designer) {
        return designerMapper.find(designer);
    }


}

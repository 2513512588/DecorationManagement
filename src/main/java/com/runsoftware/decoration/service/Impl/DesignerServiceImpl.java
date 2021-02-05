package com.runsoftware.decoration.service.Impl;

import com.runsoftware.decoration.mapper.DesignerMapper;
import com.runsoftware.decoration.model.Designer;
import com.runsoftware.decoration.service.DesignerService;
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

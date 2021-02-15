package com.runnersoftware.decoration.controller;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.runnersoftware.decoration.model.Material;
import com.runnersoftware.decoration.service.DesignerService;
import com.runnersoftware.decoration.service.MaterialService;
import com.runnersoftware.decoration.utils.R;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Api(tags = {"视图控制器"})
@Controller
public class ViewController {

    private DesignerService designerService;

    private MaterialService materialService;

    @Autowired
    public void setMaterialService(MaterialService materialService) {
        this.materialService = materialService;
    }

    @Autowired
    public void setDesignerService(DesignerService designerService) {
        this.designerService = designerService;
    }

    @ApiOperation("前台首页控制器")
    @GetMapping("/index")
    public String index(Model model, @RequestParam(value = "page",defaultValue = "1",required = false) int pageNum ,
                        @RequestParam(value = "limit",defaultValue = "10",required = false) int pageSize){
        Map<String, Object> params = new HashMap<String, Object>(2);
        params.put("pageNum", pageNum);
        params.put("pageSize", pageSize);

        model.addAttribute("designersMap", designerService.findAllByPage(params));
        model.addAttribute("materialsMap", materialService.findAllByPage(params));
        return "/index";
    }

    @ApiOperation("后台首页控制器")
    @GetMapping("/backstage")
    public String backstage(){
        return "backstage/index";
    }

    @ApiOperation("设计师添加装修材料")
    @GetMapping("/addMaterial")
    public String addMaterial(){
        return "front/addMaterial";
    }

}

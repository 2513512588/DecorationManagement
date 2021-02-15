package com.runnersoftware.decoration.controller;

import com.runnersoftware.decoration.model.Material;
import com.runnersoftware.decoration.model.dto.SecurityUser;
import com.runnersoftware.decoration.service.MaterialService;
import com.runnersoftware.decoration.service.OssService;
import com.runnersoftware.decoration.utils.R;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Api(tags = {"装修材料管理"})
@RestController
@RequestMapping("/material")
public class MaterialController {

    private MaterialService materialService;
    private OssService ossService;

    @Autowired
    public void setOssService(OssService ossService) {
        this.ossService = ossService;
    }

    @Autowired
    public void setMaterialService(MaterialService materialService) {
        this.materialService = materialService;
    }


    @PreAuthorize("hasRole('ROLE_DESIGNER')")
    @ApiOperation("添加装修材料")
    @PostMapping("/create")
    public R insertModel(@RequestParam String [] name,@RequestParam String[] description,
                         @RequestParam Double[] price,@RequestParam("file") MultipartFile[] multipartFiles
    ) throws IOException {
        List<Material> list = new ArrayList<>();
        Long userId = ((SecurityUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getUser().getId();
        for (int i = 0; i < name.length; i++) {
            String cover = ossService.upload(multipartFiles[i].getInputStream());
            Material material = new Material();
            material.setName(name[i]);
            material.setPrice(price[i]);
            material.setDescription(description[i]);
            material.setDesignerId(userId);
            material.setCover(cover);;
            list.add(material);
        }
        return R.auto(materialService.createMaterial(list));
    }

    @PreAuthorize("hasRole('ROLE_DESIGNER')")
    @ApiOperation("删除装修材料组")
    @PostMapping("/remove/group/{id}")
    public R removeModelGroup(@PathVariable Long id){
        return R.auto(materialService.removeByGroupId(id));
    }

    @PreAuthorize("hasRole('ROLE_DESIGNER')")
    @ApiOperation("删除装修材料")
    @PostMapping("/remove/{id}")
    public R removeModel(@PathVariable Long id){
        return R.auto(materialService.removeById(id));
    }

    @PreAuthorize("hasRole('ROLE_DESIGNER')")
    @ApiOperation("更新装修材料")
    @PostMapping("/update")
    public R updateModel(Material material){
        return R.auto(materialService.updateMaterial(material));
    }

    @ApiOperation("查找所有装修材料数据")
    @GetMapping("/query")
    public R findAll(@RequestParam(value = "page",defaultValue = "1",required = false) int pageNum ,
                     @RequestParam(value = "limit",defaultValue = "10",required = false) int pageSize){
        Map<String, Object> params = new HashMap<String, Object>(2);
        params.put("pageNum", pageNum);
        params.put("pageSize", pageSize);
        return R.ok().data(materialService.findAllByPage(params));
    }

}

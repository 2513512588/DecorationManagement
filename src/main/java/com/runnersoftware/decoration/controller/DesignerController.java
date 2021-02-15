package com.runnersoftware.decoration.controller;

import com.runnersoftware.decoration.model.Designer;
import com.runnersoftware.decoration.service.DesignerService;
import com.runnersoftware.decoration.service.OssService;
import com.runnersoftware.decoration.utils.R;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;



@Api(tags = {"设计师管理"})
@RestController
@RequestMapping("/designer")
public class DesignerController {

    private DesignerService designerService;

    @Autowired
    public void setDesignerService(DesignerService designerService) {
        this.designerService = designerService;
    }

    @ApiOperation("查找所有设计师数据")
    @GetMapping("/query")
    public R findAll(@RequestParam(value = "page",defaultValue = "1",required = false) int pageNum ,
                     @RequestParam(value = "limit",defaultValue = "10",required = false) int pageSize){
        Map<String, Object> params = new HashMap<String, Object>(2);
        params.put("pageNum", pageNum);
        params.put("pageSize", pageSize);
        return R.ok().data(designerService.findAllByPage(params));
    }

    @ApiOperation("根据id查找设计师")
    @PostMapping("/query/{id}")
    public R findById(@PathVariable Long id){
        return R.ok().data("designer", designerService.findById(id));
    }


    private OssService ossService;

    @Autowired
    public void setOssService(OssService ossService) {
        this.ossService = ossService;
    }

    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @ApiOperation("添加设计师")
    @PostMapping("/create")
    public R insertModel(@RequestParam("file") MultipartFile multipartFile, Designer designer) throws IOException {
        designer.setCover(ossService.upload(multipartFile.getInputStream()));
        return R.auto(designerService.createDesigner(designer));
    }

    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @ApiOperation("更新设计师数据")
    @PostMapping("/update")
    public R updateModel(@RequestParam(value = "file",required = false) MultipartFile multipartFile, Designer designer) throws IOException {
        if (multipartFile != null){
           designer.setCover(ossService.upload(multipartFile.getInputStream()));
        }
        return R.auto(designerService.updateDesigner(designer));
    }

    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @ApiOperation("删除设计师数据")
    @GetMapping("/remove/{id}")
    public R removeModel(@PathVariable Long id){
        return R.auto(designerService.removeById(id));
    }




}

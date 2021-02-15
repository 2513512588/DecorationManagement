package com.runnersoftware.decoration.controller;

import com.runnersoftware.decoration.model.ShoppingCar;
import com.runnersoftware.decoration.model.dto.SecurityUser;
import com.runnersoftware.decoration.model.vo.ShoppingCarVO;
import com.runnersoftware.decoration.service.ShoppingService;
import com.runnersoftware.decoration.utils.R;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@Api(tags = {"购物车管理"})
@Controller
@RequestMapping("/shopping")
public class ShoppingController {

    private ShoppingService shoppingService;

    @Autowired
    public void setShoppingService(ShoppingService shoppingService) {
        this.shoppingService = shoppingService;
    }


    @PreAuthorize("hasRole('ROLE_USER')")
    @ApiOperation("根据用户查询购物车数据")
    @GetMapping("/query")
    public String findAll(Model model){
        Long userId = ((SecurityUser)SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getUser().getId();
        ShoppingCar shoppingCar = new ShoppingCar().setUserId(userId);
        List<ShoppingCarVO> shoppingCarVOList = shoppingService.findAll(shoppingCar);
        model.addAttribute("scars",shoppingCarVOList);
        return "front/shoppingcar";
    }



    @PreAuthorize("hasRole('ROLE_USER')")
    @ApiOperation("添加装修材料到购物车")
    @PostMapping("/create/{id}")
    @ResponseBody
    public R insertModel(@PathVariable Long id){
        Long userId = ((SecurityUser)SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getUser().getId();
        ShoppingCar shoppingCar = new ShoppingCar().setMaterialGroupId(id).setUserId(userId);
        return R.auto(shoppingService.createShopping(shoppingCar));
    }


    @PreAuthorize("hasRole('ROLE_USER')")
    @ApiOperation("删除购物车装修材料")
    @PostMapping("/remove/{id}")
    @ResponseBody
    public R removeModel(@PathVariable Long id){
        Long userId = ((SecurityUser)SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getUser().getId();
        ShoppingCar shoppingCar = new ShoppingCar().setMaterialGroupId(id).setUserId(userId);
        return R.auto(shoppingService.removeByMaterialGroupId(shoppingCar));
    }

}

package com.runnersoftware.decoration.controller;

import com.runnersoftware.decoration.model.Order;
import com.runnersoftware.decoration.model.dto.SecurityUser;
import com.runnersoftware.decoration.model.vo.OrderVO;
import com.runnersoftware.decoration.service.OrderService;
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

@Api(tags = {"订单管理"})
@Controller
@RequestMapping("/order")
public class OrderController {

    private OrderService orderService;

    @Autowired
    public void setOrderService(OrderService orderService) {
        this.orderService = orderService;
    }


    @PreAuthorize("hasRole('ROLE_USER')")
    @ApiOperation("根据用户查询订单数据")
    @GetMapping("/query")
    public String findAll(Model model){
        Long userId = ((SecurityUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getUser().getId();
        Order order = new Order().setUserId(userId);
        List<OrderVO> orderList = orderService.findAll(order);
        model.addAttribute("orders", orderList);
        return "front/orderList";
    }


    @PreAuthorize("hasRole('ROLE_USER')")
    @ApiOperation("添加订单")
    @PostMapping("/create/{id}")
    @ResponseBody
    public R insertModel(@PathVariable Long id){
        Long userId = ((SecurityUser)SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getUser().getId();
        Order order = new Order().setMaterialGroupId(id).setUserId(userId);
        return R.auto(orderService.createOrder(order));
    }



}

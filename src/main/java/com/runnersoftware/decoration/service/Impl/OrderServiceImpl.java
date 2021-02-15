package com.runnersoftware.decoration.service.Impl;

import com.runnersoftware.decoration.mapper.OrderMapper;
import com.runnersoftware.decoration.mapper.ShoppingCarMapper;
import com.runnersoftware.decoration.model.Order;
import com.runnersoftware.decoration.model.ShoppingCar;
import com.runnersoftware.decoration.model.vo.OrderVO;
import com.runnersoftware.decoration.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderServiceImpl implements OrderService {

    private OrderMapper orderMapper;

    private ShoppingCarMapper shoppingCarMapper;

    @Autowired
    public void setShoppingCarMapper(ShoppingCarMapper shoppingCarMapper) {
        this.shoppingCarMapper = shoppingCarMapper;
    }

    @Autowired
    public void setOrderMapper(OrderMapper orderMapper) {
        this.orderMapper = orderMapper;
    }

    @Override
    public List<OrderVO> findAll(Order order) {
        return orderMapper.findAll(order);
    }

    @Override
    public Boolean createOrder(Order order) {
        shoppingCarMapper.delete(new ShoppingCar().setMaterialGroupId(order.getMaterialGroupId()).setUserId(order.getUserId()));
        return orderMapper.insert(order) != 0;
    }
}

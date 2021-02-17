package com.runnersoftware.decoration.service;

import com.runnersoftware.decoration.model.Order;
import com.runnersoftware.decoration.model.vo.OrderVO;

import java.util.List;

public interface OrderService {

    List<OrderVO> findAll(Order order);

    Boolean createOrder(Order order);

    Boolean removeById(Order order);
}

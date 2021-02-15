package com.runnersoftware.decoration.service;

import com.runnersoftware.decoration.model.ShoppingCar;
import com.runnersoftware.decoration.model.vo.ShoppingCarVO;

import java.util.List;
import java.util.Map;

public interface ShoppingService {


    Boolean createShopping(ShoppingCar shoppingCar);

    List<ShoppingCarVO> findAll(ShoppingCar shoppingCar);

    Boolean removeByMaterialGroupId(ShoppingCar shoppingCar);
}

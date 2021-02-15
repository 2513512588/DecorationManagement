package com.runnersoftware.decoration.service.Impl;

import com.runnersoftware.decoration.mapper.ShoppingCarMapper;
import com.runnersoftware.decoration.model.ShoppingCar;
import com.runnersoftware.decoration.model.vo.ShoppingCarVO;
import com.runnersoftware.decoration.service.ShoppingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ShoppingServiceImpl implements ShoppingService {

    private ShoppingCarMapper shoppingMapper;

    @Autowired
    public void setShoppingMapper(ShoppingCarMapper shoppingMapper) {
        this.shoppingMapper = shoppingMapper;
    }


    @Override
    public Boolean createShopping(ShoppingCar shoppingCar) {
        return shoppingMapper.insert(shoppingCar) != 0;
    }

    @Override
    public List<ShoppingCarVO> findAll(ShoppingCar shoppingCar) {
        return shoppingMapper.findAll(shoppingCar);
    }

    @Override
    public Boolean removeByMaterialGroupId(ShoppingCar shoppingCar) {
        return shoppingMapper.delete(shoppingCar) != 0;
    }


}

package com.runnersoftware.decoration.mapper;

import com.runnersoftware.decoration.model.ShoppingCar;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author Neil
 */
@Mapper
@Repository
public interface ShoppingCarMapper extends BaseMapper<ShoppingCar>{

    Integer insert(ShoppingCar shoppingCar);

    Integer update(ShoppingCar shoppingCar);

    Integer delete(ShoppingCar shoppingCar);

    List<ShoppingCar> find(ShoppingCar shoppingCar);
}

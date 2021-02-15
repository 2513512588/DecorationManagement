package com.runnersoftware.decoration.mapper;

import com.runnersoftware.decoration.model.ShoppingCar;
import com.runnersoftware.decoration.model.vo.ShoppingCarVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;



@Mapper
@Repository
public interface ShoppingCarMapper extends BaseMapper<ShoppingCar>{

    List<ShoppingCarVO> findAll(ShoppingCar shoppingCar);

}

package com.runnersoftware.decoration.mapper;

import com.runnersoftware.decoration.model.ShoppingCar;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;



/**
 * @author Neil
 */
@Mapper
@Repository
public interface ShoppingCarMapper extends BaseMapper<ShoppingCar>{

}

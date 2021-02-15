package com.runnersoftware.decoration.mapper;

import com.runnersoftware.decoration.model.Order;
import com.runnersoftware.decoration.model.vo.OrderVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface OrderMapper extends BaseMapper<Order>{

    List<OrderVO> findAll(Order order);

}

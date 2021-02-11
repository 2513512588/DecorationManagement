package com.runnersoftware.decoration.mapper;

import com.runnersoftware.decoration.model.User;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface UserMapper extends BaseMapper<User>{

}

package com.runnersoftware.decoration.mapper;

import com.runnersoftware.decoration.model.Material;
import com.runnersoftware.decoration.model.vo.MaterialVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;


@Mapper
@Repository
public interface MaterialMapper extends BaseMapper<Material>{

    List<MaterialVO> findAll();

//    List<Material> findByGroupId(Long groupId);

}

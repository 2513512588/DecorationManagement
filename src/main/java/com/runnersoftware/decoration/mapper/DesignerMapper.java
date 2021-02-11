package com.runnersoftware.decoration.mapper;

import com.runnersoftware.decoration.model.Designer;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author HHY
 */
@Mapper
@Repository
public interface DesignerMapper extends BaseMapper<Designer>{

    Integer insert(Designer designer);

    Integer update(Designer designer);

    Integer delete(Designer designer);

    List<Designer> find(Designer designer);
}

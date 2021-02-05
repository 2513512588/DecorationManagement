package com.runsoftware.decoration.mapper;

import java.util.List;

/**
 * @author HHY
 */
public interface BaseMapper<T> {

    public Integer insert(T t);
    public Integer update(T t);
    public Integer delete(T t);
    public List<T> find(T t);

}

package com.oracle.ddbook.biz;

import java.util.List;

import com.oracle.ddbook.model.SmallType;

public interface SmallTypeBiz {

	boolean save(SmallType smalltype);


	List<SmallType> findAllsmallbook(int bid);

    int finfbidByid(int sid);
}

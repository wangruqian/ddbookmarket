package com.oracle.ddbook.dao;

import java.util.List;

import com.oracle.ddbook.model.SmallType;

public interface SmallTypeDao {

	boolean save(SmallType smalltype);


	List<SmallType> findsmall(int bid);

    int findbidByid(int sid);
}

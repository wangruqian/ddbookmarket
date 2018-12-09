package com.oracle.ddbook.biz;

import java.util.List;

import com.oracle.ddbook.model.BigType;

public interface BigTypeBiz {

	boolean save(String name);

	List<BigType> findAllBigtype();




}

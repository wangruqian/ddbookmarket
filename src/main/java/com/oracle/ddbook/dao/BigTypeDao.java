package com.oracle.ddbook.dao;

import java.util.List;

import com.oracle.ddbook.model.BigType;

public interface BigTypeDao {

	boolean save(String name);

	List<BigType> findAll();

}

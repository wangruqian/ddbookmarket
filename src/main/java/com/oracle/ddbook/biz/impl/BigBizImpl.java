package com.oracle.ddbook.biz.impl;

import java.util.List;

import com.oracle.ddbook.model.BigType;
import com.oracle.ddbook.biz.BigTypeBiz;
import com.oracle.ddbook.dao.BigTypeDao;
import com.oracle.ddbook.dao.impl.BigTypeDaoJdbcImpl;

public class BigBizImpl implements BigTypeBiz {

	@Override
	public boolean save(String name) {
		//业务层要让dao层整  然后dao层让jdbc整  jdbc搞数据库查询
		BigTypeDao bigDao=new BigTypeDaoJdbcImpl();
		return bigDao.save(name);//把name存进去
	}
	@Override
	public List<BigType> findAllBigtype() {
		BigTypeDao bigDao=new BigTypeDaoJdbcImpl();
		return bigDao.findAll();
	}



}

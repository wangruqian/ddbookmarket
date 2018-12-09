package com.oracle.ddbook.biz.impl;

import java.util.List;

import com.oracle.ddbook.model.SmallType;
import com.oracle.ddbook.biz.SmallTypeBiz;
import com.oracle.ddbook.dao.SmallTypeDao;
import com.oracle.ddbook.dao.impl.SmallTypeDaoJdbcImpl;

public class SmallBizlmpl implements SmallTypeBiz {

	@Override
	public boolean save(SmallType smalltype) {
		SmallTypeDao smallDao=new SmallTypeDaoJdbcImpl();
		return smallDao.save(smalltype);
	}

	@Override
	public List<SmallType> findAllsmallbook(int bid) {
		SmallTypeDao smallDao=new SmallTypeDaoJdbcImpl();
		return smallDao.findsmall(bid);
	}

	@Override
	public int finfbidByid(int sid) {
		SmallTypeDao smallDao=new SmallTypeDaoJdbcImpl();
		return smallDao.findbidByid(sid);
	}

}

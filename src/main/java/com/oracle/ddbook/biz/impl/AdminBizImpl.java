package com.oracle.ddbook.biz.impl;

import com.oracle.ddbook.biz.AdminBiz;
import com.oracle.ddbook.dao.AdminDao;
import com.oracle.ddbook.dao.impl.AdminDaoJdbcImpl;
import com.oracle.ddbook.model.Admin;

public class AdminBizImpl implements AdminBiz {



    @Override
    public boolean findNameAndId(Admin admin) {
        AdminDao adminDao=new AdminDaoJdbcImpl();
        return adminDao.find(admin);
    }


}

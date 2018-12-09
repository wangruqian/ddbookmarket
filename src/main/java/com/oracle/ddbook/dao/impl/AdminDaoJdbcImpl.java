package com.oracle.ddbook.dao.impl;

import com.oracle.ddbook.dao.AdminDao;
import com.oracle.ddbook.model.Admin;
import com.oracle.ddbook.util.DBUtil;
import com.oracle.ddbook.util.MD5Util;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AdminDaoJdbcImpl implements AdminDao {
    @Override
    public boolean find(Admin admin) {
        Connection conn=null;
        PreparedStatement stmt=null;
        ResultSet rs=null;
        try {
            conn= DBUtil.getConnection();
           /* stmt=conn.prepareStatement("select * from t_admin where name=? and pwd=?");
            stmt.setString(1,admin.getName());
            stmt.setString(2, MD5Util.MD5Encode(admin.getPwd(),"utf-8"));*/
            stmt=conn.prepareStatement("select pwd from t_admin where name=? ");
            stmt.setString(1,admin.getName());
            rs=stmt.executeQuery();
            if (rs.next()){
                String dbpwd=rs.getString(1);
                try {
                    return MD5Util.validPasswd(admin.getPwd(),dbpwd);
                } catch (NoSuchAlgorithmException e) {
                    e.printStackTrace();
                } catch (UnsupportedEncodingException e) {
                    e.printStackTrace();
                }
            }

        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            DBUtil.free(rs,stmt,conn);
        }


        return false;
    }
}

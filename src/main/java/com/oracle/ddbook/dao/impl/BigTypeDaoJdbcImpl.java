package com.oracle.ddbook.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.oracle.ddbook.dao.BigTypeDao;
import com.oracle.ddbook.model.BigType;
import com.oracle.ddbook.util.DBUtil;

public class BigTypeDaoJdbcImpl implements BigTypeDao {

	@Override
	public boolean save(String name) {
		Connection conn=null;//连接数据库需要Connection对象
		PreparedStatement statm=null;//连接数据库后需要村对象，所以需要PreparedStatement对象
		try {
			conn= DBUtil.getConnection();//连接数据库（比如打电话就要先拨通）
			String sql="insert into t_big_type values(default,?)";
			statm=conn.prepareStatement(sql);//连接数据库后要向服务器发请求
			statm.setString(1, name);//给数据赋值
			int ret=statm.executeUpdate();//得到数据值后就要更新
			if (ret>0) {
				//如果存入成功就返回true
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			//释放资源（给别人打招呼，如果不做了就要给别人打声招呼）
			DBUtil.free(statm, conn);
		}
		return false;
	}

	@Override
	public List<BigType> findAll() {
		Connection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		try {
			//创建数据库连接
			conn=DBUtil.getConnection();
			stmt=conn.createStatement();
			//查找语句
			String sql="select * from t_big_type";
			rs=stmt.executeQuery(sql);//更新查找内容
			List<BigType> ls=new ArrayList<>();//存每一行的每一列
			while(rs.next()) {//先读到行在读到列
				BigType bigtype=new BigType();
				bigtype.setId(rs.getInt("id"));
				bigtype.setName(rs.getString("name"));
				ls.add(bigtype);
			}
			return ls;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.free(rs, stmt, conn);;
		}
		
		return null;
	}

}

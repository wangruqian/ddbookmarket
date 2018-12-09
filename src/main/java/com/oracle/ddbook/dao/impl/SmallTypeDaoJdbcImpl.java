package com.oracle.ddbook.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.oracle.ddbook.dao.SmallTypeDao;
import com.oracle.ddbook.model.SmallType;
import com.oracle.ddbook.util.DBUtil;

public class SmallTypeDaoJdbcImpl implements SmallTypeDao {

	@Override
	public boolean save(SmallType smalltype) {
		Connection conn=null;
		PreparedStatement stmt=null;
			try {
				conn= DBUtil.getConnection();
				stmt=conn.prepareStatement("insert into t_small_type values(default,?,?)");
				stmt.setString(1, smalltype.getName());//给数据库加内容
				stmt.setInt(2, smalltype.getBid());
				int ret=stmt.executeUpdate();
				if(ret>0) {
				return true;
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				DBUtil.free(stmt, conn);
			}
		return false;
	}

	@Override
	public List<SmallType> findsmall(int bid) {
		Connection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		try {
			//创建数据库连接
			conn=DBUtil.getConnection();
			stmt=conn.createStatement();
			//查找语句
			String sql="select * from t_small_type where bid="+bid;
			rs=stmt.executeQuery(sql);//更新查找内容
			List<SmallType> ls=new ArrayList<>();//存每一行的每一列
			while(rs.next()) {//先读到行在读到列
				SmallType smalltype=new SmallType();//列出读到的每一列
				smalltype.setId(rs.getInt("id"));
				smalltype.setName(rs.getString("name"));
				smalltype.setBid(rs.getInt("bid"));
				ls.add(smalltype);
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

	@Override
	public int findbidByid(int sid) {
		Connection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		try {
			//创建数据库连接
			conn=DBUtil.getConnection();
			stmt=conn.createStatement();
			//查找语句
			String sql="select bid from t_small_type where id="+sid;
			rs=stmt.executeQuery(sql);//更新查找内
			if(rs.next()) {//先读到行在读到列
				return rs.getInt(1);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.free(rs, stmt, conn);;
		}
		return 0;
	}

}

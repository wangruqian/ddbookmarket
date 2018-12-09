package com.oracle.ddbook.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.oracle.ddbook.dao.BookDao;
import com.oracle.ddbook.model.Book;
import com.oracle.ddbook.util.DBUtil;
import com.oracle.ddbook.util.PageConstent;

public class BookDaoJdbcImpl implements BookDao {

	@Override
	public boolean booksave(Book booktype) {
		Connection conn=null;
		PreparedStatement stmt=null;
		try {
			conn= DBUtil.getConnection();
			stmt=conn.prepareStatement("insert into book_type values(default,?,?,?,?,?,?,?)");
			stmt.setString(1, booktype.getName());
			stmt.setInt(2, booktype.getPrice());
			stmt.setString(3, booktype.getPub());
			stmt.setString(4, booktype.getPescr());
			stmt.setDate(5,new java.sql.Date( booktype.getDay().getTime()));
			stmt.setInt(6, booktype.getSid());
			stmt.setString(7, booktype.getPhoto());
			int ret=stmt.executeUpdate();
			if(ret>0) {
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.free(stmt, conn);
		}
		return false;
	}

	@Override
	public List<Book> findAll(int currontPage, String name, int sid) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			// 创建数据库连接
			conn = DBUtil.getConnection();
			stmt = conn.createStatement();
			// 查找语句
			String sql = "select * from book_type  where 1=1 ";
		/*	//四种情况
			//1都不限定
			if((name==null||name.equals(""))&&sid==-1) {
				//啥也不做
			}
			//限定name，不限定sid
			if((name!=null&&!name.equals(""))&&sid==-1) {
				sql+="where name like '%"+name+"%' ";
			}
			//不限定name 限定sid
			if((name==null||name.equals(""))&&sid!=-1) {
				sql+=" where sid="+sid;
			}
			//两个都限定
			if((name!=null&&!name.equals(""))&&sid!=-1) {
				sql+="where name like '%"+name+"%' and sid="+sid;
			}*/
			if(name!=null&&!name.equals("")) {
				sql+=" and name like '%"+name+"%' ";
			}
			if(sid!=-1) {
				sql+=" and sid="+sid;
			}
			sql+=" order by id desc limit "+((currontPage-1)* PageConstent.PAGE_SIZE+1-1)+","+PageConstent.PAGE_SIZE;
			rs = stmt.executeQuery(sql);// 更新查找内容
			List<Book> ls = new ArrayList<>();// 存每一行的每一列
			while (rs.next()) {// 先读到行在读到列
				Book booktype = new Book();// 列出读到的每一列
				booktype.setId(rs.getInt("id"));
				booktype.setName(rs.getString("name"));
				booktype.setSid(rs.getInt("sid"));
				booktype.setPrice(rs.getInt("price"));
				booktype.setPub(rs.getString("pub"));
				booktype.setPescr(rs.getString("pescr"));
				booktype.setDay(rs.getDate("day"));
				booktype.setPhoto(rs.getString("photo"));
				ls.add(booktype);
			}
			return ls;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.free(rs, stmt, conn);
			
		}
		return null;
	}

	@Override
	public int total(String name,int sid) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			// 创建数据库连接
			conn = DBUtil.getConnection();
			stmt = conn.createStatement();
			// 查找语句
			String sql = "select count(*) from book_type where 1=1";// 统计有多少行多少列
			if(name!=null&&!name.equals("")) {
				sql+=" and name like '%"+name+"%' ";
			}
			if(sid!=-1) {
				sql+=" and sid="+sid;
			}
			rs = stmt.executeQuery(sql);// 更新查找内容
			if (rs.next()) {// 先读到行在读到列
				return rs.getInt(1);// 每一行有一列
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.free(rs, stmt, conn);
			
		}
		return 0;
	}

	@Override
	public int deldata(int id) {
		Connection conn=null;
		PreparedStatement stmt=null;
		try {
			conn=DBUtil.getConnection();
			stmt=conn.prepareStatement(" delete from book_type  where id="+id);
			int ret=stmt.executeUpdate();
			return ret;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public Book findbookByid(int id) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			// 创建数据库连接
			conn = DBUtil.getConnection();
			stmt = conn.createStatement();
			// 查找语句
			String sql = "select * from book_type  where id= "+id;

			rs = stmt.executeQuery(sql);// 更新查找内容
			List<Book> ls = new ArrayList<>();// 存每一行的每一列
			if (rs.next()) {// 先读到行在读到列
				Book booktype = new Book();// 列出读到的每一列
				booktype.setId(rs.getInt("id"));
				booktype.setName(rs.getString("name"));
				booktype.setSid(rs.getInt("sid"));
				booktype.setPrice(rs.getInt("price"));
				booktype.setPub(rs.getString("pub"));
				booktype.setPescr(rs.getString("pescr"));
				booktype.setDay(rs.getDate("day"));
				booktype.setPhoto(rs.getString("photo"));
				return booktype;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.free(rs, stmt, conn);

		}
		return null;
	}

	@Override
	public boolean bookup(Book booktype) {
		Connection conn=null;
		PreparedStatement stmt=null;
		try {
			conn= DBUtil.getConnection();
			if (booktype.getPhoto()==null){
				stmt=conn.prepareStatement("update book_type set name=?,price=?,pub=?,pescr=?,day=?,sid=? where id=?");
				stmt.setString(1, booktype.getName());
				stmt.setInt(2, booktype.getPrice());
				stmt.setString(3, booktype.getPub());
				stmt.setString(4, booktype.getPescr());
				stmt.setDate(5,new java.sql.Date( booktype.getDay().getTime()));
				stmt.setInt(6, booktype.getSid());
				stmt.setInt(7,booktype.getId());
			}else{
				stmt=conn.prepareStatement("update  book_type set name=?,price=?,pub=?,pescr=?,day=?,sid=?,photo=? where id=?");
				stmt.setString(1, booktype.getName());
				stmt.setInt(2, booktype.getPrice());
				stmt.setString(3, booktype.getPub());
				stmt.setString(4, booktype.getPescr());
				stmt.setDate(5,new java.sql.Date( booktype.getDay().getTime()));
				stmt.setInt(6, booktype.getSid());
				stmt.setString(7, booktype.getPhoto());
				stmt.setInt(8,booktype.getId());
			}

			int ret=stmt.executeUpdate();
			if(ret>0) {
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.free(stmt, conn);
		}
		return false;
	}


}

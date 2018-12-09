package com.oracle.ddbook.model;

import java.io.Serializable;
import java.util.Date;

public class Book implements Serializable {
	private static final long serialVersionUID = 1L;
	private int id;
	private String name;
	private int price;
	private String pub;
	private  String pescr;
	private Date day;
	private int sid;
	private String photo;
	

	public Book() {
		// TODO Auto-generated constructor stub
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public int getPrice() {
		return price;
	}


	public void setPrice(int price) {
		this.price = price;
	}


	public String getPub() {
		return pub;
	}


	public void setPub(String pub) {
		this.pub = pub;
	}


	public String getPescr() {
		return pescr;
	}


	public void setPescr(String pescr) {
		this.pescr = pescr;
	}


	public Date getDay() {
		return day;
	}


	public void setDay(Date day) {
		this.day = day;
	}


	public int getSid() {
		return sid;
	}


	public void setSid(int sid) {
		this.sid = sid;
	}


	public String getPhoto() {
		return photo;
	}


	public void setPhoto(String photo) {
		this.photo = photo;
	}

}

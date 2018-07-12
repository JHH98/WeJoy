package com.wejoy.go.model;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class Post {
	private int ps_id; 
	private String content; 
   //4-16 추가됨 
	private Date reg_date;
	private int read_count; 
	private int likes;
	private String mm_id;
	private String del;
	private String stored_ig_name;
	private int ig_size;
	private String ip;
	private String origin_ig_name;
	private String subject;
	private int hobby_id;
	

	//paging
	private int startRow;
	private int endRow;
	
	// 검색
	private String search;
	private String keyword;
	
	// img
	private MultipartFile img;
	
	// 
	
	private int date_line;
	
	public int getDate_line() {
		return date_line;
	}
	public void setDate_line(int date_line) {
		this.date_line = date_line;
	}
	public int getHobby_id() {
		return hobby_id;
	}
	public void setHobby_id(int hobby_id) {
		this.hobby_id = hobby_id;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	
	public MultipartFile getImg() {
		return img;
	}
	public void setImg(MultipartFile img) {
		this.img = img;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public int getRead_count() {
		return read_count;
	}
	public void setRead_count(int read_count) {
		this.read_count = read_count;
	}
	public int getLikes() {
		return likes;
	}
	public void setLikes(int likes) {
		this.likes = likes;
	}
	public String getMm_id() {
		return mm_id;
	}
	public void setMm_id(String mm_id) {
		this.mm_id = mm_id;
	}
	public String getDel() {
		return del;
	}
	public void setDel(String del) {
		this.del = del;
	}
	public String getStored_ig_name() {
		return stored_ig_name;
	}
	public void setStored_ig_name(String stored_ig_name) {
		this.stored_ig_name = stored_ig_name;
	}
	public int getIg_size() {
		return ig_size;
	}
	public void setIg_size(int ig_size) {
		this.ig_size = ig_size;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getOrigin_ig_name() {
		return origin_ig_name;
	}
	public void setOrigin_ig_name(String origin_ig_name) {
		this.origin_ig_name = origin_ig_name;
	}
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public int getPs_id() {
		return ps_id;
	}
	public void setPs_id(int ps_id) {
		this.ps_id = ps_id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	public int getStartRow() {
		return startRow;
	}
	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}
	public int getEndRow() {
		return endRow;
	}
	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}

}

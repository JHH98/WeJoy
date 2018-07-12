package com.wejoy.go.model;

import java.sql.Date;

public class Comments {
	private int cno;
	private int pno;
	private String replyer; // login한 id 권장
	private String replytext;
	private Date regdate;
	private String del;	
	
	//paging
	private int startRow;
	private int endRow;
	
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
	public int getCno() {	return cno;	}
	public void setCno(int cno) {	this.cno = cno;	}
	public int getPno() {	return pno;	}
	public void setPno(int pno) {	this.pno = pno;	}
	public String getReplytext() {	return replytext;	}
	public void setReplytext(String replytext) {
		this.replytext = replytext;
	}
	public String getReplyer() {	return replyer;	}
	public void setReplyer(String replyer) {
		this.replyer = replyer;
	}
	public Date getRegdate() {	return regdate;	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getDel() {	return del;	}
	public void setDel(String del) {	this.del = del;	}
}



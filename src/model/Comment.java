package model;

import java.util.Date;

public class Comment {

	private int feedNum;
	private String name;
	public void setName(String name) {
		this.name = name;
	}
	private String email, content;
	private Date regDate;
	
	public int getFeedNum() {
		return feedNum;
	}
	public void setFeedNum(int feedNum) {
		this.feedNum = feedNum;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public String getName() {
		// TODO Auto-generated method stub
		return this.name;
	}
}

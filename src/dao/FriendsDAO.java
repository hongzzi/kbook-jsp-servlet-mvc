package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class FriendsDAO {
	String jdbc_url = "jdbc:mysql://ec2-52-78-222-111.ap-northeast-2.compute.amazonaws.com:3306/WEBSERVICE?useUnicode=true&characterEncoding=utf8";
	private String jdbc_driver = "com.mysql.jdbc.Driver";
	String user = "webservice"; // 디비 계정명
    String password = "webservice";
	private Connection conn;
	private Statement stmt;
	
	private void connect() {
		try {
			Class.forName(jdbc_driver);
			conn=DriverManager.getConnection(jdbc_url, user, password);
			stmt=conn.createStatement();
		}catch(Exception e) {
		}
	}
	
	private void disconnect() {
		try {
			stmt.close();
			conn.close();
		}catch(Exception e) {
		}
	}
	
	public void addFriends(String useremail, String friendemail) {
		String sql = "insert into friends (useremail,friendemail) values('"
				+useremail+"', '"
				+friendemail+"');";
		try {
			System.out.println(useremail);
			System.out.println(friendemail);
			connect();
			
			System.out.println("잉");
			int rs = stmt.executeUpdate(sql);
			System.out.println("insert문 실행결과 : "+ rs);
			disconnect();
		}catch(Exception e) {
			System.out.println(e.toString());
		}
	}
}

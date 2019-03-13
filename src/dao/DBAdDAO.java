package dao;

import java.util.ArrayList;
import java.sql.*;

import model.Ad;

public class DBAdDAO implements AdDAO {
	private String jdbc_url = "jdbc:mysql://ec2-52-78-222-111.ap-northeast-2.compute.amazonaws.com:3306/WEBSERVICE?useUnicode=true&characterEncoding=utf8";
	
	String user = "webservice"; // �뵒鍮� 怨꾩젙紐�
	String password = "webservice";
	private String jdbc_driver = "com.mysql.jdbc.Driver";
	//private String jdbc_url = "jdbc:mysql://localhost:3306/mydb?characterEncoding=utf8";
	private Connection conn;
	private Statement stmt;
	
	private void connect() {
		try {
			Class.forName(jdbc_driver);
			conn = DriverManager.getConnection(jdbc_url, user, password);
			stmt = conn.createStatement();
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

	public void addAD(Ad ad) {
		String sql = "insert into ad values("
				+ ad.getId() + ", '"
				+ ad.getImage() + "', '"
				+ ad.getAuthor() + "', '"
				+ ad.getTitle() + "', '"
				+ ad.getBody() + "', '"
				+ ad.getType() + "', '"
				+ ad.getDate() + "')";
		try {
			connect();
			stmt.executeUpdate(sql);
			disconnect();
		} catch(Exception e) {
		}
	}

	public Ad getAD(int id) {
		// TODO Auto-generated method stub
		String sql = "select * from ad where id = " + id;
		Ad ad = new Ad();
		try {
			connect();
			ResultSet rs = stmt.executeQuery(sql);
			rs.next();
			ad.setId(rs.getInt("id"));
			ad.setImage(rs.getString("image"));
			ad.setAuthor(rs.getString("author"));
			ad.setTitle(rs.getString("title"));
			ad.setBody(rs.getString("body"));
			ad.setType(rs.getString("type"));
			ad.setDate(rs.getString("date"));
			rs.close();
			disconnect();
		} catch(Exception e) {
		}
		return ad;
	}

	public ArrayList<Ad> getAllEvent(String type) {
		// TODO Auto-generated method stub
		String sql = "select id, author, title, date from ad where type='" + type + "'";
		ArrayList<Ad> list = new ArrayList<Ad>();
		try {
			connect();
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()) {
				Ad ad = new Ad();
				ad.setId(rs.getInt("id"));
				ad.setAuthor(rs.getString("author"));
				ad.setTitle(rs.getString("title"));
				ad.setDate(rs.getString("date"));
				list.add(ad);
			}
			rs.close();
			disconnect();
		} catch(Exception e) {
		}
		return list;
	}
	public void deleteAD(int id) {
		// TODO Auto-generated method stub
		String sql = "delete from ad where id = " + id;
		
		try {
			connect();
			stmt.executeUpdate(sql);
			disconnect();
		} catch(Exception e) {
		}
	}

}

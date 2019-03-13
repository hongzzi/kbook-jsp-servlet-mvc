package dao;
import java.util.ArrayList;
import java.sql.*;

import model.Bistro;

public class DBBistroDAO implements BistroDAO {
	private String jdbc_url = "jdbc:mysql://ec2-52-78-222-111.ap-northeast-2.compute.amazonaws.com:3306/WEBSERVICE?useUnicode=true&characterEncoding=utf8";
	
	private String user = "webservice"; // �뵒鍮� 怨꾩젙紐�
	private String password = "webservice";
	private String jdbc_driver = "com.mysql.jdbc.Driver";
	//private String jdbc_url = "jdbc:mysql://localhost:3306/mydb?characterEncoding=utf8";
	private Connection conn;
	private Statement stmt;
	
	private void connect() {
		try {
			Class.forName(jdbc_driver);
			conn = DriverManager.getConnection(jdbc_url,user,password);
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

	public ArrayList<Bistro> getAllEvent(String type) {
		String sql = "select name, tel, officeHours from restaurant where type = '" + type + "'";
		ArrayList<Bistro> list = new ArrayList<Bistro>();
		try {
			connect();
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
				Bistro bistro = new Bistro();
				bistro.setName(rs.getString("name"));
				bistro.setTel(rs.getString("tel"));
				bistro.setOfficeHours(rs.getString("officeHours"));
				list.add(bistro);
			}
			rs.close();
			disconnect();
		} catch(Exception e) {
		}
		return list;
	}
}

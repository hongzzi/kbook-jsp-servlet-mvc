package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ConnUtil {
	
	private static String jdbc ="com.mysql.jdbc.Driver";
	
	private ConnUtil(){
	}
	
	static {
		try {
			Class.forName(jdbc);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static Connection getConnection() throws SQLException {

		String jdbc_url = "jdbc:mysql://ec2-52-78-222-111.ap-northeast-2.compute.amazonaws.com:3306/WEBSERVICE?useUnicode=true&characterEncoding=utf8";
		
		String user = "webservice"; // �뵒鍮� 怨꾩젙紐�
		String password = "webservice";
		return DriverManager.getConnection(jdbc_url, user, password);
	}
	
	
	public static void close(Connection conn, PreparedStatement ps) {
		if(ps != null) {
			try {
				ps.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		if(conn !=null) {
			try {
				conn.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	public static void close(Connection conn, PreparedStatement ps, ResultSet rs) {
		if(rs !=null) {
			try {
				rs.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		close(conn, ps);
	}
	
}

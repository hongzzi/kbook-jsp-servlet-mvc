package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import model.Member;
import dao.ConnUtil;

public class MemberDAO {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;


	public void addMember(Member member) {
		//String sql = "insert into member values('" + member.getEmail() + "', '" + member.getName() + "', '"
//				+ member.getDepartment() + "', '" + member.getUserpw() + "');";
		String sql = "insert into member values(?, ?, ?, ?)";
		try {
			
			conn = ConnUtil.getConnection();
			
			ps = conn.prepareStatement(sql);
			ps.setString(1, member.getEmail());
			ps.setString(2, member.getName());
			ps.setString(3, member.getDepartment());
			ps.setString(4, member.getUserpw());
			
			
			rs = ps.executeQuery();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			ConnUtil.close(conn, ps, rs);
		}
	}

	public Member getMember(String email) {
		String sql = "select * from member where email=?";
		Member member = new Member();
		try {
			
			conn = ConnUtil.getConnection();
			
			ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			
			rs = ps.executeQuery();
			
			if(rs.next()){
				member.setEmail(rs.getString("email"));
				member.setName(rs.getString("name"));
				member.setDepartment(rs.getString("department"));
				member.setUserpw(rs.getString("userpw"));
			}
			
//			connect();
//			ResultSet rs = stmt.executeQuery(sql);
//			rs.next();
//			member.setEmail(rs.getString("email"));
//			member.setName(rs.getString("name"));
//			member.setDepartment(rs.getString("department"));
//			member.setUserpw(rs.getString("userpw"));
//			rs.close();
//			disconnect();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			ConnUtil.close(conn, ps, rs);
		}
		return member;
	}

	public ArrayList<Member> getSearchResult(String name) {
		//String sql = "select * from member where name='" + name + "';";
		String sql = "select * from member where name=?";
		ArrayList<Member> list = new ArrayList<Member>();
		try {
			
			conn = ConnUtil.getConnection();
			
			ps = conn.prepareStatement(sql);
			ps.setString(1, name);
			
			rs = ps.executeQuery();
			
//			connect();
//			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
				Member member = new Member();
				member.setEmail(rs.getString("email"));
				member.setName(rs.getString("name"));
				member.setDepartment(rs.getString("department"));
				list.add(member);
			}
//			rs.close();
//			disconnect();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			ConnUtil.close(conn, ps, rs);
		}
		return list;
	}

	public Member loginOK(String email, String userpw) {
		

		String SQL = "SELECT * FROM member WHERE email = ?";
		//String sql = "select * from member where email='" + email + "';";
		Member member = new Member();
		
		
		try{
			conn = ConnUtil.getConnection();
			
			ps = conn.prepareStatement(SQL);
			ps.setString(1, email);
			
			rs = ps.executeQuery();
			if(rs.next()) {
				member.setEmail(rs.getString("email"));
				member.setName(rs.getString("name"));
				member.setDepartment(rs.getString("department"));
				member.setUserpw(rs.getString("userpw"));
				
				System.out.println("테스트"+member.getEmail()+member.getName()+member.getDepartment()+member.getUserpw());
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally{
			ConnUtil.close(conn, ps, rs);
		}
		
		if (userpw.equals(member.getUserpw().toString())) {
			return member;
		} else {
			return null;
		}
		
//		String sql = "select * from member where email='" + email + "';";
//		MemberBean member = new MemberBean();
//		try {
//			connect();
//			ResultSet rs = stmt.executeQuery(sql);
//			rs.next();
//			member.setEmail(rs.getString("email"));
//			member.setName(rs.getString("name"));
//			member.setDepartment(rs.getString("department"));
//			member.setUserpw(rs.getString("userpw"));
//			
//			System.out.println("테스트"+member.getEmail()+member.getName()+member.getDepartment()+member.getUserpw());
//			rs.close();
//			disconnect();
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
		//System.out.println(userpw);
		//System.out.println(member.getUserpw());
		
	}

	public void deleteEvent(String email) {
		String sql = "delete from member where email=?;";
		int rst = 0;
		try {
			
			conn = ConnUtil.getConnection();
			
			ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			
			rst = ps.executeUpdate();
//			connect();
//			int rs = stmt.executeUpdate(sql);
//			disconnect();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			ConnUtil.close(conn, ps);
		}
		
		return;
	}

	public ArrayList<Member> getFriendsList(String email) {
		String sql = "select friendemail from friends where useremail=?";
		ArrayList<String> friendList = new ArrayList<String>();
		try {
			conn = ConnUtil.getConnection();
			
			ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			
			rs = ps.executeQuery();
			
			while (rs.next()) {
				String friendemail = rs.getString("friendemail");
				friendList.add(friendemail);
				System.out.println("친占쏙옙占쏙옙占쏙옙占쌍쇽옙 : " + friendemail);
			}
			rs.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			ConnUtil.close(conn, ps, rs);
		}

		ArrayList<Member> list = new ArrayList<Member>();
		for (int i = 0; i < friendList.size(); i++) {
			Member member = getMember(friendList.get(i));
			list.add(member);
		}
		return list;
	}

	public boolean emailCheck(String email) {
		Member member = getMember(email);
		boolean bl = false;
		if (member == null) {
			bl = false;
		} else if (email.equals(member.getEmail()) == true) {
			bl = true;
		} else if (email.equals(member.getEmail()) == false) {
			bl = false;
		}
		return bl;
	}

}

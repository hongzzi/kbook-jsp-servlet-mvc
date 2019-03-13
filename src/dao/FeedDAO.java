package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import model.Feed;


public class FeedDAO {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;


	public void addFeed(Feed feed) {
		String sql = "insert into feed (name,email,category,content,regdate) values(?, ? ,? ,?,NOW())";
		try {
			
			conn = ConnUtil.getConnection();
			
			ps = conn.prepareStatement(sql);
			ps.setString(1,  feed.getName());
			ps.setString(2,  feed.getEmail());
			ps.setString(3,  feed.getCategory());
			ps.setString(4,  feed.getContent());
			
			ps.executeUpdate();
			
			
		} catch (Exception e) {
			System.out.println(e.toString());
			e.printStackTrace();
		} finally {
			ConnUtil.close(conn, ps);
		}
	}

	public ArrayList<Feed> getAllFeed() {
		String sql = "select * from feed where category=?";
		ArrayList<Feed> list = new ArrayList<Feed>();

		try {
			
			conn = ConnUtil.getConnection();
			
			ps = conn.prepareStatement(sql);
			ps.setString(1, "personal");
			
			rs = ps.executeQuery();
			
			while (rs.next()) {
				Feed feed = new Feed();
				feed.setFeedNum(rs.getInt("feedNum"));
				feed.setName(rs.getString("name"));
				feed.setEmail(rs.getString("email"));
				feed.setCategory(rs.getString("category"));
				feed.setContent(rs.getString("content"));
				list.add(feed);
			}
		
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			ConnUtil.close(conn, ps, rs);
		}
		return list;
	}
	public ArrayList<Feed> getFeed_category(String category) {
		String sql = "select * from feed where category=?";
		ArrayList<Feed> list = new ArrayList<Feed>();

		try {
			conn = ConnUtil.getConnection();
			
			ps = conn.prepareStatement(sql);
			ps.setString(1, category);
			
			rs = ps.executeQuery();
			
			while (rs.next()) {
				Feed feed = new Feed();
				feed.setFeedNum(rs.getInt("feedNum"));
				feed.setName(rs.getString("name"));
				feed.setEmail(rs.getString("email"));
				feed.setCategory(rs.getString("category"));
				feed.setContent(rs.getString("content"));
				feed.setDate(rs.getDate("regdate"));
				list.add(feed);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			ConnUtil.close(conn, ps, rs);
		}
		return list;
	}
	
	public ArrayList<Feed> getFeed_email(String email) {
		String sql = "select * from feed where email=?";
		ArrayList<Feed> list = new ArrayList<Feed>();

		try {
			
			conn = ConnUtil.getConnection();
			
			ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			
			rs = ps.executeQuery();
//
			while (rs.next()) {
				Feed feed = new Feed();
				feed.setFeedNum(rs.getInt("feedNum"));
				feed.setName(rs.getString("name"));
				feed.setEmail(rs.getString("email"));
				feed.setCategory(rs.getString("category"));
				feed.setContent(rs.getString("content"));
				feed.setDate(rs.getDate("regdate"));
				list.add(feed);
			}
//			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			ConnUtil.close(conn, ps, rs);
		}
		
		return list;
	}

	public Feed getFeed(String feedNum) {
		String sql = "select * from feed where feedNum=?";
		Feed feed = new Feed();
		try {
			
			conn = ConnUtil.getConnection();
			
			ps = conn.prepareStatement(sql);
			ps.setString(1, feedNum);
			
			rs = ps.executeQuery();
			
//			connect();
//			
//			ResultSet rs = pstmt.executeQuery(sql);
			
			if(rs.next()){
				feed.setFeedNum(rs.getInt("feedNum"));
				feed.setName(rs.getString("name"));
				feed.setEmail(rs.getString("email"));
				feed.setCategory(rs.getString("category"));
				feed.setContent(rs.getString("content"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			ConnUtil.close(conn, ps, rs);
		}
		return feed;
	}
}

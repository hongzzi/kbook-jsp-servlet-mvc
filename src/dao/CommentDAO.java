package dao;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;

import model.Comment;




public class CommentDAO {	
	
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	
		
	public void addComment(Comment comment) {
		ResultSet rs = null;
		System.out.println(comment.getName());
		String sql = "insert into comment (email, content, regdate, feedNum, name) values(?, ?, NOW(), ?, ?)";
		java.util.Date utilDate = new Date();
		// Convert it to java.sql.Date
		java.sql.Date date = new java.sql.Date(utilDate.getTime());
		try {
			conn = ConnUtil.getConnection();
		
			ps = conn.prepareStatement(sql);
			
			ps.setString(1,  comment.getEmail());
			ps.setString(2,  comment.getContent());
			//ps.setDate(3,  date); 
			ps.setInt(3, comment.getFeedNum());
			ps.setString(4, comment.getName());
			
			//이거 아니면 댓글 넘버 저장/ 시간순 출력 가능하면 이걸로, 안되면 댓글넘버 새로 생성 
				
				
			int rst = ps.executeUpdate();
				
				
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			ConnUtil.close(conn, ps);
		}
		}
		
		public ArrayList<Comment> getAllComment(String feedNum){
			String sql="select * from comment where no=?";
			ArrayList<Comment> list = new ArrayList<Comment>();

			try {
				conn = ConnUtil.getConnection();
				ps = conn.prepareStatement(sql);
				ps.setString(1, "personal");
				rs = ps.executeQuery();
				while (rs.next()) {
					Comment comment= new Comment();
					comment.setFeedNum(rs.getInt("no"));
					comment.setEmail(rs.getString("email"));
					comment.setContent(rs.getString("content"));
					comment.setRegDate(rs.getDate("regdate"));
					comment.setName(rs.getString("name"));
					list.add(comment);
				}
				
			}catch (Exception e) {
				e.printStackTrace(); 
			}finally{
				ConnUtil.close(conn, ps, rs);
			}
			return list;
		}
		
		public Comment getComment(String feedNum) {
			String sql="select * from comment where no=?";
			Comment comment = new Comment();
			try {
				
				conn = ConnUtil.getConnection();
				ps = conn.prepareStatement(sql);
				ps.setString(1, "feedNum");
				rs = ps.executeQuery();
		
				if(rs.next()){
					
					comment.setFeedNum(rs.getInt("no"));
					comment.setEmail(rs.getString("email"));
					comment.setContent(rs.getString("content"));
					comment.setRegDate(rs.getDate("regdate"));
				};
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally{
				
				ConnUtil.close(conn, ps, rs);
			}
			return comment;
		}
}

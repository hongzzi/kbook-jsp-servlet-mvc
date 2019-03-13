package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CommentDAO;
import dao.FeedDAO;
import model.Comment;
import model.Feed;
import model.Member;

/**
 * Servlet implementation class FeedComment
 */
@WebServlet("/FeedComment")
public class FeedComment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FeedComment() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		
		String address = null;
		CommentDAO dao = new CommentDAO();
		String action = request.getParameter("action");
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("member");
		
		//System.out.println("feednum" +request.getParameter("feednum"));
		//System.out.println("member" +member.getName());
		
		if(action == null || action.equals("list")) {
			
			//ArrayList<Feed> list = dao.getAllFeed();
			//session.setAttribute("feedlist",list);
			//address="/WebProject/jsp/importpage.jsp";

	
		}else if (action.equals("add")) {
			Comment cmt=new Comment();
			
		
			
			cmt.setContent(request.getParameter("replycontent"));
			cmt.setName(member.getName());
			cmt.setEmail(member.getEmail());
			cmt.setFeedNum(Integer.parseInt(request.getParameter("feednum")));
			
			//String test=cmt.getContent();
		
			dao.addComment(cmt);
			address = "/WebProject/jsp/index.jsp";
		
		}
		response.sendRedirect(address);
	}

}

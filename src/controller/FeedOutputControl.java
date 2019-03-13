package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Feed;
import dao.FeedDAO;

@WebServlet("/FeedOutputControl")
public class FeedOutputControl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		FeedDAO dao = new FeedDAO();
		String address = null;
		request.setCharacterEncoding("utf-8");
		
		String action = request.getParameter("action");
		HttpSession session = request.getSession();
		
		if(action == null || action.equals("list")) {
			
			ArrayList<Feed> list = dao.getAllFeed();
			session.setAttribute("feedlist",list);
			address="/WebProject/jsp/importpage.jsp";

		}else if (action.equals("view")) {

			Feed feed = dao.getFeed(request.getParameter("feedNum"));
			session.setAttribute("feed",feed);
			address="/WebProject/jsp/importpage.jsp";
			
		}else if (action.equals("add")) {
			Feed feed=new Feed();
			feed.setEmail(request.getParameter("email"));
			feed.setName(request.getParameter("name"));
			feed.setCategory(request.getParameter("category"));
			feed.setContent(request.getParameter("content"));
			String test=feed.getContent();
		
			dao.addFeed(feed);
			address = "/WebProject/jsp/index.jsp";
		}else if (action.equals("add_department")) {
			Feed feed=new Feed();
			feed.setEmail(request.getParameter("email"));
			feed.setName(request.getParameter("name"));
			feed.setCategory(request.getParameter("category"));
			feed.setContent(request.getParameter("content"));
			String test=feed.getContent();
			System.out.println(test);
			dao.addFeed(feed);
			address = "/WebProject/jsp/department.jsp";
		}

		response.sendRedirect(address);

	}

}

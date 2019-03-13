package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Member;
import dao.*;

@WebServlet("/EventControl")
public class EventControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public EventControl() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberDAO dao = new MemberDAO();
		FriendsDAO friendDao = new FriendsDAO();
		String address = null;
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		
		String action = request.getParameter("action");
		if(action==null) {
			address = "login.jsp";
		}else if(action.equals("login")) {
			System.out.println(request.getParameter("email")+","+request.getParameter("userpw"));
			Member member = dao.loginOK(request.getParameter("email"), request.getParameter("userpw"));
			if(member!=null) {
				ArrayList<Member> friendsList = dao.getFriendsList(member.getEmail());
				if(friendsList!=null) {
					session.setAttribute("friendsList", friendsList);
					session.setAttribute("member", member);
					address="/WebProject/jsp/index.jsp";
				}else if(friendsList==null) {
					address="/WebProject/jsp/login.jsp";
				}
			}else if(member==null) {
				address="/WebProject/jsp/login.jsp";
			}
		}else if(action.equals("join")) {
			Member member = new Member();
			System.out.println(request.getParameter("email"));
			member.setEmail(request.getParameter("email"));
			member.setName(request.getParameter("name"));
			if(request.getParameter("department").equals("외부회원")){
				member.setDepartment("외부회원");
			}else{
				member.setDepartment(request.getParameter("department"));
			}
			member.setUserpw(request.getParameter("userpw"));
			dao.addMember(member);
			ArrayList<Member> friendsList = dao.getFriendsList(member.getEmail());
			if(member!=null&&friendsList!=null) {
				System.out.println("join");
				session.setAttribute("friendsList", friendsList);
				session.setAttribute("member", member);
				address="/WebProject/jsp/index.jsp";
			}else if(member==null||friendsList==null) {
				address="/WebProject/jsp/index.jsp";
			}
		}else if(action.equals("search")) {
			String search = request.getParameter("search");
			ArrayList<Member> list = dao.getSearchResult(search);
			if(list!=null) {
				session.setAttribute("result", list);
				address="/WebProject/jsp/search.jsp";
			}else if(list==null) {
				address="/WebProject/jsp/index.jsp";
			}
		}else if(action.equals("addFriend")) {
			String useremail = request.getParameter("useremail");
			String friendemail = request.getParameter("friendemail");
			friendDao.addFriends(useremail, friendemail);
			ArrayList<Member> friendsList = dao.getFriendsList(useremail);
			session.setAttribute("friendsList", friendsList);
			address="/WebProject/jsp/search.jsp";
		}
		response.sendRedirect(address);
	}

}

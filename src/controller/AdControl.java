package controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Ad;

import com.oreilly.servlet.*;
import com.oreilly.servlet.multipart.*;

import dao.AdDAO;
import dao.DBAdDAO;

/**
 * Servlet implementation class AdControl
 */
@WebServlet("/AdControl")
public class AdControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdControl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		AdDAO dao = new DBAdDAO();
		String address = null;
		request.setCharacterEncoding("utf-8");
		
		String action = request.getParameter("action");
		if(action == null || action.equals("in")) {
			ArrayList<Ad> list = dao.getAllEvent("in");
			request.setAttribute("adlist", list);
			address = "jsp/template_ADboard.jsp";
		} else if(action.equals("out")) {
			ArrayList<Ad> list = dao.getAllEvent("out");
			request.setAttribute("adlist", list);
			address = "jsp/template_ADboard.jsp";
		} else if(action.equals("view")) {
			Ad ad = dao.getAD(Integer.parseInt(request.getParameter("id")));
			request.setAttribute("ad",ad);
			address = "jsp/template_ADbody.jsp";
		} else if(action.equals("add")) {	
			Ad ad = new Ad();
			
			//String realPath = getServletContext().getRealPath("/ADupload");
			//System.out.println(request.getServletContext().getRealPath(""));
			String path= request.getServletContext().getRealPath("ADupload");
			
			
			int size = 1024*1024*10;
			MultipartRequest multi = new MultipartRequest(request, path, size, "UTF-8",new DefaultFileRenamePolicy());
			//? ˆ??ê²½ë¡œ C:\Users\LEE\eclipse-workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\WebService\144210\ADupload


			ad.setId(Integer.parseInt(multi.getParameter("id")));
			ad.setImage(multi.getFilesystemName("image"));
			ad.setAuthor(multi.getParameter("author"));
			ad.setTitle(multi.getParameter("title"));
			ad.setBody(multi.getParameter("body"));
			ad.setType(multi.getParameter("type"));
			ad.setDate(multi.getParameter("date"));
			dao.addAD(ad);
			request.setAttribute("ad",ad);
			address = "/jsp/ADcheck.jsp";
		} else if(action.equals("write")) {
			address = "/jsp/template_ADadd.jsp";
		} else if(action.equals("delete")) {
			dao.deleteAD(Integer.parseInt(request.getParameter("id")));
			address = "/jsp/template_ADboard.jsp";
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(address);
		dispatcher.forward(request, response);
	}

}

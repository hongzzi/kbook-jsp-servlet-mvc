package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Bistro;
import dao.BistroDAO;
import dao.DBBistroDAO;

/**
 * Servlet implementation class BistroControl
 */
@WebServlet("/BistroControl")
public class BistroControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BistroControl() {
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
		BistroDAO dao = new DBBistroDAO();
		String address = null;
		request.setCharacterEncoding("utf-8");
		
		String type = request.getParameter("type");
		if (type == null) {
			address = "/WebProject/jsp/FoodAD.jsp";
		} else {
			ArrayList<Bistro> list = dao.getAllEvent(type);
			request.setAttribute("bistrolist", list);
			address = "jsp/eventview.jsp";
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(address);
		dispatcher.forward(request, response);
	}
}

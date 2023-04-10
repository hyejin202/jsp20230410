package com.study;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.*;

/**
 * Servlet implementation class AddServlet
 */
@WebServlet("/add")
public class AddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 1. request param

		// 2. business logic

		// 3. add attribute

		// 4. forward / redirect
		String view = "/WEB-INF/views/add.jsp";
		request.getRequestDispatcher(view).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. get request param
		String name = request.getParameter("name");
		
		//2. business logic
		HttpSession session = request.getSession();
		List<String> list = (List<String>) session.getAttribute("db");
		
		list.add(name);
		
		//3. add attribute
				
		//4. forward / redirect
		String location = request.getContextPath() + "/list";
		response.sendRedirect(location);
	}
}

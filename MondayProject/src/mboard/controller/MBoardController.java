package mboard.controller;

import java.io.*;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.mboard.base.*;
import board.mboard.dao.*;
import board.mboard.vo.*;

@WebServlet("/subpage")
public class MBoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestFunc(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestFunc(request, response);
	}
	
	private void requestFunc(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		String         command  = request.getParameter("cmd");

		
		ActionFactory  fac      = new ActionFactory();
		
		Action         action   = fac.getAction( command );
		
		action.execute(request, response);
		
		
		
		
	}

}

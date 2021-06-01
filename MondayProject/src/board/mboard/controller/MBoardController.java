package board.mboard.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.mboard.base.Action;
import board.mboard.base.ActionFactory;

// annotation : 설정
@WebServlet("/mboard")
public class MBoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestFunc(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestFunc(request, response);
	}
	
	private void requestFunc(HttpServletRequest request, 
			HttpServletResponse response) 
			throws ServletException, IOException {
			
		request.setCharacterEncoding("utf-8");
		String         command  = request.getParameter("cmd");
		
		ActionFactory  fac      = new ActionFactory();		
		Action         action   = fac.getAction( command );
				
		action.execute(request, response);
		
	}

}






























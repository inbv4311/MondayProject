package board.mboard.impl;

import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

import board.mboard.base.*;
import board.mboard.dao.*;
import board.mboard.vo.*;

public class JavaView implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 String idx = request.getParameter("j_number");
		 
		 JavaDao javaDao	  = new JavaDao();
		 JavaVo 	vo 		  = javaDao.getBoard(idx);
		 
		 request.setAttribute("javaVo", vo); //javaVo로 바꾸셈
		 
	//	 String link 		  = "/subpage?cmd=JavaView&j_number="+idx; 
		 String link 		  = "/view/javaview.jsp"; 
		 
		 RequestDispatcher rd = request.getRequestDispatcher(link);
		 rd.forward(request, response);
		 
		

	}

}

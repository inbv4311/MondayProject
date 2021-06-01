package board.mboard.impl;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.http.*;

import board.mboard.base.*;
import board.mboard.dao.*;
import board.mboard.vo.*;

public class JavaList implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		String path 			= "/view/javalist.jsp";
		
		JavaDao	javaDao			= new JavaDao();
		List<JavaVo> javaList 	= javaDao.getJavaList();
		
		request.setAttribute("javaList", javaList);
		
		request.getRequestDispatcher(path).forward(request, response);

	}

}

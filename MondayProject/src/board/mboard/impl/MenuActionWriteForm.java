package board.mboard.impl;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.mboard.base.Action;

public class MenuActionWriteForm implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String  path  = "/board/menuwrite.jsp";		
		request.getRequestDispatcher(path).forward(request,  response);
		
	}

}

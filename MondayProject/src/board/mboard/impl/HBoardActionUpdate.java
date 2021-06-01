package board.mboard.impl;

import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

import board.mboard.base.*;
import board.mboard.dao.*;

public class HBoardActionUpdate implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String idx	 = request.getParameter("idx");
		String title = request.getParameter("title");
		String cont  = request.getParameter("cont");
		
		HtmlDao htmlDao = new HtmlDao();
		htmlDao.boardUpdate(idx, title, cont);
		
		Action action = new BoardActionList();
		action.execute(request, response);

	}

}

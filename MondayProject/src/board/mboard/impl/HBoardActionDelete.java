package board.mboard.impl;

import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

import board.mboard.base.*;
import board.mboard.dao.*;

public class HBoardActionDelete implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String idx = request.getParameter("idx");
		
		HtmlDao		htmlDao = new HtmlDao();
		htmlDao.boardDelete(idx);
		
		Action action = new BoardActionList();
		action.execute(request, response);

	}

}

package board.mboard.impl;

import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

import board.mboard.base.*;
import board.mboard.dao.*;
import board.mboard.vo.*;

public class HtmlView implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String idx = request.getParameter("idx");
		
		HtmlDao htmlDao = new HtmlDao();
		HtmlVo	vo		= htmlDao.getBoard(idx);
				
		request.setAttribute("HtmlVo", vo);
		
		String link 	= "/view/htmlview.jsp";
		
		RequestDispatcher rd = request.getRequestDispatcher(link);
		rd.forward(request, response);
				

	}

}

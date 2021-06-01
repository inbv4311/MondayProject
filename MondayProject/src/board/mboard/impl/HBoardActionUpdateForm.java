package board.mboard.impl;

import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

import board.mboard.base.*;
import board.mboard.dao.*;
import board.mboard.vo.*;

public class HBoardActionUpdateForm implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String menu_id = request.getParameter("menu_id");
		String idx	   = request.getParameter("idx");
		
		String path = "/view/HUpdate.jsp";
		
		//수정할 자료 조회
		HtmlDao htmlDao = new HtmlDao();
		HtmlVo	htmlVo  = htmlDao.getBoard(idx);
		request.setAttribute("htmlVo", htmlVo);
		
		request.getRequestDispatcher(path).forward(request, response);

	}

}

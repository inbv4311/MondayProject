package board.mboard.impl;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.http.*;

import board.mboard.base.*;
import board.mboard.dao.*;
import board.mboard.vo.*;

public class HTMLList implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String path = "/view/htmllist.jsp";
		String menu_id	= "HTML";
		
		HtmlDao htmldao = new HtmlDao();
		List<HtmlVo> htmlList = htmldao.getHtmlList(menu_id);
		
		request.setAttribute("htmlList", htmlList);
		
		request.getRequestDispatcher(path).forward(request, response);
		

	}

}

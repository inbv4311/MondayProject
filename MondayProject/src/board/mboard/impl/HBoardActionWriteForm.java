package board.mboard.impl;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.http.*;

import board.mboard.base.*;
import board.mboard.dao.*;
import board.mboard.vo.*;

public class HBoardActionWriteForm implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		///subpage?cmd=WRITEFORM&menu_id=${menuVo.menu_id}&bnum=0&lvl=0&step=0&nref=0
		String path = "/view/HWrite.jsp";
		
		String menu_id = request.getParameter("menu_id");
		int 	bnum   = Integer.parseInt(request.getParameter("bnum"));
		int 	lvl    = Integer.parseInt(request.getParameter("lvl"));
		int 	step   = Integer.parseInt(request.getParameter("step"));
		int 	nref   = Integer.parseInt(request.getParameter("nref"));
		
		HtmlVo htmlVo = new HtmlVo();
		htmlVo.setBnum(bnum);
		htmlVo.setLvl(lvl);
		htmlVo.setStep(step);
		htmlVo.setNref(nref);
		request.setAttribute("htmlVo", htmlVo);
		
		request.getRequestDispatcher(path).forward(request, response);
		
	}

}

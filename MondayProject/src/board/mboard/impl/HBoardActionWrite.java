package board.mboard.impl;

import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

import board.mboard.base.*;
import board.mboard.dao.*;
import board.mboard.vo.*;

public class HBoardActionWrite implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String menu_id = request.getParameter("menu_id");
		String title   = request.getParameter("title");
		String writer  = request.getParameter("writer");
		String cont    = request.getParameter("cont");
		
		int bnum 	= Integer.parseInt(request.getParameter("bnum"));
		int lvl 	= Integer.parseInt(request.getParameter("lvl"));
		int step 	= Integer.parseInt(request.getParameter("step"));
		int nref 	= Integer.parseInt(request.getParameter("nref"));
		
		HtmlVo vo = new HtmlVo(title, cont, writer, bnum, lvl, step, nref, menu_id);
		
		
		//새글쓰기 수행
		HtmlDao htmlDao  = new HtmlDao();
		htmlDao.insertBoard(vo);
		
		//게시판 조회하기
		Action action = new BoardActionList();
		action.execute(request, response);
	}

}

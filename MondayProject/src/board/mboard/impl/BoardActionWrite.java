package board.mboard.impl;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.mboard.base.Action;
import board.mboard.dao.BoardDao;
import board.mboard.vo.BoardVo;

public class BoardActionWrite implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// POSt request
		// hidden :  menu_id, bnum, lvl, step, nref,
		// input  :  writer, title, cont 
		String   menu_id = request.getParameter("menu_id");
		String   title   = request.getParameter("title");
		String   writer  = request.getParameter("writer");
		String   cont    = request.getParameter("cont");
		
		int      bnum    = Integer.parseInt( request.getParameter("bnum"));
		int      lvl     = Integer.parseInt( request.getParameter("lvl"));
		int      step    = Integer.parseInt( request.getParameter("step"));
		int      nref    = Integer.parseInt( request.getParameter("nref"));
				
		BoardVo vo =new BoardVo( title, cont, writer, 
				    bnum, lvl, step, nref, menu_id);		
		
		// 새글 쓰기 수행
		BoardDao boardDao = new BoardDao();
		boardDao.setBoardInsert( vo );
		
		// 게시판 조회하기		
		Action action = new BoardActionList();
		action.execute(request, response);

	}

}







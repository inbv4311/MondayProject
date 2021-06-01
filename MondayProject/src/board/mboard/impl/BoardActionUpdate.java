package board.mboard.impl;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.mboard.base.Action;
import board.mboard.dao.BoardDao;

public class BoardActionUpdate implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// UpdateForm 에서 form 태그로 이동해옴
		// request form data
		// menu_id, idx, title, cont
		String idx    = request.getParameter("idx");
		String title  = request.getParameter("title");
		String cont   = request.getParameter("cont");
				
		// idx 번자료를 입력한 항목으로 수정한다
		BoardDao   boardDao = new BoardDao();   
		boardDao.setBoardUpdate(idx, title, cont);
					
		// 게시판으로 이동 - 게시물을 조회해서
		Action action = new BoardActionList();
		action.execute(request, response);

	}

}








package board.mboard.impl;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.mboard.base.Action;
import board.mboard.dao.BoardDao;
import board.mboard.dao.MenuDao;
import board.mboard.vo.BoardVo;
import board.mboard.vo.MenuVo;

public class BoardActionView implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// cmd=VIEW&idx=1&menu_id=MENU01"
		String   path  =  "/board/view.jsp";
		
		String   idx      = request.getParameter("idx");
		String   menu_id  = request.getParameter("menu_id");
		
		request.setAttribute("menu_id", menu_id);
		
		MenuDao      menuDao   = new MenuDao();
		List<MenuVo> menuList  = menuDao.getMenuList();
		request.setAttribute("menuList", menuList);

		BoardDao boardDao = new BoardDao(); 
		BoardVo  boardVo  = boardDao.getBoard(idx);
		
		request.setAttribute("boardVo", boardVo);
		
		
		request.getRequestDispatcher(path).forward(request, response);

	}

}








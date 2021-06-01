package board.mboard.impl;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.mboard.base.Action;
import board.mboard.dao.BoardDao;
import board.mboard.dao.MenuDao;
import board.mboard.vo.BoardVo;
import board.mboard.vo.MenuVo;

public class BoardActionList implements Action {

	@Override
	public void execute(HttpServletRequest request,
			HttpServletResponse response)
					throws ServletException, IOException {
		
		String  path    = "/board/list.jsp";
		
		String  menu_id = request.getParameter("menu_id");
		
		MenuVo  menuVo  = new MenuVo();
		menuVo.setMenu_id(menu_id);
		request.setAttribute("menuVo", menuVo);
		
		// 메뉴목록
		MenuDao      menuDao  = new MenuDao();
		List<MenuVo> menuList = menuDao.getMenuList();
		request.setAttribute("menuList", menuList);
		
		// 게시물 목록
		BoardDao       dao   = new BoardDao();
		List<BoardVo>  list  = dao.getBoardList(menu_id);
		
		request.setAttribute("boardList", list);
		
		request.getRequestDispatcher(path).forward(request, response);
		
	}

}
















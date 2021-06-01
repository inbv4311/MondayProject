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

public class BoardActionUpdateForm implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		///mboard?cmd=UPDATEFORM&menu_id=MENU01&idx=5
		
		String menu_id  = request.getParameter("menu_id");
		String idx      = request.getParameter("idx");
		
		String  path = "/board/update.jsp";
			
		// 전체 메뉴 목록
		MenuDao       menuDao  = new MenuDao();
		List<MenuVo>  menuList = menuDao.getMenuList();		
		request.setAttribute("menuList", menuList);
		
		// 현재 메뉴 정보		
		String       menu_name  = menuDao.getMenuName(menu_id);  
		MenuVo       menuVo     = new MenuVo();
		menuVo.setMenu_id(menu_id);
		menuVo.setMenu_name(menu_name);
		request.setAttribute("menuVo", menuVo);
				
		// 수정할 자료 조회
		BoardDao  boardDao  =  new BoardDao(); 
		BoardVo   boardVo   =  boardDao.getBoard(idx);
		request.setAttribute("boardVo", boardVo);
		
		request.getRequestDispatcher(path).forward(request, response);

	}

}









package board.mboard.impl;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.mboard.base.Action;
import board.mboard.dao.MenuDao;

public class MenuActionDelete implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 넘어온 정보 저장 - 삭제할 메뉴번호
		String 	menu_id = request.getParameter("menu_id");	
		
		// 메뉴 삭제
		MenuDao   menuDao = new MenuDao();
		menuDao.deleteMenu(menu_id);
		
		// 목록으로 이동
		String path = "/mboard?cmd=MENULIST";
		request.getRequestDispatcher(path).forward(request, response);

	}

}

package board.mboard.impl;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.mboard.base.Action;
import board.mboard.dao.MenuDao;
import board.mboard.vo.MenuVo;

public class MenuActionUpdate implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 메뉴 수정
		MenuDao  menuDao   =  new MenuDao();
		String   menu_id   =  request.getParameter("menu_id");
		String   menu_name =  request.getParameter("menu_name");
		int      menu_seq  =  
			  Integer.parseInt( request.getParameter("menu_seq") );
		MenuVo   menuVo    =  new MenuVo(menu_id, menu_name, menu_seq);
		menuDao.updateMenu(menuVo);
		
		
		// 메뉴 목록 조회
		// 메뉴리스트로 이동(조회)한다
		String  path  = "/mboard?cmd=MENULIST";		
		request.getRequestDispatcher(path).forward(request,  response);


	}

}

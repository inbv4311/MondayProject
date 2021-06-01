package board.mboard.impl;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.mboard.base.Action;
import board.mboard.dao.MenuDao;
import board.mboard.vo.MenuVo;

public class MenuActionWrite implements Action {

	@Override
	public void execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		// 넘어온 정보로 저장
		response.setCharacterEncoding("utf-8");
		String   menu_name = request.getParameter("menu_name");  
		
		MenuDao   menuDao  = new MenuDao();
		MenuVo    menuVo   = new MenuVo();
		menuVo.setMenu_name( menu_name );
		menuDao.menuInsert( menuVo );		
		
		// 메뉴리스트로 이동(조회)한다
		String  path  = "/mboard?cmd=MENULIST";		
		request.getRequestDispatcher(path).forward(request,  response);

	}

}









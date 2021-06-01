package board.mboard.impl;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.mboard.base.Action;
import board.mboard.dao.MenuDao;
import board.mboard.vo.MenuVo;

public class MenuActionList implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String        path      = "/board/menulist.jsp";
		
		MenuDao       menuDao   = new MenuDao();
		List<MenuVo>  menuList  = menuDao.getMenuList(); 
		
		System.out.println( menuList );
		request.setAttribute("menuList", menuList);
		
		// 페이지 이동
		request.getRequestDispatcher(path).forward(request, response);
				
	}	
	
}









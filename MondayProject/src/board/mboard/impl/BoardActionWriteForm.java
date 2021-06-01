package board.mboard.impl;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.mboard.base.Action;
import board.mboard.dao.MenuDao;
import board.mboard.vo.BoardVo;
import board.mboard.vo.MenuVo;

public class BoardActionWriteForm implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// "/mboard?cmd=WRITEFORM&menu_id=MENU01&bnum=0&lvl=0&step=0&nref=0"
		
		String path     = "/board/write.jsp";
		
		String menu_id  = request.getParameter("menu_id"); 
		int   bnum      = Integer.parseInt( request.getParameter("bnum")); 
		int   lvl       = Integer.parseInt( request.getParameter("lvl")); 
		int   step      = Integer.parseInt( request.getParameter("step")); 
		int   nref      = Integer.parseInt( request.getParameter("nref")); 
		
		// 메뉴 목록 조회
		MenuDao      menuDao  = new MenuDao();
		List<MenuVo> menuList = menuDao.getMenuList();
		request.setAttribute("menuList", menuList );
		
		String   menu_name = menuDao.getMenuName(menu_id);
					
		// 메뉴 번호 저장
		MenuVo   menuVo  = new MenuVo();
		menuVo.setMenu_id(menu_id);
		menuVo.setMenu_name(menu_name);
		request.setAttribute("menuVo", menuVo); 
		
		
		// 새글(답글)쓰기를 위한 변수설정 0 답글처리를 위한  		
		BoardVo  boardVo = new BoardVo();
		boardVo.setBnum( bnum );
		boardVo.setLvl(lvl);
		boardVo.setStep(step);
		boardVo.setNref(nref);		
		request.setAttribute("boardVo", boardVo);
		
		request.getRequestDispatcher(path).forward(request, response);

	}

}










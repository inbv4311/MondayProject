package board.mboard.impl;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.mboard.base.Action;
import board.mboard.dao.MenuDao;
import board.mboard.vo.MenuVo;

public class MenuActionUpdateForm implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String  menu_id  = request.getParameter("menu_id");
		// 수정할 데이터를 조회
		MenuDao menuDao =  new MenuDao();
		MenuVo  menuVo  =  menuDao.getMenu(menu_id);
						
		System.out.println("MenuActionUpdateForm:" + menuVo);		
		
		// 수정할 데이터 저장(attribute)
		request.setAttribute("menuVo", menuVo);
		
		// 수정할 데이터를 입력받는 화면으로 이동
		String  path  = "/board/menuupdate.jsp";		
		request.getRequestDispatcher(path).forward(request,  response);

	}

}




package board.member.servlet;

import java.io.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.mboard.dao.*;
import board.mboard.vo.*;


@WebServlet("/jsearch")
public class JSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String search		= request.getParameter("search");
		JavaDao javaDao		= new JavaDao();
		JavaVo	vo			= javaDao.getData(search);
		
		response.setContentType("text/xml;charset=utf-8");
		
		PrintWriter out = response.getWriter();
		
		String xml = vo.toXML();
		out.print(xml);
		out.flush();
		out.close();
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}

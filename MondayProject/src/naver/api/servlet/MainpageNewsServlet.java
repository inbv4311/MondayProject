package naver.api.servlet;

import java.io.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import naver.api.util.*;


@WebServlet("/mainnews")
public class MainpageNewsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//request 넘어오는 정보 처리
		response.setCharacterEncoding("utf-8");
		
		String keyword		= "개발자";
		String currentPage	= "1";
		int display			= 4;
		int start 			= Integer.parseInt(currentPage);
		
		//중간처리
		GetNaverNews getNaverNews = new GetNaverNews();
		String data = getNaverNews.showNews(keyword, display, start);
		
		response.setContentType("application/json;charset=utf-8");
		
		PrintWriter out = response.getWriter();
		out.print(data);
		out.flush();
		out.close();
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

package board.member.servlet;

import java.io.*;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.mboard.dao.*;
import board.mboard.vo.*;

@WebServlet("/emailcheck")
public class EmailDupCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;

	//http://localhost:9090/emailcheck?email=anyataylor@gmail.com
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = request.getParameter("email");
		MemberDao memdao = new MemberDao();
		
		int result = memdao.emailCheck(email);
		
		String html = "";
		if(result== 1)
			html += "이미 사용중인 이메일 입니다";
		else if (result==0)
			html += "사용가능한 이메일 입니다";
		else 
			html += "오류발생";
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(html);
		out.flush();
		out.close();
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}

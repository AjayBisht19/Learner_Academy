package com.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public loginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			String email=request.getParameter("email");
			String password=request.getParameter("password");
			int match=0;
			
				if (email.equals("admin@gmail.com")) {
					if(password.equals("admin123")) {
						match=1;
					}
				}else {
					match=0;
				}
			
				
				HttpSession s=request.getSession();
			
			if(match==1) {
				
				s.setAttribute("admin","admin");
				response.sendRedirect("adminpage.jsp");
			}
			else {
				s.setAttribute("admin",null);
				response.sendRedirect("login.jsp");
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}

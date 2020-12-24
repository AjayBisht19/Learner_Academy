package com.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;


import com.entities.Teachers;
import com.helper.FactoryProvider;


public class deleteTeacherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public deleteTeacherServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int teacherId=Integer.parseInt(request.getParameter("teacherId").trim());
		Session s= FactoryProvider.getFactory().openSession();
		Transaction t= s.beginTransaction();
		Teachers tea=(Teachers)s.get(Teachers.class, teacherId);
		
		s.delete(tea);
		t.commit();
		s.close();
		response.sendRedirect("adminpage.jsp");
		}

	

}

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


public class addTeacherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public addTeacherServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
try {
			
			
			
				String teacher=request.getParameter("teacherName");
				Teachers tea=new Teachers(teacher);				
				 Session s= FactoryProvider.getFactory().openSession(); 
				 Transaction tx=s.beginTransaction();
				 s.save(tea); 
				 tx.commit(); 
				 s.close();
				 response.sendRedirect("adminpage.jsp");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}

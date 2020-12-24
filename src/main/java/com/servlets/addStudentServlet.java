package com.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.ClassStudents;

import com.helper.FactoryProvider;


public class addStudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public addStudentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
try {
			
			String classs=request.getParameter("classs");
			String stName= request.getParameter("studentName");
			ClassStudents cls=new ClassStudents(classs,stName);				
			 Session s= FactoryProvider.getFactory().openSession(); 
			 Transaction tx=s.beginTransaction(); s.save(cls); tx.commit(); 
			 s.close();
				 response.sendRedirect("adminpage.jsp"); 
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}

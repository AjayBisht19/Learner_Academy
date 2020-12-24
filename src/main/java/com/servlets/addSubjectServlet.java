package com.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Subjects;

import com.helper.FactoryProvider;


public class addSubjectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public addSubjectServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			
			String subject=request.getParameter("subjectName");
			Subjects sub=new Subjects(subject);				
			 Session s= FactoryProvider.getFactory().openSession(); 
			 Transaction tx=s.beginTransaction(); s.save(sub); tx.commit(); 
			 s.close();
			 response.sendRedirect("adminpage.jsp");
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}

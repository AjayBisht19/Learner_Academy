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


public class deleteSubjectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public deleteSubjectServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int subId=Integer.parseInt(request.getParameter("subId").trim());
		Session s= FactoryProvider.getFactory().openSession();
		Transaction t= s.beginTransaction();
		Subjects sub=(Subjects)s.get(Subjects.class, subId);
		
		s.delete(sub);
		t.commit();
		s.close();
		response.sendRedirect("adminpage.jsp");
	}

	
	

}

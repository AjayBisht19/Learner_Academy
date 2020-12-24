package com.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.ClassStudents;
import com.entities.Subjects;
import com.helper.FactoryProvider;


public class deleteStudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public deleteStudentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int stuId=Integer.parseInt(request.getParameter("ClassId").trim());
		Session s= FactoryProvider.getFactory().openSession();
		Transaction t= s.beginTransaction();
		ClassStudents stu=(ClassStudents)s.get(ClassStudents.class, stuId);
		
		s.delete(stu);
		t.commit();
		s.close();
		response.sendRedirect("adminpage.jsp");
	}

}

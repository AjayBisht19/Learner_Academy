package com.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.ClassStudents;
import com.entities.ClassSubjectAndTeacher;
import com.helper.FactoryProvider;


public class deleteSubjectAndTeacherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public deleteSubjectAndTeacherServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			String classs=request.getParameter("classs");
			int cstId=Integer.parseInt(request.getParameter("ClassId").trim());
			Session s= FactoryProvider.getFactory().openSession();
			Transaction t= s.beginTransaction();
			ClassSubjectAndTeacher cstObj=(ClassSubjectAndTeacher)s.get(ClassSubjectAndTeacher.class, cstId);
			
			s.delete(cstObj);
			t.commit();
			s.close();
			 response.sendRedirect("adminManage.jsp?classs="+classs+"");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	

}

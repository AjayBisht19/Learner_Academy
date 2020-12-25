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


public class addSubjectAndTeacherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public addSubjectAndTeacherServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			
			String classs=request.getParameter("classs");
			String subName= request.getParameter("subjectName");
			String tName= request.getParameter("teacherName");
			System.out.println(subName +"  "+tName);
			ClassSubjectAndTeacher clas=new ClassSubjectAndTeacher(classs,subName,tName);				
			 Session s= FactoryProvider.getFactory().openSession(); 
			 Transaction tx=s.beginTransaction(); 
			 s.save(clas);
			 tx.commit(); 
			 s.close();
				 response.sendRedirect("adminManage.jsp?classs="+classs+""); 
			
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}

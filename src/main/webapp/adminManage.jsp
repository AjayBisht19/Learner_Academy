<%@page import="com.entities.ClassSubjectAndTeacher"%>
<%@page import="com.entities.Teachers"%>
<%@page import="com.entities.Subjects"%>
<%@page import="com.entities.ClassStudents"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.helper.FactoryProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA==" crossorigin="anonymous" />
   
<meta charset="ISO-8859-1">
<title>User</title>
</head>
<body>

<%@include  file="adminNavbar.jsp" %>
<div class="container">
<div class="row"> 
	<div class="col-md-6 text-center">
	<br>
		<h2>Subjects and their teachers</h2>
		 <table class="table mt-3">
		  <thead>
		    <tr>
		  
		     
		     
		      <th scope="col">Subject</th>
		      <th scope="col">Teacher</th>
		      <th scope="col"></th>
		      
		    </tr>
		  </thead>
		  <tbody>
		    
		       
		      <%
  			String classs=request.getParameter("classs");
			Session s3= FactoryProvider.getFactory().openSession();
			Query q3= s3.createQuery("from ClassSubjectAndTeacher where class_=:x");
			q3.setParameter("x",classs);
			List<ClassSubjectAndTeacher> list3=q3.list();
			for(ClassSubjectAndTeacher cst:list3){
				%><tr>
			    <td><%=cst.getSubject() %></td>
			      <td><%=cst.getTeacher() %></td>
			      <td><div class="container">
				<a class="btn btn-outline-danger btn-sm mt-1" href="deleteSubjectAndTeacherServlet?ClassId=<%=cst.getCstId()%>&classs=<%=cst.getClass_()%>"> delete</a>
				</div>
				</td> 
				 </tr>
				<%
			}
			s3.close();
			%>
		  
		   	   
		    </tbody>
		</table>	 
		<!-- Modal -->
			<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalLabel">Add Student</h5>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body">
			        <form action="addSubjectAndTeacherServlet?classs=<%=classs %>" method="POST" >
			        <h6>Select Subject</h6>
						<select class="form-select" name="subjectName">
						<option selected disabled>--Select Subject--</option>
			        	<%Session s= FactoryProvider.getFactory().openSession();
							Query q= s.createQuery("from Subjects");
							List<Subjects> list=q.list();
							for(Subjects sub:list){
								 %>
							 
								<option value="<%= sub.getSubject() %>"><%= sub.getSubject() %></option>
										
						<%}
						s.close();%>
							</select>	
						 
					  	 <br>
					  	 <h6>Select Teacher</h6>
						<select class="form-select" name="teacherName">
						  <option selected disabled>--Select Teacher--</option>
						  <%
		
							Session s1= FactoryProvider.getFactory().openSession();
							Query q1= s1.createQuery("from Teachers");
							List<Teachers> list1=q1.list();
							for(Teachers t:list1){
								%>
						  <option value="<%= t.getTeacher() %>"><%= t.getTeacher() %></option>
						  <%
							}
							s1.close();
							%>
						</select>
						</div>
						 <div class="modal-footer">
					  		<button type="submit" class=" mt-3 btn btn-primary">Add</button>
					  	 </div>
					</form>
			      </div>
			     
			    </div>
			  </div>
			  <a class="btn btn-dark btn-lg" data-bs-toggle="modal" data-bs-target="#exampleModal">Add</a>
			</div>
		 
		  <br>
		  
		
	
	
	
	
	
	
	<!-- Students -->
	
	
	
	
	<div class="col-md-4 offset-md-1 text-center mt-2">
	<br>
		<h2>Students</h2>
		<ul class="list-group mt-3">
  			  <%
  			String classss=request.getParameter("classs");
		Session s2= FactoryProvider.getFactory().openSession();
		Query q2= s2.createQuery("from ClassStudents where class_=:x");
		q2.setParameter("x",classss);
		List<ClassStudents> list2=q2.list();
		for(ClassStudents cs:list2){
			%>
			<li class="list-group-item"><%= cs.getStudent() %>
			<div class="container">
			<a class="btn btn-outline-danger btn-sm mt-1" href="deleteStudentServlet?ClassId=<%=cs.getClassId()%>&classs=<%=cs.getClass_()%>"> delete</a>
			</div> 
			</li>
			<%
		}
		s2.close();
		%>
			<!-- Modal -->
			<div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel1" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalLabel1">Add Student</h5>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body">
			        <form action="addStudentServlet?classs=<%=classs%>" method="POST" >
			        <div class="form-group">
			         	<h6>Enter Student name</h6>
						<input 
						required
						class="form-control"
						type="text" 
						name="studentName" 
						placeholder="Enter Student name"/></div>
						 <div class="modal-footer">
					  		<button type="submit" class=" mt-3 btn btn-primary">Add</button>
					  	 </div>
					</form>
			      </div>
			     
			    </div>
			  </div>
			</div>
		  </ul>
		  <br>
		  <a class="btn btn-dark btn-lg" data-bs-toggle="modal" data-bs-target="#exampleModal1">Add</a>
		
		</div>

</div>
</div>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js" integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-pQQkAEnwaBkjpqZ8RU1fF1AKtTcHJwFl3pblpTlHXybJjHpMYo79HY3hIi4NKxyj" crossorigin="anonymous"></script>

</body>
</html>
<%@page import="com.entities.ClassSubjectAndTeacher"%>
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

<%@include  file="navbar.jsp" %>
<% String classsName=request.getParameter("classs");%>
<div class="container text-center text-primary">
<br>
	<h1><%=classsName %></h1>
</div>
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
		    </tr>
		  </thead>
		  <tbody>
		    <%
  			String clas=request.getParameter("classs");
			Session s3= FactoryProvider.getFactory().openSession();
			Query q3= s3.createQuery("from ClassSubjectAndTeacher where class_=:x");
			q3.setParameter("x",clas);
			List<ClassSubjectAndTeacher> list3=q3.list();
			for(ClassSubjectAndTeacher cst:list3){
				%><tr>
			    <td><%=cst.getSubject() %></td>
			      <td><%=cst.getTeacher() %></td>
			     
				 </tr>
				<%
			}
			s3.close();
			%>
		    
		  </tbody>
		</table>	
	</div>
	
	<div class="col-md-4 offset-md-1 text-center mt-2">
	<br>
		<h2>Students</h2>
		<ul class="list-group mt-3">
  			  <%
  			String classs=request.getParameter("classs");
		Session s1= FactoryProvider.getFactory().openSession();
		Query q1= s1.createQuery("from ClassStudents where class_=:x");
		q1.setParameter("x",classs);
		List<ClassStudents> list1=q1.list();
		for(ClassStudents cs:list1){
			%>
			<li class="list-group-item"><%= cs.getStudent() %>
			
			</li>
			<%
		}
		s1.close();
		%>
		
		  </ul>
		  <br>
		 
		
		</div>





<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js" integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-pQQkAEnwaBkjpqZ8RU1fF1AKtTcHJwFl3pblpTlHXybJjHpMYo79HY3hIi4NKxyj" crossorigin="anonymous"></script>

</body>
</html>
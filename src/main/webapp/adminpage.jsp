<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.entities.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA==" crossorigin="anonymous" />
    <title>Learner's Academy</title>
  </head>
  <body>
    <%@include  file="adminNavbar.jsp" %>

		<div class="container mt-4 text-center">
		<div class="row">
		<div class="col-md-3">
		<h2 >All Subjects</h2><br>
		<ul class="list-group">
		<%
		
		Session s= FactoryProvider.getFactory().openSession();
		Query q= s.createQuery("from Subjects");
		List<Subjects> list=q.list();
		for(Subjects sub:list){
			%>
			<li class="list-group-item"><%= sub.getSubject() %> 
			<div class="container">
			<a class="btn btn-outline-danger btn-sm mt-1" href="deleteSubjectServlet?subId=<%=sub.getId()%>" >delete</a>
			</div>
			</li>
			
			<%
		}
		s.close();
		%>
			<!-- Modal -->
			<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalLabel">Add Subject</h5>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body">
			        <form action="addSubjectServlet" method="POST" >
			        <div class="form-group">
			         	<h6>Enter Subject name</h6>
						<input 
						required
						class="form-control"
						type="text" 
						name="subjectName" 
						placeholder="Enter Subject"/></div>
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
		<a class="btn btn-dark btn-lg" data-bs-toggle="modal" data-bs-target="#exampleModal">Add</a>
		
		</div>
		
		
		
		
		
		<!-- Teachers section -->
		
		
		<div class="col-md-3 offset-md-1">
		<h2 >All Teachers</h2><br>
		<ul class="list-group">
				<%
		
		Session s1= FactoryProvider.getFactory().openSession();
		Query q1= s1.createQuery("from Teachers");
		List<Teachers> list1=q1.list();
		for(Teachers t:list1){
			%>
			<li class="list-group-item"><%= t.getTeacher() %>
			<div class="container">
			<a class="btn btn-outline-danger btn-sm mt-1" href="deleteTeacherServlet?teacherId=<%=t.getId()%>"> delete</a>
			</div>
			</li>
			<%
		}
		s1.close();
		%>
			<!-- Modal -->
			<div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel1" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalLabel1">Add Subject</h5>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body">
			        <form action="addTeacherServlet" method="POST" >
			        <div class="form-group">
			         	<h6>Enter Teacher name</h6>
						<input 
						required
						class="form-control"
						type="text" 
						name="teacherName" 
						placeholder="Enter Teacher name"/></div>
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
		
		<!-- Classes section -->
		
		<div class="col-md-3 offset-md-1">
		<h2 >All Classes</h2><br>
		<ul class="list-group">
			
		<li class="list-group-item"><a href="adminManage.jsp?classs=ClassI">Class I</a></li>
		<li class="list-group-item"><a href="adminManage.jsp?classs=ClassII">Class II</a></li>
		<li class="list-group-item"><a href="adminManage.jsp?classs=ClassIII">Class III</a></li>
		<li class="list-group-item"><a href="adminManage.jsp?classs=ClassIV">Class IV</a></li>
		<li class="list-group-item"><a href="adminManage.jsp?classs=ClassV">Class V</a></li>
		<li class="list-group-item"><a href="adminManage.jsp?classs=ClassVI">Class VI</a></li>
		<li class="list-group-item"><a href="adminManage.jsp?classs=ClassVII">Class VII</a></li>
		<li class="list-group-item"><a href="adminManage.jsp?classs=ClassVIII">Class VIII</a></li>
		<li class="list-group-item"><a href="adminManage.jsp?classs=ClassIX">Class IX</a></li>
		<li class="list-group-item"><a href="adminManage.jsp?classs=ClassX">Class X</a></li>
		<li class="list-group-item"><a href="adminManage.jsp?classs=ClassXI">Class XI</a></li>
		<li class="list-group-item"><a href="adminManage.jsp?classs=ClassXII">Class XII</a></li>
		 
		 
		</ul><br>
		
		<p class="mx-1">Click on the class to assign subjects and teachers or to manage student in the class.</p>
		</div>
</div>
</div>
   
   
   
   
   
   
   
   
  
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js" integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-pQQkAEnwaBkjpqZ8RU1fF1AKtTcHJwFl3pblpTlHXybJjHpMYo79HY3hIi4NKxyj" crossorigin="anonymous"></script>
 </body>
</html>
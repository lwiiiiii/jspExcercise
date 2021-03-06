<%@page import="jdbc02.UserDao"%>
<%@page import="java.util.List"%>
<%@page import="jdbc02.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%  
	int pageSize = 10;
	int currentPage = 1;
	int recordCount = UserDao.count();
	
	if(request.getParameter("pg") != null) 
		currentPage = Integer.parseInt(request.getParameter("pg"));
	
	List<User> list = UserDao.findAll(currentPage, pageSize);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
<style> 
	body { font-family: 굴림체; } 
	thead th { background-color: #eee; } 
	table.table { width: 700px; } 
</style>
<title>Insert title here</title>
</head>
<body>

<div class="container">
<h1>사용자 목록</h1>
<table class="table table-bordered table-condensed">
	<thead>
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>이메일</th>
			<th>학과</th>
			<th>사용자 유형</th>
		</tr>
	</thead>
	<tbody>
		<% for(User user : list){ %>
			<tr>
				<td><%=user.getUserid() %></td>
				<td><%=user.getName() %></td>
				<td><%=user.getEmail() %></td>
				<td><%=user.getDepartmentName() %></td>
				<td><%=user.getUserType() %></td>
			</tr>
			<%} %>
	</tbody>
</table>
<% if(currentPage > 1){ %>
	<a class="btn btn-default" href="userList.jsp?pg=<%= currentPage - 1 %>" >이전</a>
<%} %>
<% if(currentPage < ((recordCount+(pageSize - 1))/pageSize)){ %>
	<a class="btn btn-default" href="userList.jsp?pg=<%= currentPage + 1 %>" >다음</a>
<%} %>
</div>
</body>
</html>
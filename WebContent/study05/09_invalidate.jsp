<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
	session.setAttribute("s_name1", "첫 번째 값");
	session.setAttribute("s_name2", "두 번째 값");
	session.setAttribute("s_name3", "세 번째 값");
	
	out.print("<h3> >> 세션 값을 삭제하기 전 << </h3>");
	Enumeration names;
	names = session.getAttributeNames();
	while(names.hasMoreElements()){
		String name = names.nextElement().toString();
		String value = session.getAttribute(name).toString();
		out.println(name + " : " + value + "<br />");
	}
	
	session.invalidate();
	
	out.print("<h3> >> 세션 값을 삭제한 후 << </h3>");
%>
<%= request.isRequestedSessionIdValid() ? "세션 아이디가 유효합니다." : "세션 아이디가 유효하지 않습니다." %>
</body>
</html>
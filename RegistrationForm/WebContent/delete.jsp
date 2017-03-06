
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.mysql.jdbc.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Delete</title>
</head>
<body>

 <sql:setDataSource var="con" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/eemployee" user="root"
		password="root" />
	
 <%
		String firstname = request.getParameter("firstname");
		session.setAttribute("firstname", firstname);
		
		%>
		<sql:update var="result" dataSource="${con }">
		delete from user where firstname = '<%=firstname %>';
		</sql:update>
		<c:if test="${result>=1 }">success</c:if>
		<c:if test="${result==0 }">fail</c:if>
	<%
	RequestDispatcher dispatcher= request.getRequestDispatcher("index.jsp");
	dispatcher.forward(request, response);
 %>
	
</body>
</html>
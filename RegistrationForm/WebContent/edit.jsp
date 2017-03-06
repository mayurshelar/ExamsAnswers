<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Form</title>
</head>
<body>
	<sql:setDataSource var="con" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/eemployee" user="root"
		password="root" />
	<%
		String firstname = request.getParameter("firstname");
		session.setAttribute("firstname", firstname);
	%>
	<sql:query var="result" dataSource="${con }">
		select * from user where firstname = '<%=firstname%>';
		</sql:query>
	<form action="save" method="post" name="myform"
		onsubmit="return validateform() ">
		<table>
			<c:forEach var="res" items="${result.rows }">

				<tr>
					<td>Username:</td>
					<td><input type="text" name="username"
						value="${res.firstname }"></td>
				</tr>
				<tr>
					<td>Password:</td>
					<td><input type="password" name="password"
						value="${res.lastname }"><br>
				<tr>
					<td>Confirm Password:</td>
					<td><input type="password" name="confirmpassword"
						value="${res.password }"></td>
				</tr>
				<tr>
					<td>FirstName:</td>
					<td><input type="text" name="firstname"
						value="${res.firstname }"></td>
				</tr>
				<tr>
					<td>Lastname:</td>
					<td><input type="text" name="lastname"
						value="${res.lastname }"></td>
				</tr>
				<tr>
					<td>Email:</td>
					<td><input type="text" name="email" value="${res.email }"></td>
				</tr>
				<tr>
					<td>Phone No:</td>
					<td><input type="text" name="phone" value="${res.phone }"></td>
				</tr>
				<tr>
					<td>Location:</td>
					<td><input type="text" name="location"
						value="${res.location }"></td>
				</tr>

			</c:forEach>
			<tr>
				<td><input type="submit" name="save" value="Save"></td>
			</tr>
			<script>
					function validateform() {
						var username = document.myform.username.value;
						if (username == null || username == "") {
							alert("UserName can't be blank");
							
						}
						
						var password = document.myform.password.value;
						var confirmpassword=document.myform.confirmpassword.value;
						if (password == confirmpassword) {
							
						} else {
							alert("Both passwords must be same!");
						
						}
						
						var firstname = document.myform.firstname.value;
						if (firstname == null || firstname == "") {
							alert("firstname can't be blank");
							
						}
						
						var lastname = document.myform.lastname.value;
						if (lastname == null || lastname == "") {
							alert("lastname can't be blank");
							
						}
						var x = document.myform.email.value;
					    var atpos = x.indexOf("@");
					    var dotpos = x.lastIndexOf(".");
					    if (atpos<1 || dotpos<atpos+2 || dotpos+2 >= x.length) {
					        alert("Enter a valid e-mail address");
					        return false;
					    }
					    
					   // var num=document.myform.phone.value; 
					    var x = document.myform.phone.value; 
			            var y = document.myform.phone.value; 
			           if(isNaN(x)||x.indexOf(" ")!=-1)
			           {
			              alert("Enter numeric value")
			              return false;
			           }
			           if (y.length>10)
			           {
			                alert("enter 10 digit mobile no.");
			                return false;
			           }       
					    
					    var location = document.myform.location.value;
						if (location == null || location == "") {
							alert("location can't be blank");
							
						}
					}

					function restFunction() {
						document.getElementById("RegistrationForm").reset();
					}
				</script>
		</table>
	</form>


</body>
</html>
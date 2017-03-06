<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration Form</title>
</head>
<body>
	<div align="center">
		Registration form
		<form action="reg" method="post" id="RegistrationForm" name="myform"
			onsubmit="return validateform() ">
			<table>
				<tr>
					<td>Username:</td>
					<td><input type="text" name="username" value=""></td>
				</tr>
				<tr>
					<td>Password:</td>
					<td><input type="password" name="password" value=""><br>
				<tr>
					<td>Confirm Password:</td>
					<td><input type="password" name="confirmpassword" value=""></td>
				</tr>
				<tr>
					<td>FirstName:</td>
					<td><input type="text" name="firstname"></td>
				</tr>
				<tr>
					<td>Lastname:</td>
					<td><input type="text" name="lastname" value=""></td>
				</tr>
				<tr>
					<td>Email:</td>
					<td><input type="text" name="email" value=""></td>
				</tr>
				<tr>
					<td>Phone No:</td>
					<td><input type="text" name="phone" value=""><span
						id="numloc"></span></td>
				</tr>
				<tr>
					<td>Location:</td>
					<td><input type="text" name="location" value=""></td>
				</tr>
				<tr>
					<td><input type="submit" name="save" value="Save"> <input
						type="button" onclick="restFunction()" value="Reset"></td>
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
					    if (atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length) {
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

		<sql:setDataSource var="con" driver="com.mysql.jdbc.Driver"
			url="jdbc:mysql://localhost:3306/eemployee" user="root"
			password="root" />
		<sql:query dataSource="${con }" var="result">
 select firstname,lastname,email,phone,location from user;
</sql:query>
		<c:if test="${result.rowCount!=0 }">
			<table border="1" width="50%">
				<tr>
					<th>First Name</th>
					<th>Last Name
					<th>Email</th>
					<th>Phone</th>
					<th>Location</th>

				</tr>

				<c:forEach var="res" items="${result.rows }">
					<tr>
						<td><c:out value="${res.firstname }"></c:out></td>
						<td><c:out value="${res.lastname }"></c:out></td>
						<td><c:out value="${res.email }"></c:out></td>
						<td><c:out value="${res.phone }"></c:out></td>
						<td><c:out value="${res.location }"></c:out></td>
						<td><a href="edit.jsp?firstname=${res.firstname}">Edit</a></td>
						<td><a href="delete.jsp?firstname=${res.firstname}">Delete</a></td>
					</tr>


				</c:forEach>
			</table>
		</c:if>
		<c:if test="${result.rowCount==0 }">
			<c:out value="NO DATA PRESENT"></c:out>
		</c:if>


	</div>
</body>
</html>
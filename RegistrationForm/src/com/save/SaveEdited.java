package com.save;

import java.io.IOException;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.servlet.GenericServlet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import com.user.UserDetails;

public class SaveEdited extends GenericServlet{

	@Override
	public void service(ServletRequest request, ServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		UserDetails userDetails = new UserDetails();
		String uname= userDetails.setUsername(request.getParameter("username"));
		String passwd=userDetails.setPassword(request.getParameter("password"));
		String cpwd=userDetails.setConfirmpassword(request.getParameter("confirmpassword"));
		String fname=userDetails.setFirstname(request.getParameter("firstname"));
		String lname=userDetails.setLastname(request.getParameter("lastname"));
		String phn= request.getParameter("phone");
		String loc = userDetails.setLocation(request.getParameter("location"));
		String email= userDetails.setEmail(request.getParameter("email"));
		ServletContext context = getServletContext();
		String driver= context.getInitParameter("driver");
		String usr = context.getInitParameter("usn");
		String pwd = context.getInitParameter("pwd");
		String url = context.getInitParameter("url");
		try {
			Class.forName(driver);
			java.sql.Connection connection = DriverManager.getConnection(url, usr, pwd);
			java.sql.PreparedStatement preparedStatement = connection.prepareStatement("update user set firstname=?, lastname=?,email=?,phone=?,location=?,password=?,username=? where firstname=?");
			preparedStatement.setString(1, fname);
			preparedStatement.setString(2, lname);
			preparedStatement.setString(3, email);
			preparedStatement.setString(4, phn);
			preparedStatement.setString(5, loc);
			preparedStatement.setString(6, passwd);
			preparedStatement.setString(7, uname);
			preparedStatement.setString(8, fname);
			preparedStatement.execute();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		RequestDispatcher dispatcher= request.getRequestDispatcher("index.jsp");
		dispatcher.forward(request, response);
	}
	
	
}

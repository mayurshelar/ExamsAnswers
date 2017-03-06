package com.user;

import java.math.BigDecimal;
import java.math.BigInteger;

public class UserDetails {

	
	public String getUsername() {
		return username;
	}
	public String setUsername(String username) {
		return this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public String setPassword(String password) {
		return this.password = password;
	}
	public String getConfirmpassword() {
		return confirmpassword;
	}
	public String setConfirmpassword(String confirmpassword) {
		return this.confirmpassword = confirmpassword;
	}
	public String getFirstname() {
		return firstname;
	}
	public String setFirstname(String firstname) {
		return this.firstname = firstname;
	}
	public String getLastname() {
		return lastname;
	}
	public String setLastname(String lastname) {
		return this.lastname = lastname;
	}
	public String getEmail() {
		return email;
	}
	public String setEmail(String email) {
		return this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public String setPhone(String phone) {
		return this.phone = phone;
	}
	public String getLocation() {
		return location;
	}
	public String setLocation(String location) {
		return this.location = location;
	}
	private String username;
	private String password;
	private String confirmpassword;
	private String firstname;
	private String lastname;
	private String email;
	private String phone;
	private String location;
}

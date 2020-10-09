<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<%

String car_id = request.getParameter("car_id");
String first_name = request.getParameter("first_name");
String last_name = request.getParameter("last_name");
String country = request.getParameter("country");
String city = request.getParameter("city");
String mobile = request.getParameter("mobile");
String email = request.getParameter("email");
String start_date = request.getParameter("start_date");
String end_date = request.getParameter("end_date");
int output = -5;

try
{
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver"); // com.mysql.jdbc.Driver
	Connection conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=rentacar;", "sa", "Pentium123!");
	//Statement st=conn.createStatement();

	String SPsql = "EXEC dbo.CreateReservation  ?,?,?,?,?,?,?,?,?,?";
	PreparedStatement ps = conn.prepareStatement(SPsql);
	ps.setEscapeProcessing(true);
	ps.setQueryTimeout(60);
	ps.setString(1, car_id);
	ps.setString(2, first_name);
	ps.setString(3, last_name);
	ps.setString(4, country);
	ps.setString(5, city);
	ps.setString(6, mobile);
	ps.setString(7, email);
	ps.setString(8, start_date);
	ps.setString(9, end_date);
	ps.setInt(10, output);
	int count = ps.executeUpdate();
	int update_count = ps.getUpdateCount();
	String warnMessage = ps.getWarnings().getMessage();
	if (warnMessage != null && !warnMessage.equalsIgnoreCase("")) {
		out.println(warnMessage);
	}
}
catch(Exception e)
{
	System.out.print(e);
	e.printStackTrace();
}
finally {
	//conn.close();
}
%>
<%--@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" --%>
<%@ page import="java.sql.*,java.io.*,com.oreilly.servlet.*"  %>

<%! Connection c=null; %>

<% 
try
{
/* Class.forName("oracle.jdbc.driver.OracleDriver");
c=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","root"); */

Class.forName("com.mysql.jdbc.Driver");
c=DriverManager.getConnection("jdbc:mysql://localhost:3306/dimendb","root","");

}
catch(SQLException e)
{
	out.println(e.getMessage());
}

%>
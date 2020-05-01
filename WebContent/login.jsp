<%@page import="javax.servlet.http.Cookie" %>
<%@ include file="includes/dbconnection.jsp" %>
<%@ include file="includes/layouts/header.jsp" %>
<br><br>
<div class="main">
<% 
if(!(session.getAttribute("username")==null)) 
response.sendRedirect("account.jsp");
%>
<div class="login">
<% 
if(session.getAttribute("regsuc")!=null)
{
	out.println("<div class='loginerrors'>"+session.getAttribute("regsuc")+"</div>");
	session.removeAttribute("regsuc");
}
%>
<%
String un="",pwd="";
Cookie c[]=request.getCookies();
if(c!=null)
{
	for(int i=0;i<c.length;i++)
	{
		if(c[i].getName().equals("usern"))
			un=c[i].getValue();
		if(c[i].getName().equals("pwd"))
			pwd=c[i].getValue();
	}
}
%>
<h2>
Please Login to Continue:
</h2>
<pre>
<% 
if(session.getAttribute("errors")!=null)
{
	out.println("<div class='loginerrors'>"+session.getAttribute("errors")+"</div>");
	session.removeAttribute("errors");
}
%>
<form action="account.jsp" method="post" name="login">
Username:			<input type="text" name="username" value="<%=un%>" required><br>
Password:			<input type="password" name="password" value="<%=pwd%>" required><br>
<input type="checkbox" name="rememberme" value="true"> Remember me<br><br>
<input type="submit" value="Login" class="loginbtn">		<input type="Reset" value="Cancel" class="loginbtn">
</form></pre><br>
<div class="signup">
<a href="register.jsp">Not Registered Yet... SIGN UP</a>
</div>
<br><br><br>
</div>
</div>
<%@ include file="includes/layouts/footer.jsp" %>
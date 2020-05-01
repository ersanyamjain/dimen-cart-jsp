<%@page import="javax.servlet.http.Cookie" %>
<%@ include file="includes/dbconnection.jsp" %>
<%@ include file="includes/layouts/header.jsp" %>
<br><br>
<div class="main">
<% 
if(!(session.getAttribute("ausername")==null)) 
response.sendRedirect("admin.jsp");
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
String aun="",apwd="";
Cookie c[]=request.getCookies();
if(c!=null)
{
	for(int i=0;i<c.length;i++)
	{
		if(c[i].getName().equals("ausern"))
			aun=c[i].getValue();
		if(c[i].getName().equals("apwd"))
			apwd=c[i].getValue();
	}
}
%>
<h2>
Administrator Login Panel:
</h2>
<pre>
<% 
if(session.getAttribute("errors")!=null)
{
	out.println("<div class='loginerrors'>"+session.getAttribute("errors")+"</div>");
	session.removeAttribute("errors");
}
%>
<form action="admin.jsp" method="post" name="login">
Username:			<input type="text" name="username"  value="<%=aun%>" required><br>
Password:			<input type="password" name="password" value="<%=apwd%>" required><br>
<input type="checkbox" name="arememberme" value="true"> Remember me<br><br>
<input type="submit" value="Login" class="loginbtn">		<input type="Reset" value="Cancel" class="loginbtn">
</form></pre><br>
<div class="signup">
</div>
<br><br><br>
</div>
</div>
<%@ include file="includes/layouts/footer.jsp" %>
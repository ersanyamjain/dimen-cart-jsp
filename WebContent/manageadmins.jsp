
<%@ include file="includes/dbconnection.jsp" %>
<%@ include file="includes/layouts/header.jsp" %>
<div class="main">
<div class="products">
<h1 style="color:#1D62B6">Manage Admins:</h1>
<%
if(session.getAttribute("success")!=null)
{
	out.println("<br><div class='loginerrors'>"+session.getAttribute("success")+"</div><br><br>");
	session.removeAttribute("success");
}
%>
<%
out.println("<a href='addadmin.jsp'>Add New Admin</a><br><br>");
int adid;
String username,password,sql;
Statement s=c.createStatement();
if(session.getAttribute("aid")!=null)
{
	sql="select * from admins order by username";
	out.println("<table border='1' cellpadding='10'><th>Admin ID</th><th>Username</th><th>Operations</th>");
	ResultSet rs=s.executeQuery(sql);
	while(rs.next())
	{
		adid=rs.getInt("id");
		username=rs.getString("username");
		if(adid!=(Integer)session.getAttribute("aid"))
		out.println("<tr align='center'><td>"+adid+"</td>"+"<td>"+username+"</td>"+"<td><a href='editadmin.jsp?adminid="+adid+"'>Edit</a>&nbsp;&nbsp;<a href='deladmin.jsp?adminid="+adid+"' onclick='confirm()'>Delete</a></td>"+"</tr>");
	}
	out.println("</table><br><br><br>");
}
else
{
	response.sendRedirect("adminlogin.jsp");
}
%>
</div>
</div>
<%@ include file="includes/layouts/footer.jsp" %>
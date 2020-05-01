
<%@ include file="includes/dbconnection.jsp" %>
<%@ include file="includes/layouts/header.jsp" %>
<div class="main">
<div class="products">
<h1 style="color:#1D62B6">Your Previous Orders:</h1>
<ul>
<%
int orderno,uid,amt,items;
String sql;
Statement s=c.createStatement();
if(session.getAttribute("id")!=null)
{
	uid=(Integer)session.getAttribute("id");
	sql="select * from orders where userid="+uid+" order by number desc";
	out.println("<ul>");
	ResultSet rs=s.executeQuery(sql);
	while(rs.next())
	{
		orderno=rs.getInt("number");
		amt=rs.getInt("amount");
		items=rs.getInt("items");
		out.println("<li><b>Order No. "+orderno+"</b><br><ul>"+"<li>Amount: "+amt+"</li>"+"<li>Number of Items: "+items+"</li>"+"</ul></li><br><br>");
	}
	out.println("</ul><br><br><br>");
}
else
{
	response.sendRedirect("login.jsp");
}
%>
</ul>
</div>
</div>
<%@ include file="includes/layouts/footer.jsp" %>
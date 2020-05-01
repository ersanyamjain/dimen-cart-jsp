
<%@ include file="includes/dbconnection.jsp" %>
<%@ include file="includes/layouts/header.jsp" %>
<div class="main">
<div class="products">
<h1 style="color:#1D62B6">Recent Orders:</h1>
<ul>
<%
int orderno,uid,amt,items;
String sql;
Statement s=c.createStatement();
if(session.getAttribute("aid")!=null)
{
	sql="select * from orders order by number desc";
	out.println("<table border='1' cellpadding='5'><th>Order No.</th><th>User ID</th><th>Amount</th><th>Number of Items</th>");
	ResultSet rs=s.executeQuery(sql);
	while(rs.next())
	{
		orderno=rs.getInt("number");
		amt=rs.getInt("amount");
		uid=rs.getInt("userid");
		items=rs.getInt("items");
		out.println("");
		out.println("<tr align='center'><td>"+orderno+"</td>"+"<td>"+uid+"</td>"+"<td>"+amt+"</td>"+"<td>"+items+"</td>"+"</tr>");
	}
	out.println("</table><br><br><br>");
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
<%@ include file="includes/dbconnection.jsp" %>
<%@ include file="includes/layouts/header.jsp" %>
<div class="main">
<div class="products">
<h1 style="color:#1D62B6">All the Coupons:</h1>
<%
if(session.getAttribute("success")!=null)
{
out.println("<div class='loginerrors'>"+session.getAttribute("success")+"</div><br>");
session.removeAttribute("success");
}
%>

<%
out.println("<a href='addcoupon.jsp'>Add New Coupon</a><br><br>");
int valid;
String ccode,cvalue,sql;
Statement s=c.createStatement();
if(session.getAttribute("aid")!=null)
{
	sql="select * from coupon order by ccode";
	out.println("<table border='1' cellpadding='10'><th>Coupon Code</th><th>Coupon Value</th><th>Valid</th><th>Operations</th>");
	ResultSet rs=s.executeQuery(sql);
	while(rs.next())
	{
		ccode=rs.getString("ccode");
		cvalue=rs.getString("cvalue");
		valid=rs.getInt("valid");
		out.println("<tr align='center'><td>"+ccode+"</td>"+"<td>"+cvalue+"</td>"+"<td>"+valid+"</td>"+"<td><a href='editcoupon.jsp?ccode="+ccode+"'>Edit</a>&nbsp;&nbsp;<a href='delcoupon.jsp?ccode="+ccode+"' onclick='confirm()'>Delete</a></td>"+"</tr>");
	}
	out.println("</table><br>");
}
else
{
	response.sendRedirect("adminlogin.jsp");
}
%>


</div>
</div>
<%@ include file="includes/layouts/footer.jsp" %>
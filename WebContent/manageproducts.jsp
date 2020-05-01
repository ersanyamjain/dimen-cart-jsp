<%@ include file="includes/dbconnection.jsp" %>
<%@ include file="includes/layouts/header.jsp" %>
<div class="main">
<div class="products">
<h1 style="color:#1D62B6">All the Product Categories:</h1>
<%
if(session.getAttribute("success")!=null)
{
out.println("<div class='loginerrors'>"+session.getAttribute("success")+"</div><br>");
session.removeAttribute("success");
}
%>

<%
out.println("<a href='addproductcat.jsp'>Add New Product Category</a><br><br>");
int catid,visible;
String cname,cdesc,sql;
Statement s=c.createStatement();
if(session.getAttribute("aid")!=null)
{
	sql="select * from productcat order by name";
	out.println("<table border='1' cellpadding='10'><th>Category ID</th><th>Name</th><th>Description</th><th>Visible</th><th>Operations</th>");
	ResultSet rs=s.executeQuery(sql);
	while(rs.next())
	{
		catid=rs.getInt("id");
		cname=rs.getString("name");
		cdesc=rs.getString("description");
		visible=rs.getInt("visible");
		out.println("<tr align='center'><td>"+catid+"</td>"+"<td>"+cname+"</td>"+"<td>"+cdesc+"</td>"+"<td>"+visible+"</td>"+"<td><a href='editproductcat.jsp?productcatid="+catid+"'>Edit</a>&nbsp;&nbsp;<a href='delproductcat.jsp?productcatid="+catid+"' onclick='confirm()'>Delete</a></td>"+"</tr>");
	}
	out.println("</table><br>");
}
else
{
	response.sendRedirect("adminlogin.jsp");
}
%>
<h1 style="color:#1D62B6">All the Products:</h1>

<%
out.println("<a href='addproduct.jsp'>Add New Product</a><br><br>");
int pid,stock,price,delcharges,cid,pvisible;
String pname,pdesc,specs;
s=c.createStatement();
if(session.getAttribute("aid")!=null)
{
	sql="select * from products order by name";
	out.println("<table border='1' cellpadding='10'><th>Product ID</th><th>Name</th><th>Description</th><th>Specifications</th><th>Stock</th><th>Price</th><th>Delivery Charges</th><th>Category ID</th><th>Visible</th><th>Operations</th>");
	ResultSet rs=s.executeQuery(sql);
	while(rs.next())
	{
		pid=rs.getInt("id");
		pname=rs.getString("name");
		pdesc=rs.getString("description");
		specs=rs.getString("specs");
		stock=rs.getInt("stock");
		price=rs.getInt("price");
		delcharges=rs.getInt("delcharges");
		cid=rs.getInt("catid");
		visible=rs.getInt("visible");
		out.println("<tr align='center'><td>"+pid+"</td><td>"+pname+"</td><td>"+pdesc+"</td><td>"+specs+"</td><td>"+stock+"</td><td>"+price+"</td><td>"+delcharges+"</td><td>"+cid+"</td><td>"+visible+"</td>"+"<td><a href='editproduct.jsp?productid="+pid+"'>Edit</a>&nbsp;&nbsp;<a href='delproduct.jsp?productid="+pid+"' onclick='confirm()'>Delete</a></td>"+"</tr>");
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
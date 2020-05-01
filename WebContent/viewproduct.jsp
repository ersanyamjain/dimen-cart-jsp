
<%@ include file="includes/dbconnection.jsp" %>
<%@ include file="includes/layouts/header.jsp" %>
<div class="main">
<div class="products">
<h1 style="color:#1D62B6">Product Description</h1>
<%
int id,stock,delcharges;
int price;
//boolean visible;
//Blob image;
String name,description,specs,sql="";
Statement s=c.createStatement();
if(request.getParameter("productid")!=null)
{
	String pid=request.getParameter("productid");
	sql="select * from products where id="+pid+" and visible=1";
	ResultSet rs=s.executeQuery(sql);
	if(rs.next())
	{
		id=rs.getInt("id");
		name=rs.getString("name");
		description=rs.getString("description");
		specs=rs.getString("specs");
		stock=rs.getInt("stock");
		price=rs.getInt("price");
		delcharges=rs.getInt("delcharges");
		//image=rs.getBlob("image");
		//visible=rs.getBoolean("visible");
		out.println("<div class='productimg'><a href='viewproduct.jsp?productid="+id+"'><img src='images/"+id+".png'></a></div><h2>"+name+"</h2><ul>"+"<li>Description: "+description+"</li>"+"<li>Specifications: "+specs+"</li>"+"<li>In Stock: "+stock+"</li>"+"<li>Price: Rs."+price+"</li>"+"<li>Delivery Charges: Rs."+delcharges+"</li>"+"<br><a href='addtocart.jsp?productid="+id+"'>Add to Cart</a></ul></li>");
	}
}
else
{
	response.sendRedirect("products.jsp");
}

%>
</div>
</div>
<%@ include file="includes/layouts/footer.jsp" %>

<%@ include file="includes/dbconnection.jsp" %>
<%@ include file="includes/layouts/header.jsp" %>
<div class="main">
<div class="products">
<h1 style="color:#1D62B6">Products</h1>
<ul>
<%
int id,stock,delcharges;
int price;
//boolean visible;
//Blob image;
String name,description,specs,sql;
Statement s=c.createStatement();
if(request.getParameter("category")!=null)
{
	String catid=request.getParameter("category");
	sql="select * from products where catid="+catid+" and visible=1";
}
else
{
	sql="select * from products where visible=1";
}
ResultSet rs=s.executeQuery(sql);
while(rs.next())
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
	
	out.println("<div class='productimg'><a href='viewproduct.jsp?productid="+id+"'><img src='images/"+id+".png'></a></div><li><b><a href='viewproduct.jsp?productid="+id+"' style='font-size:18'>"+name+"</a></b><ul>"+"<li><b>Description: </b>"+description+"</li>"+"<li><b>Specifications: </b>"+specs+"</li>"+"<li><b>In Stock: </b>"+stock+"</li>"+"<li><b>Price: </b>Rs."+price+"</li>"+"<li><b>Delivery Charges: </b>Rs."+delcharges+"</li>"+"<br><b><a href='addtocart.jsp?productid="+id+"'>Add to Cart</a></b></ul></li><br><br>");
}

%>
</ul>
</div>
</div>
<%@ include file="includes/layouts/footer.jsp" %>
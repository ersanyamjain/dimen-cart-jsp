
<%@ include file="includes/dbconnection.jsp" %>
<%@ include file="includes/layouts/header.jsp" %>
<div class="main">
<div class="products">
<h1 style="color:#1D62B6">Your Cart Contains Following Products:</h1>
<ul>
<%
int id,stock,delcharges;
int price,totalprice=0;
//boolean visible;
String name,description,specs,sql;
Statement s=c.createStatement();
if(session.getAttribute("itemlist")!=null)
{
	String itemlist[]=(String[])session.getAttribute("itemlist");
	int cart=(Integer)session.getAttribute("cart");
	out.println("<ol>");
	for(int i=0;i<=cart;i++)
	{
		sql="select * from products where id="+itemlist[i];
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
			totalprice=totalprice+price+delcharges;
			out.println("<div class='productimg'><a href='viewproduct.jsp?productid="+id+"'><img src='images/"+id+".png'></a></div><li><b><a href='#'>"+name+"</a></b><br><br><ul>"+"<li>Description: "+description+"</li>"+"<li>Specifications: "+specs+"</li>"+"<li>In Stock: "+stock+"</li>"+"<li>Price: Rs."+price+"</li>"+"<li>Delivery Charges: Rs."+delcharges+"</li>"+"<br><a href='removefromcart.jsp?productid="+id+"'>Remove From Cart</a><br><br></ul></li>");
		}
	}
	session.setAttribute("totalprice",totalprice);
	out.println("</ol><br><br>");
	out.println("<h3>TOTAL AMOUNT: "+totalprice+"</h3><br>");
	out.println("<a href='checkout.jsp' class='checkout'>Checkout</a><br><br>");
}
else
{
	out.println("<br><h2>Your Cart is Empty. Please add some products and get back soon</h2><br><br>");
}


%>
</ul>
</div>
</div>
<%@ include file="includes/layouts/footer.jsp" %>
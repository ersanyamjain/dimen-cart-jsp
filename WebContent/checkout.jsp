
<%@ include file="includes/dbconnection.jsp" %>
<%@ include file="includes/layouts/header.jsp" %>
<div class="main">
<div class="products">
<h1 style="color:#1D62B6">Checkout Panel:</h1>
<%
if(request.getParameter("paid")!=null)
{
	if(session.getAttribute("itemlist")!=null)
	{
		String sql="",productid="",coupon="",discsuccess="";
		int disc=0;
		Statement s=c.createStatement();
		if(request.getParameter("coupon")!=null)
		{
		coupon=request.getParameter("coupon");
		sql="select * from coupon where ccode='"+coupon+"' and valid=1";
		ResultSet rs=s.executeQuery(sql);
		if(rs.next())
		{
		disc=rs.getInt("cvalue");
		discsuccess="Coupon was applied successfully. Your bill is reduced :-)";
		}
		else
			discsuccess="Error! Coupon was not valid. Discount could not be offered :-(";
		}
		int cart=(Integer)session.getAttribute("cart");
		String[] itemlist=(String[])session.getAttribute("itemlist");
		
		for(int i=0;i<cart;i++)
		{
			productid=itemlist[i];
			sql="update products set stock=stock-1 where id="+productid;
			int status=s.executeUpdate(sql);
		}
		int totalamt=(Integer)session.getAttribute("totalprice");
		totalamt=totalamt-((totalamt*disc)/100);
		int id=(Integer)session.getAttribute("id");
		int items=(Integer)session.getAttribute("cart");
		sql="insert into orders(userid,amount,items) values("+id+","+totalamt+","+items+")";
		int status=s.executeUpdate(sql);
		sql="select * from orders";
		ResultSet rs=s.executeQuery(sql);
		rs.last();
		int orderno=rs.getInt("number");
		session.setAttribute("cart",new Integer(0));
		session.removeAttribute("itemlist");
		session.removeAttribute("totalprice");
		out.println("<br><center><h3>Thank You for the Shopping with Dimen Cart.</h3><br>Your order has been placed with <b>Order Number: "+orderno+"</b><br><br><b>"+discsuccess+"</b>");
		out.println("<br><br><b>Have a Nice Day :-)</b></center><br><br><br><br><br><br>");
	}
	else
	{
		response.sendRedirect("cart.jsp");
	}
}
%>
<%
if(request.getParameter("paid")==null && session.getAttribute("totalprice")!=null)
{
int totalamt=(Integer)session.getAttribute("totalprice");
out.println("<br><br><center>Your total amount is: <b>Rs."+totalamt+"</b>");
out.println("<br><br><form action='checkout.jsp?paid=true' method='post'>Any Promo Code: <input type='text' name='coupon' maxlength='14' style='font-size:20'><br><br>Payment Type: <select name='paytype'><option>Credit Card</option><option>Debit Card</option><option>Net Banking</option><option>E-Wallets</option></select><br><br><input type='submit' class='regsubbtn' value='Pay Now'></form><a href='cart.jsp'>Cancel</a></center><br><br>");
//out.println("<br><br><a href='checkout.jsp?paid=true' class='checkout'>Pay Now</a><br><br><br><br>");
}
%>
</div>
</div>
<%@ include file="includes/layouts/footer.jsp" %>
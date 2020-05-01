<%!String itemlist[]; %>
<%
if(session.getAttribute("username")!=null)
{
	if(session.getAttribute("cart")==null)
		session.setAttribute("cart",new Integer(0));
	
	int cart=(Integer)session.getAttribute("cart");
	cart+=1;
	session.setAttribute("cart",cart);
	if(session.getAttribute("itemlist")==null)
	{
		itemlist=new String[100];
		itemlist[0]=(String)request.getParameter("productid");
	}
	else
		itemlist[cart-1]=(String)request.getParameter("productid");
	session.setAttribute("itemlist",itemlist);
	response.sendRedirect("products.jsp");
}
else
{
	session.setAttribute("forward","addtocart");
	session.setAttribute("productid",(String)request.getParameter("productid"));
	response.sendRedirect("login.jsp?forward=addtocart&product="+(String)request.getParameter("productid"));
}
%>
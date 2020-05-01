<%@page import="java.util.*" %>
<%!String itemlist[],remitem; %>
<%
if(session.getAttribute("itemlist")!=null)
{
	int cart=(Integer)session.getAttribute("cart");
	itemlist=(String[])session.getAttribute("itemlist");
	remitem=(String)request.getParameter("productid");
	ArrayList<String> cartlist=new ArrayList<String>();
	for(int j=0;j<cart;j++)
	{
		cartlist.add(itemlist[j]);
	}
	cartlist.remove(remitem);
	itemlist=null;
	for(int j=0;j<cartlist.size();j++)
	{
		itemlist[j]=cartlist.get(j);
	}
	session.setAttribute("cart",cart-1);
	session.setAttribute("itemlist",itemlist);
	response.sendRedirect("cart.jsp");
}
else
{
	response.sendRedirect("products.jsp");
}
%>
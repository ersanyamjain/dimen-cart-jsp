<%@ include file="includes/dbconnection.jsp" %>
<%@ include file="includes/validationfunc.jsp" %>
<%
if(request.getParameter("productid")!=null )
{
	Statement s=c.createStatement();
	String id="",sql="";
	id=request.getParameter("productid");
	sql="delete from products where id="+id;
	int status=s.executeUpdate(sql);
	if(status!=0)
	{
		errors="<b>Product has been deleted successfully</b>";
		session.setAttribute("success",errors);
		response.sendRedirect("manageproducts.jsp");
	}
	else
	{
		errors="Something went wrong with Database. Please try again later.";
		session.setAttribute("success",errors);
		response.sendRedirect("manageproducts.jsp");
	}
}
else
{
	response.sendRedirect("manageproducts.jsp");
}
%>
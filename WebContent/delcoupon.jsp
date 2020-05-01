<%@ include file="includes/dbconnection.jsp" %>
<%@ include file="includes/validationfunc.jsp" %>
<%
if(request.getParameter("ccode")!=null )
{
	Statement s=c.createStatement();
	String ccode="",sql="";
	ccode=request.getParameter("ccode");
	sql="delete from coupon where ccode='"+ccode+"'";
	int status=s.executeUpdate(sql);
	if(status!=0)
	{
		errors="<b>Coupon has been deleted successfully</b>";
		session.setAttribute("success",errors);
		response.sendRedirect("managecoupons.jsp");
	}
	else
	{
		errors="Something went wrong with Database. Please try again later.";
		session.setAttribute("success",errors);
		response.sendRedirect("managecoupons.jsp");
	}
}
else
{
	response.sendRedirect("managecoupons.jsp");
}
%>
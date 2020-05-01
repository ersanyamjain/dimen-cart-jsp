<%@ include file="includes/dbconnection.jsp" %>
<%@ include file="includes/validationfunc.jsp" %>
<%
if(request.getParameter("adminid")!=null )
{
	Statement s=c.createStatement();
	String aid="",sql="";
	aid=request.getParameter("aid");
	sql="delete from admins where id="+aid;
	int status=s.executeUpdate(sql);
	if(status!=0)
	{
		errors="<b>Admin has been deleted successfully</b>";
		session.setAttribute("success",errors);
		response.sendRedirect("manageadmins.jsp");
	}
	else
	{
		errors="Something went wrong with Database. Please try again later.";
		session.setAttribute("errors",errors);
		response.sendRedirect("manageadmins.jsp");
	}
}
else
{
	response.sendRedirect("manageadmins.jsp");
}
%>
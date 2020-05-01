<%
if(((String)session.getAttribute("utype")).equals("user"))
{
session.removeAttribute("username");
session.removeAttribute("name");
session.removeAttribute("utype");
session.removeAttribute("id");
session.removeAttribute("errors");
session.removeAttribute("itemlist");
session.removeAttribute("cart");
response.sendRedirect("login.jsp");
}
else if(((String)session.getAttribute("utype")).equals("admin"))
{
session.removeAttribute("ausername");
session.removeAttribute("utype");
session.removeAttribute("aid");
session.removeAttribute("errors");
response.sendRedirect("adminlogin.jsp");
}
	
%>
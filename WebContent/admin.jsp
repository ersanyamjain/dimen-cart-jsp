<%@page import="javax.servlet.http.Cookie" %>
<%@ include file="includes/dbconnection.jsp" %>
<%@ include file="includes/validationfunc.jsp" %>
<%@ include file="includes/layouts/header.jsp" %>
<div class="main">
<%
if((session.getAttribute("ausername")==null))
{
	if(request.getParameter("username")!=null)
	{
		if(request.getParameter("arememberme")!=null)
		{
			Cookie c[]=request.getCookies();
			if(c==null)
			{
				Cookie c1=new Cookie("ausern",request.getParameter("username"));
				Cookie c2=new Cookie("apwd",request.getParameter("password"));
				response.addCookie(c1);
				response.addCookie(c2);
				c1.setMaxAge(30*60*12000);
				c2.setMaxAge(30*60*12000);
			}
		}
		Statement s=c.createStatement();
		String utype="admin",ausername="",apass="",sql="";
		int aid=0;
		ausername=request.getParameter("username");
		apass=request.getParameter("password");
		if(loginFieldValidation(ausername,apass))
		{
			sql="select * from admins where username='"+ausername+"' and password='"+apass+"'";
			
			ResultSet rs=s.executeQuery(sql);
			if(rs.next())
			{
				aid=rs.getInt("id");
				session.setAttribute("utype","admin");
				session.setAttribute("ausername",ausername);
				session.setAttribute("aid",aid);
				response.sendRedirect("admin.jsp");
				/* out.println("<br><h2>Welcome, &nbsp;"+username+"</h2>");
				out.println("<br><a href='logout.jsp'>Logout</a>"); */
			}
			else
			{
				errors="<b>Error! Admin Doesn't Exist. Check the login details.</b>";
				session.setAttribute("errors",errors);
				response.sendRedirect("adminlogin.jsp");
			}
		}
		else
		{
			session.setAttribute("errors",errors);
			response.sendRedirect("adminlogin.jsp");
		}
	}
	else
	{
		session.removeAttribute("errors");
		response.sendRedirect("adminlogin.jsp");
	}
}
else
{
	if(session.getAttribute("updsuc")!=null)
	{
		out.println("<br><br><div class='loginerrors'>"+session.getAttribute("updsuc")+"</div>");
		session.removeAttribute("updsuc");
	}
	out.println("<br><h2>Welcome Admin, &nbsp;"+session.getAttribute("ausername")+"</h2>");
	out.println("<br><a href='logout.jsp'>Logout</a>");
}
%>
</div>
<br><br><br>
<%@ include file="includes/layouts/footer.jsp" %>
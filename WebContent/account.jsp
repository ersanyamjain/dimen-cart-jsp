<%@page import="javax.servlet.http.Cookie" %>
<%@ include file="includes/dbconnection.jsp" %>
<%@ include file="includes/validationfunc.jsp" %>
<%@ include file="includes/layouts/header.jsp" %>
<div class="main">
<%
if((session.getAttribute("username")==null))
{
	if(request.getParameter("username")!=null)
	{
		if(request.getParameter("rememberme")!=null)
		{
			Cookie c[]=request.getCookies();
			if(c==null)
			{
				Cookie c1=new Cookie("usern",request.getParameter("username"));
				Cookie c2=new Cookie("pwd",request.getParameter("password"));
				response.addCookie(c1);
				response.addCookie(c2);
				c1.setMaxAge(30*60*12000);
				c2.setMaxAge(30*60*12000);
			}
		}
		Statement s=c.createStatement();
		String username="",pass="",sql="",name="";
		int id=0;
		username=request.getParameter("username");
		pass=request.getParameter("password");
		if(loginFieldValidation(username,pass))
		{
			sql="select * from users where username='"+username+"' and hashed_password='"+pass+"'";
			
			ResultSet rs=s.executeQuery(sql);
			if(rs.next())
			{
				id=rs.getInt("id");
				name=rs.getString("name");
				session.setAttribute("name",name);
				session.setAttribute("utype","user");
				session.setAttribute("username",username);
				session.setAttribute("id",id);
				session.setAttribute("cart",new Integer(0));
				response.sendRedirect("account.jsp");
				/* out.println("<br><h2>Welcome, &nbsp;"+name+"</h2>");
				out.println("<br><a href='logout.jsp'>Logout</a>"); */
			}
			else
			{
				errors="<b>Error! User Doesn't Exist. Check the login details.</b>";
				session.setAttribute("errors",errors);
				response.sendRedirect("login.jsp");
			}
		}
		else
		{
			session.setAttribute("errors",errors);
			response.sendRedirect("login.jsp");
		}
	 }
	else
	{
		session.removeAttribute("errors");
		response.sendRedirect("login.jsp");
	} 
}
else
{
	if(session.getAttribute("updsuc")!=null)
	{
		out.println("<br><br><div class='loginerrors'>"+session.getAttribute("updsuc")+"</div>");
		session.removeAttribute("updsuc");
	}
	if(session.getAttribute("forward")!=null)
	{
		String forward=(String)session.getAttribute("forward");
		String productid=(String)session.getAttribute("productid");
		session.removeAttribute("forward");
		session.removeAttribute("productid");
		response.sendRedirect(forward+".jsp?productid="+productid);
	}
	out.println("<br><h2>Welcome, &nbsp;"+session.getAttribute("name")+"</h2>");
	out.println("<br><a href='logout.jsp'>Logout</a>");
}
%>
</div>
<br><br><br>
<%@ include file="includes/layouts/footer.jsp" %>
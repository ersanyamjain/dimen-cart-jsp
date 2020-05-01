<%@ include file="includes/dbconnection.jsp" %>
<%@ include file="includes/validationfunc.jsp" %>
<%@ include file="includes/layouts/header.jsp" %>
<br>
<div class="main">
<div class="register">
<h2>
Please edit the form for Updation:</h2>
<%!String username="",password="",rpassword="",aid=""; %>
<%
if(request.getParameter("update")!=null )
{
	Statement s=c.createStatement();
	//String username="",name="",email="",password="",id="",rpassword="",hashed_password="",phone="",address="",sex="",dob="",sql="";
	String username="",password="",aid="",rpassword="",hashed_password="",sql="";
	username=request.getParameter("username");
	aid=request.getParameter("aid");
	/* name=request.getParameter("name");
	email=request.getParameter("email");
	phone=request.getParameter("phone");
	address=request.getParameter("address");
	sex=request.getParameter("sex");
	dob=request.getParameter("dob");
	 */
	password=request.getParameter("password");
	rpassword=request.getParameter("rpassword");
	hashed_password=password;
	
	HashMap<String,String> hm=new HashMap<>();
	hm.put("Username",username);
	hm.put("Password",password);
	hm.put("ReEnterPassword",rpassword);
	/* hm.put("Name",name);
	hm.put("Email",email);
	hm.put("Phone",phone);
	hm.put("Address",address);
	hm.put("Sex",sex);
	hm.put("DateOfBirth",dob); */
	
	if(regFieldValidation(hm))
	{
		sql="update admins set username='"+username+"',password='"+hashed_password+"' where id="+aid;
		int status=s.executeUpdate(sql);
		if(status!=0)
		{
			errors="<b>Details have been updated successfully</b>";
			session.setAttribute("updsuc",errors);
			response.sendRedirect("admin.jsp");
		}
		else
		{
			errors="Something went wrong with Database. Please try again later.";
			session.setAttribute("errors",errors);
			response.sendRedirect("editadmin.jsp?adminid="+aid);
		}
	}
	else
	{
		session.setAttribute("errors",errors);
		response.sendRedirect("editadmin.jsp?adminid="+aid);
	}
}
%>
<% 
if(request.getParameter("adminid")!=null)
{
	//String username="",name="",email="",password="",rpassword="",hashed_password="",phone="",address="",sex="",dob="",sql="";
	String hashed_password="",sql="";
	if(session.getAttribute("errors")!=null)
	{
		out.println("<div class='regerrors'>"+session.getAttribute("errors")+"</div>");
		session.removeAttribute("errors");
	}
	aid=request.getParameter("adminid").toString();
	if(session.getAttribute("utype").equals("admin"))
	{
		sql="select * from admins where id="+aid;
		Statement s=c.createStatement();
		ResultSet rs=s.executeQuery(sql);
		if(rs.next())
		{
			username=rs.getString("username");
			password=rs.getString("password");
			rpassword=password;
			hashed_password=password;
			/* name=rs.getString("name");
			email=rs.getString("email");
			phone=rs.getString("phone");
			address=rs.getString("address");
			sex=rs.getString("sex");
			dob=rs.getString("dob"); */
		}
		else
			response.sendRedirect("adminlogin.jsp");
	}
	else
		response.sendRedirect("adminlogin.jsp");
}
%>
<pre>
<form action="editadmin.jsp" method="post" class="editform">
Username:					<input type="text" name="username" value="<%=username %>"><br>
Password:					<input type="password" name="password" value="<%=password %>"><br>
Re-Enter Password:				<input type="password" name="rpassword" value="<%=rpassword %>"><br>
<input type="hidden" value="<%=aid %>" name="aid">
<br>
<input type="submit" value="Update" class="regsubbtn" name="update"><br>
<div  class="signup"><a href="manageadmins.jsp">Cancel</a>
</div>
</form>
</pre>
<br>
</div>
</div>
<%@ include file="includes/layouts/footer.jsp" %>
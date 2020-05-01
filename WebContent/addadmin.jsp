<%@ include file="includes/dbconnection.jsp" %>
<%@ include file="includes/validationfunc.jsp" %>
<%@ include file="includes/layouts/header.jsp" %>
<br>
<div class="main">
<div class="register">
<h2>
Please fill the Registration Form:
</h2>
<pre>

<%!String username="",password="",rpassword="",aid=""; %>
<%
if(request.getParameter("addad")!=null )
{
	Statement s=c.createStatement();
	//String username="",name="",email="",password="",id="",rpassword="",hashed_password="",phone="",address="",sex="",dob="",sql="";
	String username="",password="",aid="",rpassword="",hashed_password="",sql="";
	username=request.getParameter("username");
	/* aid=request.getParameter("aid");
	name=request.getParameter("name");
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
		sql="insert into admins(username,password) values('"+username+"','"+hashed_password+"')";
		int status=s.executeUpdate(sql);
		if(status!=0)
		{
			errors="<b>Thank You. New Admin has been added successfully<b>";
			session.setAttribute("updsuc",errors);
			response.sendRedirect("admin.jsp");
		}
		else
		{
			errors="Something went wrong with Database. Please try again later.";
			session.setAttribute("errors",errors);
			response.sendRedirect("admin.jsp");
		}
	}
	else
	{
		session.setAttribute("errors",errors);
		response.sendRedirect("admin.jsp");
	}
}
%>

<form action="addadmin.jsp" method="post" name="addadmin" class="editform">
Username:					<input type="text" name="username" required><br>
Password:					<input type="password" name="password" required"><br>
Re-Enter Password:				<input type="password" name="rpassword" required><br>
<br>
	<input type="submit" value="Add" class="regsubbtn" name="addad">			<a href="admin.jsp">Cancel</a><br>
</form>
</pre>
<br>
</div>
</div>
<%@ include file="includes/layouts/footer.jsp" %>
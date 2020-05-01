<%@ include file="includes/dbconnection.jsp" %>
<%@ include file="includes/layouts/header.jsp" %>
<br>
<div class="main">
<div class="register">
<h2>
Please edit the form for Updation:
</h2>
<pre>
<% 
String username="",name="",email="",password="",rpassword="",hashed_password="",phone="",address="",sex="",dob="",sql="";
String subsc="true";
if(session.getAttribute("errors")!=null)
{
	out.println("<div class='regerrors'>"+session.getAttribute("errors")+"</div>");
	session.removeAttribute("errors");
}
%>
<%
String id=session.getAttribute("id").toString();
if((id!=null)&& session.getAttribute("utype").equals("user"))
{
	
	sql="select * from users where id="+id;
	Statement s=c.createStatement();
	ResultSet rs=s.executeQuery(sql);
	if(rs.next())
	{
		username=rs.getString("username");
		name=rs.getString("name");
		email=rs.getString("email");
		password=rs.getString("hashed_password");
		rpassword=password;
		hashed_password=password;
		phone=rs.getString("phone");
		address=rs.getString("address");
		sex=rs.getString("sex");
		dob=rs.getString("dob");
		subsc=rs.getInt("subsc")==1?"true":"false";
	}
	else
		response.sendRedirect("login.jsp");
}
else
	response.sendRedirect("login.jsp");
%>
<form action="updateuser.jsp" method="post" name="update" class="editform">
Username:					<input type="text" name="username" value="<%=username %>"><br>
Name:						<input type="text" name="name" value="<%=name %>"><br>
Email:						<input type="text" name="email" value="<%=email%>"><br>
Password:					<input type="password" name="password" value="<%=password %>"><br>
Re-Enter Password:				<input type="password" name="rpassword" value="<%=rpassword %>"><br>
Phone:						<input type="text" name="phone" maxlength="11" value="<%=phone %>"><br>
Address:					<textarea name="address" rows=4 cols="30"><%=address %></textarea><br>
Sex:						<input type="radio" value="Male" name="sex" <% if(sex.equals("Male")) {out.println(" checked ");} %> >Male  <input type="radio" value="Female" name="sex" <% if(sex.equals("Female")) {out.println(" checked ");} %> >Female<br>
Date of Birth:					<input type="date" name="dob" value="<%=dob %>"><br>

<br><input type="checkbox" name="subsc" value="true" <% if(subsc.equals("true")) {out.println(" checked ");} %> > I would like to subscribe for newsletter.
<input type="hidden" value="<%=id %>" name="id">
<br>
	<input type="submit" value="Update" class="regsubbtn">			<a href="account.jsp">Cancel</a><br>
</form>
</pre>
<br>
</div>
</div>
<%@ include file="includes/layouts/footer.jsp" %>
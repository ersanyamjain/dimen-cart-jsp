
<%@ include file="includes/dbconnection.jsp" %>
<%@ include file="includes/layouts/header.jsp" %>
<div class="main">
<div class="login">
<h1 style="color:#1D62B6">Dimen Cart Support Page</h1>
<p>
You can drop an email to admin@dimencart.com or ersanyamjain@gmail.com<br>
<b>Customer Support Helpline Number:</b> 9802066127, 9255430700
</p>
<% 
if(request.getParameter("query")!=null)
{
	Statement s=c.createStatement();
	String sql="",id,name="",query="",email="",phone="";
	name=request.getParameter("name");
	email=request.getParameter("email");
	phone=request.getParameter("phone");
	query=request.getParameter("query");
	
	sql="insert into queries(name,email,phone,query) values('"+name+"','"+email+"','"+phone+"','"+query+"')";
	int status=s.executeUpdate(sql);
	sql="select * from queries";
	ResultSet rs=s.executeQuery(sql);
	rs.last();
	int qno=rs.getInt("id");
	if(status!=0)
	{
		out.println("<div class='loginerrors'>Your query has been submitted with <b>Reference Number: "+qno+"</b>. We will revert back shortly.</div>");
	}
	else
	{
		out.println("<div class='loginerrors'>Something went wrong with Database. Please try again later.</div>");
	}
}

%>
<h2>Please fill the following form: </h2>
<pre>
<form name="support" action="support.jsp" method="post">
Name:			<input type="text" name="name" required/><br>
Email Address:		<input type="email" name="email" required/><br>
Phone:			<input type="text" name="phone" maxlength="11"/><br>
Query:			<textarea name="query" rows="4" cols="30">Enter the query here</textarea><br><br>
	<input type="submit" value="Submit" class="loginbtn"/>			<input type="reset" class="loginbtn"/>
</form>
</pre>
</div>

</div>
<%@ include file="includes/layouts/footer.jsp" %>
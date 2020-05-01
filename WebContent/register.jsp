<%@ include file="includes/dbconnection.jsp" %>
<%@ include file="includes/layouts/header.jsp" %>
<br>
<div class="main">
<div class="register">
<h2>
Please fill the form for registration:
</h2>
<pre>
<% 
if(session.getAttribute("errors")!=null)
{
	out.println("<div class='regerrors'>"+session.getAttribute("errors")+"</div>");
	session.removeAttribute("errors");
}
%>
<form action="adduser.jsp" method="post" name="register" class="signupform">
Username:					<input type="text" name="username" required><br>
Name:						<input type="text" name="name" required><br>
Email:						<input type="email" name="email" required><br>
Password:					<input type="password" name="password" required><br>
Re-Enter Password:				<input type="password" name="rpassword" required><br>
Phone:						<input type="text" name="phone" maxlength="11" required><br>
Address:					<textarea name="address" rows=4 cols="30" required></textarea><br>
Sex:						<input type="radio" value="Male" name="sex" required>Male  <input type="radio" value="Female" name="sex">Female<br>
Date of Birth:					<input type="date" name="dob" required><br>

<br><input type="checkbox" name="subsc" checked value="true"> I would like to subscribe for newsletter.

<br>
	<input type="submit" value="Register" class="regsubbtn">			<input type="reset" value="Reset" class="regcanbtn"><br>
</form>
</pre>
<br>
</div>
</div>
<%@ include file="includes/layouts/footer.jsp" %>
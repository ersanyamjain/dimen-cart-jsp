<%@page import="java.util.*" %>
<%@ include file="includes/dbconnection.jsp" %>
<%@ include file="includes/validationfunc.jsp" %>
<%@ include file="includes/layouts/header.jsp" %>
<br>
<div class="main">
<%
Statement s=c.createStatement();
String username="",name="",email="",password="",id="",rpassword="",hashed_password="",phone="",address="",sex="",dob="",sql="";
int subsc=0;
username=request.getParameter("username");
name=request.getParameter("name");
email=request.getParameter("email");
password=request.getParameter("password");
rpassword=request.getParameter("rpassword");
hashed_password=password;
phone=request.getParameter("phone");
address=request.getParameter("address");
sex=request.getParameter("sex");
dob=request.getParameter("dob");
subsc=request.getParameter("subsc")==null?0:1;
id=request.getParameter("id");

HashMap<String,String> hm=new HashMap<>();
hm.put("Username",username);
hm.put("Name",name);
hm.put("Email",email);
hm.put("Password",password);
hm.put("ReEnterPassword",rpassword);
hm.put("Phone",phone);
hm.put("Address",address);
hm.put("Sex",sex);
hm.put("DateOfBirth",dob);

if(regFieldValidation(hm))
{
	sql="update users set username='"+username+"',name='"+name+"',email='"+email+"',hashed_password='"+hashed_password+"',phone='"+phone+"',address='"+address+"',sex='"+sex+"',dob='"+dob+"',subsc="+subsc+" where id="+id;
	int status=s.executeUpdate(sql);
	if(status!=0)
	{
		errors="<b>Thank You. Your details have been updated successfully<b>";
		session.setAttribute("updsuc",errors);
		response.sendRedirect("account.jsp");
	}
	else
	{
		errors="Something went wrong with Database. Please try again later.";
		session.setAttribute("errors",errors);
		response.sendRedirect("edituserprofile.jsp");
	}
}
else
{
	session.setAttribute("errors",errors);
	response.sendRedirect("edituserprofile.jsp");
}
%>
</div>
<%@ include file="includes/layouts/footer.jsp" %>
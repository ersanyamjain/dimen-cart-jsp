<%@page import="java.util.*" %>
<%@ include file="includes/dbconnection.jsp" %>
<%@ include file="includes/validationfunc.jsp" %>
<%@ include file="includes/layouts/header.jsp" %>
<br>
<div class="main">
<%
Statement s=c.createStatement();
String username="",name="",email="",password="",rpassword="",hashed_password="",phone="",address="",sex="",dob="",sql="";
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
	sql="insert into users(username,name,email,hashed_password,phone,address,sex,dob,subsc) values('"+username+"','"+name+"','"+email+"','"+hashed_password+"','"+phone+"','"+address+"','"+sex+"','"+dob+"',"+subsc+")";
	int status=s.executeUpdate(sql);
	if(status!=0)
	{
		errors="<b>Thank You. You have been registered successfully<b>";
		session.setAttribute("regsuc",errors);
		response.sendRedirect("login.jsp");
	}
	else
	{
		errors="Something went wrong with Database. Please try again later.";
		session.setAttribute("errors",errors);
		response.sendRedirect("register.jsp");
	}
}
else
{
	session.setAttribute("errors",errors);
	response.sendRedirect("register.jsp");
}
%>
</div>
<%@ include file="includes/layouts/footer.jsp" %>
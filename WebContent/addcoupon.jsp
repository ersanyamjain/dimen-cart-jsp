<%@ include file="includes/dbconnection.jsp" %>
<%@ include file="includes/validationfunc.jsp" %>
<%@ include file="includes/layouts/header.jsp" %>
<br>
<div class="main">
<div class="register">
<h2>
Please fill the details for New Category:
</h2>
<%
if(session.getAttribute("ausername")!=null)
{
	if(request.getParameter("addcpn")!=null )
	{
		Statement s=c.createStatement();
		String ccode="",cvalue="",sql="";
		ccode=request.getParameter("ccode");
		cvalue=request.getParameter("cvalue");
		int valid=request.getParameter("valid")==null?0:1;
		
		HashMap<String,String> hm=new HashMap<>();
		hm.put("CouponCode",ccode);
		hm.put("CouponValue",cvalue);
		
		if(regFieldValidation(hm))
		{
			sql="insert into coupon(ccode,cvalue,valid) values('"+ccode+"','"+cvalue+"',"+valid+")";
			int status=s.executeUpdate(sql);
			if(status!=0)
			{
				errors="<b>New Coupon has been added successfully<b>";
				session.setAttribute("success",errors);
				response.sendRedirect("managecoupons.jsp");
			}
			else
			{
				errors="Something went wrong with Database. Please try again later.";
				session.setAttribute("success",errors);
				response.sendRedirect("managecoupons.jsp");
			}
		}
		else
		{
			session.setAttribute("errors",errors);
			response.sendRedirect("addcoupon.jsp");
		}
	}
}
else
{
	response.sendRedirect("adminlogin.jsp");
}
%>


<% 
if(session.getAttribute("errors")!=null)
{
	out.println("<div class='regerrors'>"+session.getAttribute("errors")+"</div>");
	session.removeAttribute("errors");
}
%>
<pre>
<form action="addcoupon.jsp" method="post" class="signupform">
Coupon Code:			<input type="text" name="ccode"><br>
Coupon Value:			<input type="text" name="cvalue"><br>
Valid: <input type="checkbox" name="valid" checked value="true">
<br>
<input type="submit" value="Add" class="regsubbtn" name="addcpn">			<input type="reset" value="Reset" class="regcanbtn"><br>
</form>
</pre>
<br>
</div>
</div>
<%@ include file="includes/layouts/footer.jsp" %>
<%@ include file="includes/dbconnection.jsp" %>
<%@ include file="includes/validationfunc.jsp" %>
<%@ include file="includes/layouts/header.jsp" %>
<br>
<div class="main">
<div class="register">
<h2>
Please fill the details for New Coupon:
</h2>
<%
String ccode="",cvalue="",sql="";
int valid=0;
Statement s=c.createStatement();
if(session.getAttribute("ausername")!=null)
{
	if(request.getParameter("ccode")!=null)
	{
		ccode=request.getParameter("ccode");
		sql="select * from coupon where ccode='"+ccode+"'";
		ResultSet rs=s.executeQuery(sql);
		if(rs.next())
		{
		ccode=rs.getString("ccode");
		cvalue=rs.getString("cvalue");
		valid=rs.getInt("valid");
		}
	}
	if(request.getParameter("ccode")==null && request.getParameter("updtcpn")!=null)
	{
		ccode=request.getParameter("ccodei");
		String ccode1=request.getParameter("ccodep");
		cvalue=request.getParameter("cvalue");
		valid=request.getParameter("valid")!=null?1:0;
		
		HashMap<String,String> hm=new HashMap<>();
		hm.put("CouponCode",ccode);
		hm.put("CouponValue",cvalue);
		
		if(regFieldValidation(hm))
		{
			sql="update coupon set ccode='"+ccode+"',cvalue='"+cvalue+"',valid="+valid+" where ccode='"+ccode1+"'";
			int status=s.executeUpdate(sql);
			if(status!=0)
			{
				errors="<b>Coupon has been updated successfully</b>";
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
			response.sendRedirect("editcoupon.jsp?ccode="+ccode);
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
<form action="editcoupon.jsp" method="post" class="signupform">
Coupon Code:			<input type="text" name="ccodei" value="<%=ccode %>"><br>
Coupon Value:			<input type="text" name="cvalue" value="<%=cvalue %>"><br>
Valid: <input type="checkbox" name="valid" value="true" <% if(valid==1) {out.println(" checked ");} %>>
<br>
<input type="hidden" value="<%=ccode %>" name="ccodep">
<input type="submit" value="Update" class="regsubbtn" name="updtcpn"><br>
<div  class="signup"><a href="managecoupons.jsp">Cancel</a>
</div></form>
</pre>
<br>
</div>
</div>
<%@ include file="includes/layouts/footer.jsp" %>
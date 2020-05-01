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
	if(request.getParameter("addcat")!=null )
	{
		Statement s=c.createStatement();
		String cname="",description="",sql="";
		cname=request.getParameter("cname");
		description=request.getParameter("description");
		int visible=request.getParameter("visible")==null?0:1;
		
		HashMap<String,String> hm=new HashMap<>();
		hm.put("CatagoryName",cname);
		hm.put("Description",description);
		
		if(regFieldValidation(hm))
		{
			sql="insert into productcat(name,description,visible) values('"+cname+"','"+description+"',"+visible+")";
			int status=s.executeUpdate(sql);
			if(status!=0)
			{
				errors="<b>New Catagory has been added successfully<b>";
				session.setAttribute("success",errors);
				response.sendRedirect("manageproducts.jsp");
			}
			else
			{
				errors="Something went wrong with Database. Please try again later.";
				session.setAttribute("success",errors);
				response.sendRedirect("manageproducts.jsp");
			}
		}
		else
		{
			session.setAttribute("errors",errors);
			response.sendRedirect("addproductcat.jsp");
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
<form action="addproductcat.jsp" method="post" class="signupform">
Category Name:			<input type="text" name="cname"><br>
Description:			<textarea cols="30" rows="4" name="description"></textarea><br>
Visible: <input type="checkbox" name="visible" checked value="true">
<br>
<input type="submit" value="Add" class="regsubbtn" name="addcat"><br>			<div  class="signup"><a href="manageproducts.jsp">Cancel</a><br></div>
</form>
</pre>
<br>
</div>
</div>
<%@ include file="includes/layouts/footer.jsp" %>
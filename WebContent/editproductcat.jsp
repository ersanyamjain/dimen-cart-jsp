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
String cid="",cname="",desc="",sql="";
int visible=0;
Statement s=c.createStatement();
if(session.getAttribute("ausername")!=null)
{
	if(request.getParameter("productcatid")!=null)
	{
		cid=request.getParameter("productcatid");
		sql="select * from productcat where id="+cid;
		ResultSet rs=s.executeQuery(sql);
		if(rs.next())
		{
		cname=rs.getString("name");
		desc=rs.getString("description");
		visible=rs.getInt("visible");
		}
	}
	if(request.getParameter("productcatid")==null && request.getParameter("updtcat")!=null)
	{
		cid=request.getParameter("id");
		cname=request.getParameter("cname");
		desc=request.getParameter("desc");
		visible=request.getParameter("visible")!=null?1:0;
		
		HashMap<String,String> hm=new HashMap<>();
		hm.put("CatagoryName",cname);
		hm.put("Description",desc);
		
		if(regFieldValidation(hm))
		{
			sql="update productcat set name='"+cname+"',description='"+desc+"',visible="+visible+" where id="+cid;
			int status=s.executeUpdate(sql);
			if(status!=0)
			{
				errors="<b>Category has been updated successfully</b>";
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
			response.sendRedirect("editproductcat.jsp?productcatid="+cid);
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
<form action="editproductcat.jsp" method="post" class="signupform">
Category Name:			<input type="text" name="cname" value="<%=cname %>"><br>
Description:			<textarea rows="4" cols="30" name="desc"><%=desc %></textarea>><br>
Visible: <input type="checkbox" name="visible" value="true" <% if(visible==1) {out.println(" checked ");} %>>
<br>
<input type="hidden" value="<%=cid %>" name="id">
<input type="submit" value="Update" class="regsubbtn" name="updtcat"><br>
<div  class="signup"><a href="manageproducts.jsp">Cancel</a>
</div></form>
</pre>
<br>
</div>
</div>
<%@ include file="includes/layouts/footer.jsp" %>
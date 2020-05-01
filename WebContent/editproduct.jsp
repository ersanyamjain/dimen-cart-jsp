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
String pid="",pname="",pdesc="",specs="",stock="",price="",delcharges="",catid="",sql="",catname="",cid="",prname="";
int visible=0;
Statement s=c.createStatement();
if(session.getAttribute("ausername")!=null)
{
	if(request.getParameter("productid")!=null)
	{
		pid=request.getParameter("productid");
		sql="select * from products where id="+pid;
		ResultSet rs=s.executeQuery(sql);
		if(rs.next())
		{
		prname=rs.getString("name");
		pdesc=rs.getString("description");
		specs=rs.getString("specs");
		stock=rs.getString("stock");
		price=rs.getString("price");
		delcharges=rs.getString("delcharges");
		catid=rs.getString("catid");
		sql="select * from productcat where id="+catid;
		rs=s.executeQuery(sql);
		if(rs.next())
			catname=rs.getString("name");
		visible=rs.getInt("visible");
		}
	}
	if(request.getParameter("productid")==null && request.getParameter("updtpro")!=null)
	{
		pid=request.getParameter("id");
		pname=request.getParameter("pname");
		pdesc=request.getParameter("pdesc");
		specs=request.getParameter("specs");
		stock=request.getParameter("stock");
		price=request.getParameter("price");
		catname=request.getParameter("catname");
		delcharges=request.getParameter("delcharges");
		visible=request.getParameter("visible")==null?0:1;
		sql="select * from productcat where name='"+catname+"' limit 1";
		ResultSet rs=s.executeQuery(sql);
		if(rs.next())
			cid=rs.getString("id");
		HashMap<String,String> hm=new HashMap<>();
		hm.put("ProductName",pname);
		hm.put("Description",pdesc);
		hm.put("Specifications",specs);
		//hm.put("Stock",stock);
		//hm.put("Price",price);
		//hm.put("DeliveryCharges",delcharges);
		
		if(regFieldValidation(hm))
		{
			sql="update products set name='"+pname+"',description='"+pdesc+"',specs='"+specs+"',stock="+stock+",price="+price+",delcharges="+delcharges+",catid="+cid+",visible="+visible+" where id="+pid;
			int status=s.executeUpdate(sql);
			if(status!=0)
			{
				errors="<b>Product has been updated successfully</b>";
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
			response.sendRedirect("editproduct.jsp?productid="+pid);
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
<form action="editproduct.jsp" enctype="multipart/form-data" method="post" class="signupform">
Product Name:			<input type="text" name="pname" value="<%=prname %>" required><br>
Product Category:		<select name='catname'  value="<%=catname %>" required>
<% 
{
	sql="select * from productcat order by name";
	ResultSet rs=s.executeQuery(sql);
	while(rs.next())
	{
		String sel="";
		String cname=rs.getString("name");
		if(cname.equals(catname))
		sel=" selected='selected'";
		else
		sel=" ";
		out.println("<option value='"+cname+"'"+sel+">"+cname+"</option>");
	}
}
%>
</select><br>
Product Image:			<input type="file" name="pimage" accept="image/*" /><br>
Description:			<textarea rows="4" cols="30" name="pdesc"  required><%=pdesc %></textarea><br>
Specifications:			<textarea rows="4" cols="30" name="specs" required><%=specs %></textarea><br>
Stock:				<input type="number" name="stock" value="<%=stock%>" required><br>
Price:				<input type="number" name="price" value="<%=price %>" required><br>
Delivery Charges:		<input type="number" name="delcharges" value="<%=delcharges %>" required><br>
Visible: <input type="checkbox" name="visible" value="true" <% if(visible==1) {out.println(" checked ");} %>>
<input type="hidden" value="<%=pid %>" name="id">
<input type="submit" value="Update" class="regsubbtn" name="updtpro">
<br><div  class="signup"><a href="manageproducts.jsp">Cancel</a>
</div>
</form>
</pre>

<br>
</div>
</div>
<%@ include file="includes/layouts/footer.jsp" %>
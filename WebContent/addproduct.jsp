<%@ include file="includes/dbconnection.jsp" %>
<%@ include file="includes/validationfunc.jsp" %>
<%@ include file="includes/layouts/header.jsp" %>
<br>
<div class="main">
<div class="register">
<h2>
Please fill the details for New Product:
</h2>

<% 
if(session.getAttribute("errors")!=null)
{
	out.println("<div class='regerrors'>"+session.getAttribute("errors")+"</div>");
	session.removeAttribute("errors");
}
%>


<%
if(session.getAttribute("ausername")!=null)
{
	if(request.getParameter("addpro")!=null )
	{
		String catname="",pname="",pdesc="",specs="",sql="",stock,price,delcharges;
		int visible,cid=0;
		catname=request.getParameter("catname");
		Statement s=c.createStatement();
		sql="select * from productcat where name='"+catname+"' limit 1";
		ResultSet rs=s.executeQuery(sql);
		if(rs.next())
			cid=rs.getInt("id");
		

// 		String path=getServletContext().getRealPath("images");
// 		String path="images";
// 		MultipartRequest mpr=new MultipartRequest(request,path,500*1024*1024);
// 		String path1=mpr.getOriginalFileName("pimage");
// 		String path2=path+"/"+path1;
// 		FileInputStream fin=new FileInputStream(path2);


		pname=request.getParameter("pname");
		pdesc=request.getParameter("pdesc");
		specs=request.getParameter("specs");
		stock=request.getParameter("stock");
		price=request.getParameter("price");
		delcharges=request.getParameter("delcharges");
		visible=request.getParameter("visible")==null?0:1;
		
		HashMap<String,String> hm=new HashMap<>();
		hm.put("ProductName",pname);
		hm.put("Description",pdesc);
		hm.put("Specifications",specs);
		//hm.put("Stock",stock);
		//hm.put("Price",price);
		//hm.put("DeliveryCharges",delcharges);
		
		if(regFieldValidation(hm))
		{
			//sql="insert into products(name,image,description,specs,stock,price,delcharges,catid,visible) values('"+pname+"',?,'"+pdesc+"','"+specs+"',"+stock+","+price+","+delcharges+","+cid+","+visible+")";
			//PreparedStatement ps=c.prepareStatement(sql);
			//ps.setBinaryStream(1, fin,fin.available());
			//int status=ps.executeUpdate();
			//enctype="multipart/form-data"

			sql="insert into products(name,description,specs,stock,price,delcharges,catid,visible) values('"+pname+"','"+pdesc+"','"+specs+"',"+stock+","+price+","+delcharges+","+cid+","+visible+")";
			int status=s.executeUpdate(sql);
			if(status!=0)
			{
				errors="<b>New Product has been added successfully</b>";
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
			response.sendRedirect("addproduct.jsp");
		}
	}
}
else
{
	response.sendRedirect("adminlogin.jsp");
}
%>

<pre>
<form action="addproduct.jsp" method="post" class="signupform">
Product Name:			<input type="text" name="pname" required><br>
Product Category:		<select name='catname' required>
<% 
Statement s=c.createStatement();
{
	String sql="select * from productcat order by name";
	ResultSet rs=s.executeQuery(sql);
	while(rs.next())
	{
		String cname=rs.getString("name");
		out.println("<option value='"+cname+"'>"+cname+"</option>");
	}
}
%>
</select><br>
Product Image:			<input type="file" name="pimage" accept="image/*" /><br>
Description:			<textarea rows="4" cols="30" name="pdesc"  required></textarea><br>
Specifications:			<textarea rows="4" cols="30" name="specs" required></textarea><br>
Stock:				<input type="number" name="stock" required><br>
Price:				<input type="number" name="price" required><br>
Delivery Charges:		<input type="number" name="delcharges" required><br>
Visible: <input type="checkbox" name="visible" checked value="true">
<br>
<input type="submit" value="Add" class="regsubbtn" name="addpro">			<br><br><div  class="signup"><a href="manageproducts.jsp">Cancel</a><br></div>
</form>
</pre>
<br>
</div>
</div>
<%@ include file="includes/layouts/footer.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"  %>

<html>
<head>
<link rel="icon" type="image/png" href="images/fav.png" />
<title>Dimen Cart | Shop Smartly</title>
<link href="css/style.css" media="all" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="header">
<!-- <center><a href="index.jsp"><img src="images/logo.jpg"></a></center> -->
<div class="menu-wrap">
    <nav class="menu">
        <ul class="clearfix">
            <li><a href="index.jsp">Home</a></li>
            
                <%
                if(session.getAttribute("ausername")==null)
                {
                	out.println("<li><a href='products.jsp'>Products <span class='arrow'>&#9660;</span></a><ul class='sub-menu'>");      
					try
					{
						/* Class.forName("oracle.jdbc.driver.OracleDriver");
						c=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","root"); */
						Class.forName("com.mysql.jdbc.Driver");
						Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/dimendb","root","");
						int id; String name; boolean visible;
						Statement stmt=con.createStatement();
						String sql="select * from productcat where visible=1";
						ResultSet rs=stmt.executeQuery(sql);
						while(rs.next())
						{
							out.println("<li><a href='products.jsp?category="+rs.getInt("id")+"'>"+rs.getString("name")+"</a></li>");
						}
					}
					catch(SQLException ex)
					{
						System.out.println(ex.getMessage());
					}
                }
                else
                if(session.getAttribute("ausername")!=null)
                {
                	out.println("<li><a href='manageproducts.jsp'>Manage Products <span class='arrow'>&#9660;</span></a><ul class='sub-menu'><li><a href='addproductcat.jsp'>Add New Category</a></li><li><a href='addproduct.jsp'>Add New Product</a></li><li><a href='managecoupons.jsp'>Manage Coupons</a></li>");      
					
                }
				%>
                    
                </ul>
            </li>
            <li>
 <% if(session.getAttribute("ausername")==null)
 {
	 out.println("<a href='login.jsp'>Account ");
	 if(session.getAttribute("username")!=null)
 	out.println("<span class='arrow'>&#9660;</span></a><ul class='sub-menu'><li><a href='cart.jsp'>Cart - "+((Integer)session.getAttribute("cart"))+" Item(s)</a></li><li><a href='myorders.jsp'>My Orders</a></li><li><a href='edituserprofile.jsp'>Edit Profile</a></li><li><a href='logout.jsp'>Logout</a></li></ul>");
 	out.println("</li><li><a href='support.jsp'>Support</a>");
 }
 %>
  <% if(session.getAttribute("ausername")!=null)
 	out.println("<a href='allorders.jsp'>Recent Orders</a></li><li><a href='adminlogin.jsp'>Admin Account <span class='arrow'>&#9660;</span></a><ul class='sub-menu'><li><a href='manageadmins.jsp'>Manage Admins</a></li><li><a href='editadmin.jsp?adminid="+session.getAttribute("aid")+"'>Edit Profile</a></li><li><a href='logout.jsp'>Logout</a></li></ul>");
 %>
            </li>
            <li><a href="offers.jsp">Offers</a></li>
        </ul>
    </nav>
</div>
</div>



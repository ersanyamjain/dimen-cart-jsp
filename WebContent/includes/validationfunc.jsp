<%@page import="java.util.*" %>
<%!
String errors=null;
boolean flag=true;
String pwd="",rpwd="";

public boolean regFieldValidation(HashMap hm)
{
	errors="<ul>";
	Set set=hm.entrySet();
	Iterator it=set.iterator();
	while(it.hasNext())
	{
		Map.Entry entry=(Map.Entry)it.next();
		String key=(String)entry.getKey();
		String value=(String)entry.getValue();
		if(key.equals("Password"))
			pwd=value;
		if(key.equals("ReEnterPassword"))
			rpwd=value;
		checkBlank(key,value);
	}
	checkPassword(pwd,rpwd);
	errors+="</ul>";
	return flag;
}

public void checkBlank(String fieldname,String value)
{
	if(value==null || value.isEmpty())
	{	
		errors+="<li>"+fieldname+" can not be empty.</li>";
		flag=false;	
	}
}
public void checkPassword(String password,String rpassword)
{
	if(!password.equals(rpassword))
	{	
		errors+="<li>Password and Confirm Password must be same.</li>";
		flag=false;	
	}
}

public boolean loginFieldValidation(String Username,String Password)
{
	errors="<ul>";
	if(Username.isEmpty())
	{
		errors+="<li>Username can not be empty.</li>";
		flag=false;
	}
	if(Password.isEmpty())
	{
		errors+="<li>Password can not be empty.</li>";
		flag=false;
	}
	errors+="</ul>";
	return flag;	
}

%>
<%-- 
    Document   : 3
    Created on : Apr 20, 2016, 8:12:15 PM
    Author     : Ranjith Dontamsetti
--%>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <meta name="keywords" content="" />
<meta name="description" content="" />
<link href="http://fonts.googleapis.com/css?family=Didact+Gothic" rel="stylesheet" />
<link href="css1.css" rel="stylesheet" type="text/css" media="all" />
<link href="fonts.css" rel="stylesheet" type="text/css" media="all" />
<script  src="http://jqueryjs.googlecode.com/files/jquery-1.3.2.min.js">
  
</script>

<style>


body, div, h1,h2, form, fieldset, input, textarea, footer,p { 
	margin: 0; padding: 0; border: 0; outline: none;
}


@font-face {
	font-family: 'YanoneKaffeesatzRegular';
	src: url('yanonekaffeesatz-regular-webfont.eot');
	src: url('yanonekaffeesatz-regular-webfont.eot?#iefix') format('embedded-opentype'),
	url('yanonekaffeesatz-regular-webfont.woff') format('woff'),
	url('yanonekaffeesatz-regular-webfont.ttf') format('truetype'),
	url('yanonekaffeesatz-regular-webfont.svg#YanoneKaffeesatzRegular') format('svg');
	font-weight: normal;
	font-style: normal;
}

body {}
p {text-shadow:0 1px 0 #fff; font-size:24px;}

h1 {margin-bottom:20px; text-align:center;font-size:48px; text-shadow:0 1px 0 #ede8d9; }

form {background: #fff;
      background-color: rgba(255,255,255,0.2);
		position:relative;top:200px;
		height:600px;width:500px;margin:0px auto;padding:20px; 
		border: 1px solid #fff;
		border-radius: 3px; 
                }
		

	


</style>


    </head>
    <body>
         <%
        Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/crave","root", "ranjith");
    String cuisine=request.getParameter("cuisine");
    session.setAttribute("cuisine", cuisine);
   String veg =String.valueOf(session.getAttribute("veg"));
   String type =String.valueOf(session.getAttribute("type"));
  
  
  
ResultSet rs;
String sql= "select DISTINCT Taste from food where Veg=? and Type=? and Cuisine=?";


PreparedStatement ps1=con.prepareStatement(sql);
ps1.setString(1, veg);
ps1.setString(2, type);
ps1.setString(3, cuisine);
rs = ps1.executeQuery();
String taste; 
%>
<form action="result.jsp" method="post">
    
Taste you would like to savor: 
    <%
while(rs.next())
  {
     
      taste=rs.getString("Taste");
      
	
	
%>
    
                                <input type="radio" name="taste" value="<%=taste%>"> <%=taste%>   
 



<%
  }
%>
    
     <br><br>   
     
				Amount willing to spend: 
				<input type="text" name="amount" value=""  /><br/><br/>
                                <input type="submit" name ="submit" value="Suggest" />
     
        </form>
       
    </body>
</html>

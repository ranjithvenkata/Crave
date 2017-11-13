<%-- 
    Document   : result.jsp
    Created on : Apr 13, 2016, 6:44:59 PM
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
<link rel="stylesheet" type="text/css" href="result.css">

    </head>
    <body>
        <div id="header-wrapper">
	<div id="header" class="container">
		<div id="logo">
			<h1><a href="#">Crave</a></h1>
		</div>
		<div id="menu">
			<ul>
				<li class="active"><a href="index_1.html" accesskey="1" title="">Homepage</a></li>
				<li><a href="#" accesskey="2" title=""></a></li>
				
			</ul>
		</div>
	</div>
            <% 
Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/crave","root", "ranjith");
  
    String type=String.valueOf(session.getAttribute("type"));
    String cuisine=String.valueOf(session.getAttribute("cuisine"));
    String veg=String.valueOf(session.getAttribute("veg"));
    String taste=request.getParameter("taste");
    String amount=request.getParameter("amount");
     String meal=String.valueOf(session.getAttribute("meal"));
    
   
    String cal=String.valueOf(session.getAttribute("calvalue"));
    String bmi=String.valueOf(session.getAttribute("bmi"));
    Float calorie=Float.parseFloat(cal);
    float mealcalorie=0;
    float x=calorie/6;
    
    
   
        if(meal.equals("b"))
        { mealcalorie=3*x;
        
        }
        else if(meal.equals("l"))
        { mealcalorie=2*x;
        
        }
        else if(meal.equals("d"))
        { mealcalorie=x;
        
        } 

ResultSet rs;
String name,calories,price,timeserve,sql;


if(type.equals("Dessert"))
{   sql="select * from food where Type='Dessert' and Veg=? and Price<=? and Calories<=?";

PreparedStatement ps1=con.prepareStatement(sql);


ps1.setString(1, veg);
ps1.setString(2, amount);
ps1.setFloat(3, mealcalorie);


rs = ps1.executeQuery();
}
else
{
    sql="select * from food where Type=? and Cuisine=? and Veg=? and Price<=? and Calories<=? and Taste=?";


            
        
PreparedStatement ps=con.prepareStatement(sql);
ps.setString(1, type);
ps.setString(2, cuisine);
ps.setString(3, veg);
ps.setString(4, amount);
ps.setFloat(5, mealcalorie);
ps.setString(6, taste);
rs = ps.executeQuery();
}
%>
	<div id="banner" class="container">
		<div class="title">
                    <h2 style="color: whitesmoke">Food Time..!!<br></h2></div>  
                    <h2 style="background-color:#964B00; color: whitesmoke">To keep your weight in check.</h2>
                        <h2 style="background-color:#000000 ; color: whitesmoke">
                        Based on the data we have of you <br> Your BMI is <%=bmi%><br>
                         Prefered Calorie intake for this meal is <%=mealcalorie%> calories<br>
                        We suggest the following options for you.<br>
                        
              </h2>
		

        
        <table>
            <thead>
      <tr style="background-color: #964B00">
      <th>Name of the Dish</th>
      <th>Calories</th>
      <th>Price</th>
      <th>Time to serve(minutes)</th>
      <th>Picture</th>
    </tr>
  </thead>
         

<% 


String id;

while(rs.next())
  {
      name=rs.getString("Name");
      calories=rs.getString("Calories");
      price=rs.getString("Price");
      timeserve=rs.getString("Time_used");
      id=rs.getString("food_id");
      
	
	
%>
    <tr>
        <td><b><font color='#663300'><%=name%></font></b> </td>
        <td><b><font color='#663300'><%=calories%></font></b> </td>
        <td><b><font color='#663300'><%=price%></font></b> </td>
        <td><b><font color='#663300'><%=timeserve%></font></b> </td>
        <td><img src="img/<%=id%>.jpg" alt="no image to display" height=300 width=300></td>
        
    </tr>


<%
  }
%>



    
        </table>

    
    </body>
</html>

<%-- 
    Document   : trial
    Created on : Apr 14, 2016, 12:14:35 AM
    Author     : Ranjith Dontamsetti
--%>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
                 <% 
Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dst","root", "ranjith");
    String type=request.getParameter("type");
    String cuisine=request.getParameter("cuisine");
    String veg=request.getParameter("veg");
    String taste=request.getParameter("taste");
    String amount=request.getParameter("amount");
    String meal=request.getParameter("meal");
   
    String cal=String.valueOf(session.getAttribute("calvalue"));
    Float calorie=Float.parseFloat(cal);
    float mealcalorie=0;
    float x=calorie/6;
    
    
    
String sql="select * from food where Type=? and Cuisine=? and Veg=? and Price<=? and Calories<=?";


        if(meal.equals("b"))
        { mealcalorie=3*x;
        
        }
        else if(meal.equals("l"))
        { mealcalorie=2*x;
        
        }
        else if(meal.equals("d"))
        { mealcalorie=x;
        
        }
            
        
    


PreparedStatement ps=con.prepareStatement(sql);
ps.setString(1, type);
ps.setString(2, cuisine);
ps.setString(3, veg);
ps.setString(4, amount);
ps.setFloat(5, mealcalorie);



ResultSet rs;
String name;
rs = ps.executeQuery();


while(rs.next())
  {
      name=rs.getString("Name");
      
	
%>
    <tr>
        <td><b><font color='#663300'><%=name%></font></b> </td>
    </tr>


<%
  }
%>
    <%=sql%><br>
Variables: <%=type%><%=cuisine%><%=veg%><%=taste%> calorie <%=cal%>,,<%=calorie%> meal: <%=meal%> factor: <%=x%> calo : <%=mealcalorie%>



    
        </table>
    </body>
</html>

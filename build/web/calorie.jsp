<%-- 
    Document   : calorie
    Created on : Apr 13, 2016, 10:36:23 PM
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
try{
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/crave","root", "ranjith");}
catch(Exception e){
    System.out.println("connection needs to be checked");}
    String age=request.getParameter("age");
    String gender=request.getParameter("gender");
    String height=request.getParameter("height");
    String weight=request.getParameter("weight");
    
    
int kg=Integer.parseInt(weight);
    float cm=Integer.parseInt(height);
    int ageint=Integer.parseInt(age);
    float m=cm/100; 
    int bucket=0;
    float calorie;



float bmi=kg/(m*m);
//categorising into buckets based on bmi
calorie=10*kg+6*cm-5*ageint;
if(gender.equals("male"))
{
      
    calorie=calorie+5;
    
    if(bmi<=20)
        bucket=1;
    else if(bmi>20&&bmi<=25)
            bucket=2;
    else if(bmi>25)
        bucket=3;
}
else
{
     
    if(bmi<=19)
        bucket=1;
    else if(bmi>19&&bmi<=24)
            bucket=2;
    else if(bmi>24)
        bucket=3;
}
//calculating final calorie value

switch(bucket)
{
    case(1):
      calorie=calorie+500;
      case(2):
      calorie=calorie;
      case(3):
      calorie=calorie-500;
}

session.setAttribute("calvalue",calorie);
session.setAttribute("bmi",bmi);

        
        
        
        







%>

reqvalue : <%=age%><%=gender%><%=height%><%=weight%> <br>
parsevalues:<%=ageint%><%=gender%><%=cm%><%=kg%><br>
cm:<%=cm%>
m: <%=m%>
bmi:<%=bmi%>
calorie:<%=calorie%>

<% response.sendRedirect("1.jsp");
%>

    </body>
</html>

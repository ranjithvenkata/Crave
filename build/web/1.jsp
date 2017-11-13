<%-- 
    Document   : 1
    Created on : Apr 20, 2016, 7:44:42 PM
    Author     : Ranjith Dontamsetti
--%>

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
    <h1>Hello , Good to see you again!<br> Please tell us your preferences</h1>
		
                    <form style="font-size: 22px" action="1b.jsp" method="post">
				<p></p><br/>
                                What would you like to have?<br>
                                <input type="radio" value="b" name="meal"> Breakfast
                                    <input type="radio" value="l" name="meal">Lunch
                                        <input type="radio" value="d" name="meal">Dinner
                                        
                                         <br><br>
                              Your preference:  <select style=" border-color: transparent" name="veg">
                                    <option value="Vegetarian" class="active">Veg</option>
  <option value="Non Vegetarian">Non-Veg</option>
</select>
                              <input type="submit" value="next">
                                        </form>
    </body>
</html>

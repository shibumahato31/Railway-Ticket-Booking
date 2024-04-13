<%@page import="dto.Customer"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cancel Ticket</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<style>
*{
        box-sizing: border-box;
        margin: 0px;
        padding: 0px;
    }
     button{
        border-radius: 5px;
        height: 35px;
        width: 120px;
    }
    body{
        background-color:aliceblue;
    }
    form{
        
        margin-top: 100px;
        padding-top: 20px;
    }
    input{
        border-top: none;
        border-left: none;
        border-right: none;
        background: transparent;
        outline: none;
    }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="ManagementLogin.html">ONLINE</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarText">
          <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
              <a class="nav-link" href="Home.html">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="Register.html">Register</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="Login.html">Login</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="UserHome.html">Customer home</a>
            </li>
          </ul>
          <span class="navbar-text">
             <a href="logout">Logout</a>
          </span>
        </div>
      </nav>
	<%
	Customer user = (Customer) session.getAttribute("user");
	%>
	<%
	if (user == null) {
		response.getWriter().print("<h1 style='color:red'>Session Expired login again</h1>");
		request.getRequestDispatcher("Login.html").include(request, response);
	} else {
	%>
	<center>
	<form action="cancelticket">
		Enter PNR Number: <input type="number" name="pnr"> <br><br>
		<button>Cancel Ticket</button>
	</form></center>
	<%
	}
	%>
</body>
</html>
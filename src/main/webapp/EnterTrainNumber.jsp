<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Train Number</title>
</head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<style>
    button{
        border-radius: 10px;
        height: 40px;
        width: 90px;
        margin-left: 20px;
    }
    body{
        background-color:aliceblue;
    }
    input{
        border: 1px solid ;
        background: transparent;
        outline: none;
    }
    form{
    margin-top: 50px;
    }
    </style>
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
    <center>
<form action="BookTicket.jsp">
Enter Train Number: <input type="number" name="tn" ><br><br>
<button>Book</button>
</form>
</center>
<br>
</body>
</html>
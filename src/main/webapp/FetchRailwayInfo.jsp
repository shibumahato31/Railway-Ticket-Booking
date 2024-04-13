<%@page import="java.util.Arrays"%>
<%@page import="dto.Train"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Fetch Railway Info</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

<style>
*{
        box-sizing: border-box;
        margin: 0px;
        padding: 0px;
    }
    
    body{
        background-color:aliceblue;
    }
    h1{
        margin-top: 30px;
        font-weight: bold;
    }
    #reset{
        background-color: rgba(255, 0, 0, 0.384);
         border: red;
       border-radius: 3px;
        height: 25px;
         margin-left: 3px;
        width: 60px;
      	color:white;
    }
    #submit{
        background-color: rgba(101, 204, 4, 0.651);
        border: green;
        border-radius: 3px;
        margin-left: 3px;
        height: 25px;
        width: 60px;
      	color:white;
    }
    table{
    margin:40px 100px;
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
              <a class="nav-link" href="ManagementHome.html">Admin home</a>
            </li>
          </ul>
          <span class="navbar-text">
           <a href="logout">Logout</a>
          </span>
        </div>
    </nav>
<%List<Train> list=(List<Train>)request.getAttribute("list"); %>
<center><h1>Train Details</h1></center>
<table border="2" cellpadding="5px" width="1200px">
<tr>
<th>Train Number</th>
<th>Train Name</th>
<th>From Station</th>
<th>To Station</th>
<th>Stations</th>
<th>Time of Departure</th>
<th>Time of Arrival</th>
<th>Ticket Price</th>
<th>Available Days</th>
<th>Delete</th>
<th>Edit</th>
</tr>

<%for(Train train:list){ %>
<tr>
<th><%=train.getNumber() %></th>
<th><%=train.getName() %></th>
<th><%=train.getStations()[0] %></th>
<th><%=train.getStations()[train.getStations().length-1] %></th>
<th><%=Arrays.toString(train.getStations()) %></th>
<th><%=train.getTime()[0] %></th>
<th><%=train.getTime()[train.getTime().length-1] %></th>
<th><%=Arrays.toString(train.getPrice()) %></th>
<th><%=Arrays.toString(train.getDays()) %></th>
<th><a href="deletetrain?number=<%=train.getNumber()%>"><button id="reset">Delete</button></a></th>
<th><a href="EditTrain.jsp?number=<%=train.getNumber()%>"><button id="submit">Edit</button></a></th>
</tr>
<%} %>
</table>
<br>
</body>
</html>
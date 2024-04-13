<%@page import="dto.Train"%>
<%@page import="dao.TrainDao"%>
<%@page import="dto.Customer"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Book Ticket</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<style>
*{
        box-sizing: border-box;
        margin: 0px;
        padding: 0px;
    }
      #reset{
        background-color: rgba(255, 0, 0, 0.384);
        border: red;
        border-radius: 10px;
        width: 100px;
        height: 40px;
    }
    #reset:hover{
        box-shadow: 0 0 10px red;
    }
    #submit{
        background-color: rgba(101, 204, 4, 0.651);
        border: green;
        border-radius: 10px;
        margin-left: 20px;
         width: 100px;
         height: 40px;
    }
    #submit:hover{
        box-shadow:0 0 10px green;
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
		response.getWriter().print("<h1 style='color:red'>Login First</h1>");
		request.getRequestDispatcher("Login.html").include(request, response);
	} else {
	int trainnumber = Integer.parseInt(request.getParameter("tn"));
	TrainDao dao = new TrainDao();
	Train train = dao.fetch(trainnumber);
	if(train==null)
	{
		response.getWriter().print("<h1 style='color:red'>Invalid Train Number</h1>");
		request.getRequestDispatcher("UserHome.html").include(request, response);
	}
	else{
	%>
	<center>
	<h1>
		Hello
		<%=user.getFirstName()%></h1>
	<br>
	<form action="bookticket" method="post">
	User Id: <input type="text" name="uid" value="<%=user.getId()%>" readonly="readonly"><br><br>
	Train Number: <input type="text" name="tn" value="<%=trainnumber%>" readonly="readonly"><br><br>
	From: <select name="from">
	<%for(int i=0;i<train.getStations().length-1;i++){ %>
	<option><%=train.getStations()[i] %></option>
	<%} %>
	</select><br><br>
	To: <select name="to">
	<%for(int i=1;i<train.getStations().length;i++){ %>
	<option><%=train.getStations()[i] %></option>
	<%} %>
	</select><br><br>
	Date of Journey: <input type="date" name="doj"><br><br>
	Number of Seats: <input type="number" name="seats"><br><br>
	<button type="reset" id="reset">Cancel</button>
	<button id="submit">Book</button> 
	</form>
	<br></center>
	<%
	}}
	%>
</body>
</html>
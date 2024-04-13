<%@page import="dto.TrainTicket"%>
<%@page import="java.util.List"%>
<%@page import="dto.Customer"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View All Tickets</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

<style>
*{
        box-sizing: border-box;
        margin: 0px;
        padding: 0px;
    }
    button{
        border-radius: 3px;
        height: 25px;
        width: 60px;
      	background-color:red;
      	color:white;
    }
    body{
        background-color:aliceblue;
    }
    h1{
        margin-top: 30px;
        font-weight: bold;
    }
    table{
    margin:50px 100px;
    height: auto;
    width: 1200px;
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
<% Customer user=(Customer)session.getAttribute("user"); %>
<%if(user==null){
response.getWriter().print("<h1 style='color:red'>Session Expired login again</h1>");	
request.getRequestDispatcher("Login.html").include(request, response);
}
else{
%>
<%List<TrainTicket> list=user.getTickets(); 
if(list==null || list.isEmpty())
{
	response.getWriter().print("<h1 style='color:red'>No tickets Booked</h1>");	
	request.getRequestDispatcher("UserHome.html").include(request, response);
}
else{
%>
<table border="2" cellpadding="10px" cellspacing="10px">
<tr>
<th>PNR</th>
<th>Train Number</th>
<th>UserName</th>
<th>From</th>
<th>To</th>
<th>Number of Seats</th>
<th>Price</th>
<th>Date of Booking</th>
<th>Date of Journey</th>
<th>Status</th>
<th>Cancel</th>
</tr>
<%for(TrainTicket ticket:list){ %>
<tr>
<th><%=ticket.getPnr() %></th>
<th><%=ticket.getTrainNumber() %></th>
<th><%=user.getFirstName()+" "+user.getLastName() %></th>
<th><%=ticket.getSource() %></th>
<th><%=ticket.getDestination() %></th>
<th><%=ticket.getNumberOfSeats() %></th>
<th><%=ticket.getAmount() %></th>
<th><%=ticket.getDateOfBooking() %></th>
<th><%=ticket.getDateOfJourney() %></th>
<th><%=ticket.getStatus() %></th>
<th>
<%if(ticket.getStatus().equals("Booked")){ %>
<a href="cancelticket?pnr=<%=ticket.getPnr()%>"><button>Cancel</button></a>
<%}
else{
%>
<button disabled="disabled">Cancel</button>
<%} %>
</th>
</tr>
<%} %>
</table>
<%} }%>
</body>
</html>
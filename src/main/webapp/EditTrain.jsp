<%@page import="java.util.Arrays"%>
<%@page import="dto.Train"%>
<%@page import="dao.TrainDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Train</title>
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
        margin-top: 50px;
        font-weight: bold;
    }
    nav{
        /* border: 2px solid red; */
        height: 50px;
        width: auto;
        
    }
    input{
        border-top: none;
        border-left: none;
        border-right: none;
        background: transparent;
        outline: none;
        margin-left: 10px;
    }
    textarea{
        border: 2px solid gray;
        border-top: none;
        border-left: none;
        border-right: none;
         outline: none;
        height: 20px;
        background-color: transparent;
        margin-left: 10px;
    }
    button{
        height: 30px;
        width: 80px;
        margin-left: 20px;
    }
    #reset{
        background-color: rgba(255, 0, 0, 0.384);
        border: red;
        border-radius: 10px;
    }
    #reset:hover{
        box-shadow: 0 0 10px red;
    }
    #submit{
        background-color: rgba(101, 204, 4, 0.651);
        border: green;
        border-radius: 10px;
        margin-left: 20px;
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
              <a class="nav-link" href="ManagementHome.html">Admin home</a>
            </li>
          </ul>
          <span class="navbar-text">
             <a href="logout">Logout</a>
          </span>
        </div>
      </nav>
	<%
	TrainDao dao = new TrainDao();
	Train train = dao.fetch(Integer.parseInt(request.getParameter("number")));
	%>
	<center>
	<form action="updatetrain" method="post">
		Train Number: <input type="number" name="tnumber"value="<%=train.getNumber()%>" readonly="readonly"><br><br>
		Train Name: <input type="text" name="tname"value="<%=train.getName()%>"><br> <br>
		Number of Seats: <input type="number" name="tseat" value="<%=train.getSeat()%>"><br><br>
		Stations:<textarea rows="5" cols="30" name="tstation">
		<%
			for (String station : train.getStations()) {
				out.print(station + ",");
			}
			%></textarea><br><br> 
		Ticket Price:<textarea rows="5" cols="30" name="tprice">
		<%
			for (String price : train.getPrice()) {
				out.print(price + ",");
			}
			%></textarea><br><br> 
		Time:<textarea rows="5" cols="30" name="ttime">
		<%
			for (String time : train.getTime()) {
				out.print(time + ",");
			}
			%></textarea><br><br>
		 Days:<textarea rows="5" cols="30" name="tday"><%
			for (String day : train.getDays()) {
				out.print(day + ",");
			}
			%></textarea><br><br>
		<button type="reset" id="reset">Cancel</button>
		<button id="submit">Update</button>
	</form>
	</center>
</body>
</html>
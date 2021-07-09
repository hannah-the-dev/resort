<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.hannahj.resort.service.*" %>
<%@ page import="com.hannahj.resort.domain.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
  <head>
  <meta charset="UTF-8">
  <title>Check Availability</title>
<!--   <link rel='stylesheet' href='https://unpkg.com/v-calendar/lib/v-calendar.min.css'> -->
  <link href="main.css" rel="stylesheet" type="text/css">
  
</head>
  <body>
    <% 
    BookingServiceImpl service = new BookingServiceImpl();
    
    List<Room> rooms = service.roomInfo();
    
    request.setAttribute("rooms", rooms); 
    %>
    <div id="page-scope-container">
      <form target="main" >
      <div class="date-picker-container" style="
      display: flex; align-items: center">
        <div class="date-picker">
          <label for="in_date">Check-in Date</label><br>
          <input type="date" name="checkin" id="in_date" placeholder="yyyy-mm-dd" required>
        </div>
        <div class="date-picker">
          <label for="out_date">Check-out Date</label><br>
          <input type="date" name="checkout" id="out_date" placeholder="yyyy-mm-dd" required>
        </div>
        <button formaction="calendar.jsp">조회</button>
      </div>
        </form>
      <iframe id = calendar name="main" frameborder="0" 
        width="100%" >
  <!-- calendar here -->
      </iframe>
    </div>
    <script>
	    let [today] = new Date().toISOString().split("T");
    	document.querySelector("#in_date").setAttribute("min", today);
    	
    	document.querySelector("#in_date").onchange = () => {
    		document.querySelector("#out_date").setAttribute("min", document.getElementById("in_date").value);
    	};

    </script>
    
  </body>
</html>
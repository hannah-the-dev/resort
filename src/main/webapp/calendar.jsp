<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.hannahj.resort.service.*" %>
<%@ page import="com.hannahj.resort.domain.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
  <head>
  <meta charset="UTF-8">
  <title>Insert title here</title>
<!--   <link rel='stylesheet' href='https://unpkg.com/v-calendar/lib/v-calendar.min.css'> -->
  <link href="main.css" rel="stylesheet" type="text/css">
  
</head>
  <body>
    <% 
    request.setCharacterEncoding("UTF-8");
    BookingServiceImpl service = new BookingServiceImpl(); 
    
    Date checkin = service.toDate(request.getParameter("checkin"));
    Date checkout = service.toDate(request.getParameter("checkout"));
    
    if (checkin == null || checkout == null) {
        out.print("<h1> 날짜가 선택되지 않았습니다.</h1>");
        return; 
    }
    
    
    String dates[] = service.addAMonthToString(checkin);
    List<Booking> bookings = service.selectMonth(checkout);
    List<Room> rooms = service.roomInfo();
//     List<Date> dateList = service.getDateList(checkin, checkout);
    Map<Date, String[]> status = service.getStatus(checkin, checkout);
    
    request.setAttribute("bookings", bookings); 
    request.setAttribute("rooms", rooms); 
    request.setAttribute("status", status); 
    request.setAttribute("checkin", checkin); 
    request.setAttribute("checkout", checkout); 
    %>
    <table id="bookStatus">
      <tr>
        <th>Date</th>
        <c:forEach var="room" items="${rooms}">
        <th>${room.roomName}</th>
        </c:forEach>
      </tr>
      <c:forEach var="date" items="${status}">
      
      <tr>
        <td><fmt:formatDate value="${date.key}" pattern="yyyy-MM-dd(E)"/></td>
        <c:forEach var="name" items="${date.value}" varStatus="room"> 
          <c:choose>
            <c:when test="${!empty name}">
            <td>${name}</td>
            </c:when>
            <c:otherwise>
            <td><a href="booking.jsp?checkin='${date.key}'&room='${room.count}'">예약가능</a></td>
            </c:otherwise>
            
          </c:choose>
         </c:forEach>
      </tr>
      </c:forEach>
      
    </table>
    <script>
	    document.body.scrollIntoView(true);
   		parent.document.all.calendar.height = document.body.scrollHeight;
    </script>
  </body>
</html>
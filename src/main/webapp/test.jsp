<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.hannahj.resort.dao.*" %>
<%@ page import="com.hannahj.resort.domain.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
  <head>
  <meta charset="UTF-8">
  <title>Insert title here</title>
</head>
  <body>
    <%
    RoomDaoImpl dao = new RoomDaoImpl(); 
        List<Booking> bookings = dao.selectAll();
        request.setAttribute("bookings", bookings);
    %>
    <c:forEach items="${bookings}" var="entry">
      ${entry.userName}
      ${entry.email}
      ${entry.member}
    </c:forEach>
    
  </body>
</html>
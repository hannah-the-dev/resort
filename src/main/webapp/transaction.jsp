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
  <title>Booking a Room</title>
  <link href="main.css" rel="stylesheet" type="text/css">

</head>
  <body>
    <% 
    request.setCharacterEncoding("UTF-8");
    BookingServiceImpl service = new BookingServiceImpl(); 
    
    Date checkin = service.toDate(request.getParameter("checkin"));
    Date checkout = service.toDate(request.getParameter("checkout"));
    
    Integer roomId = null;
    Long amount = null;
    Integer bookId = null;
    
    boolean member = (request.getParameter("member") != null) ;
    String id = request.getParameter("id");
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");
    boolean paid = false;
    String msg = request.getParameter("msg");
    
    try {
        roomId = Integer.valueOf(request.getParameter("room"));
        amount = Long.valueOf(request.getParameter("amount"));
        
        if (roomId == null) {
          return;         
        } else {
          
        }
    } catch (Exception e) {
        out.print("<h1> 오류가 발생했습니다. </h1>");
        return; 
    } 
    
    if (checkin == null || checkout == null) {
        out.print("<legend> 일정 정보가 변경되었습니다. 다시 시도해주세요. </legend>");
        return; 
    }
    
    Booking booking = new Booking(checkin, checkout, (int)roomId, amount, member, id, name, email, phone, paid, msg, bookId);
    service.book(booking);    
    %>
  </body>
  <script>
	history.go(-2);
  </script>
  
</html>
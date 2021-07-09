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
  <title>Selected Room</title>
<!--   <link rel='stylesheet' href='https://unpkg.com/v-calendar/lib/v-calendar.min.css'> -->
  <link href="main.css" rel="stylesheet" type="text/css">
  
</head>
  <body>
    <% 
    request.setCharacterEncoding("UTF-8");
    BookingServiceImpl service = new BookingServiceImpl(); 
    
    Date checkin = service.toDate(request.getParameter("checkin"));
    Date checkout = service.toDate(request.getParameter("checkout"));
    Integer roomId = null;
    try {
        roomId = Integer.valueOf(request.getParameter("room"));
        if (roomId == null) {
          out.print("<h1> 방 번호가 입력되지 않았습니다. </h1>");
          return;         
        }
    } catch (Exception e) {
        out.print("<h1> 방 번호 입력이 잘못되었습니다. </h1>");
        return; 
    } 
    
    if (checkin == null || checkout == null) {
        out.print("<h1> 날짜가 선택되지 않았습니다. </h1>");
        return; 
    }
    List<Room> rooms = service.roomInfo();
    Room room = rooms.get(roomId-1);
    Map<Date, String[]> status = service.getStatus(checkin, checkout);
    
    int nights = service.getNights(checkin, checkout);
    request.setAttribute("rooms", rooms); 
    request.setAttribute("selected", room);
    request.setAttribute("status", status); 
    request.setAttribute("checkin", checkin); 
    request.setAttribute("checkout", checkout); 
    request.setAttribute("nights", nights); 
    %>
    <form method="post" action="booking.jsp" target="_parent">
      <h1>Room Detail</h1>
      <dl>
        <dt>Check-in</dt> 
        <dd><input type="hidden" name='checkin' value='<fmt:formatDate value="${checkin}" pattern="yyyy-MM-dd"/>' readonly>
        <fmt:formatDate value="${checkin}" pattern="yyyy-MM-dd(E)"/></dd>
        <dt>Check-out</dt> 
        <dd><input type="hidden" name='checkout' value='<fmt:formatDate value="${checkout}" pattern="yyyy-MM-dd"/>' readonly>
        <fmt:formatDate value="${checkout}" pattern="yyyy-MM-dd(E)"/>
        <input type="hidden" name='nights' value='${nights}' readonly></dd>
        <dt>Room</dt> 
        <dd>${selected.roomName}<input type="hidden" name='room' value='${selected.roomId}' readonly></dd>
        <dt>Price/night(USD)*<dt>
        <dd>$ <input type="text" name='ppn' 
        value='<fmt:formatNumber type="number" maxFractionDigits="3" value="${selected.defPrice}" />' readonly></dd>
        <dt>Total Price(USD)*</dt> 
        <dd>$ <input type="text" name='amount' value='<fmt:formatNumber type="number" maxFractionDigits="3" 
        value="${selected.defPrice * nights}" />' readonly></dd>
        <dd style="font-size: 0.6em">* Prices do not include taxes & fees</dd>
      </dl>
      <div id="buttons">
      <button class="discouraged" >비회원으로 예약하기</button>
      <button id="login">로그인</button>
      </div>
    </form>
    
    <table id="bookStatus">
      <caption><b>다른 날짜/룸 예약하기</b></caption>
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
              <td><a target="main" 
              href="preview.jsp?checkin=<fmt:formatDate value="${date.key}" pattern="yyyy-MM-dd"/>
              &checkout=<fmt:formatDate value="${checkout}" pattern="yyyy-MM-dd"/>&room=${room.count}">
              예약가능</a>
              </td>
            </c:otherwise>
            
          </c:choose>
         </c:forEach>
      </tr>
      </c:forEach>
      
    </table>
    <script>
      document.body.scrollIntoView(true);
      parent.document.all.calendar.height = document.body.scrollHeight+document.body.style.marginBottom;
    </script>
  </body>
</html>
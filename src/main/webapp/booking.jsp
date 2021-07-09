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
  <title>Book a Room</title>
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
          out.print("<legend> 방 번호가 입력되지 않았습니다. </legend>");
          return;         
        }
    } catch (Exception e) {
        out.print("<legend> 방 번호 입력이 잘못되었습니다. </legend>");
        return; 
    } 
    
    if (checkin == null || checkout == null) {
        out.print("<legend> 일정 정보가 변경되었습니다. 다시 시도해주세요. </legend>");
        return; 
    }
    
    List<Room> rooms = service.roomInfo();
    Room room = rooms.get(roomId-1);
    
    int nights = service.getNights(checkin, checkout);
    request.setAttribute("rooms", rooms); 
    request.setAttribute("selected", room);
    request.setAttribute("checkin", checkin); 
    request.setAttribute("checkout", checkout); 
    request.setAttribute("nights", nights); 
    %>
    <form method=post >
      <fieldset class="customer">
        <legend>Customer Information</legend>
        <div>
          <label for='name'>Name: </label>
          <input type="text" name='name' required>
        </div>
        <div>
          <label for='email'>email: </label>
          <input type="email" name='email' required>
        </div>
        <div>
          <label for='phone'>Contact: </label>
          <input type="tel" name='phone' required>
        </div>
        <div>
          <label for='msg' style="vertical-align: top">Special request: </label>
          <textarea name='msg' rows=3 cols=60></textarea>
        </div>
      </fieldset>
      
      <fieldset class="stay">
        <legend>Stay Information</legend>
          <div>
            <label for='check-in'>Check-in: </label> 
            <input type="text" name='checkin' value='<fmt:formatDate value="${checkin}" pattern="yyyy-MM-dd(E)"/>' readonly>
          </div>
          <div>
            <label for='check-out'>Check-out: </label> 
            <input type="text" name='checkout' value='<fmt:formatDate value="${checkout}" pattern="yyyy-MM-dd(E)"/>' readonly>
            <input type="hidden" name='nights' value='${nights}' readonly>
          </div>
          <div>
            <label for='room'>Room: </label> 
            ${selected.roomName}<input type="hidden" name='room' value='${selected.roomId}' readonly>
          </div>
          <div>
            <label for='ppn'>Price/night(USD)*: </label>
            $ <input type="text" value='<fmt:formatNumber type="number" maxFractionDigits="3" value="${selected.defPrice}" />' readonly>
             <input type="hidden" name='ppn' value="${selected.defPrice}" readonly>
          </div>
          <div>
            <label for='amount'>Total Price(USD)*: </label> 
            $ <input type="text" value='<fmt:formatNumber type="number" maxFractionDigits="3" value="${selected.defPrice * nights}" />' readonly>
             <input type="hidden" name='amount' value="${selected.defPrice * nights}" readonly>
            <div style="font-size: 0.6em">* Taxes & fees will be applied at the site of payment.</div>
        </div>
      </fieldset>
      <div>
        <div id="buttons">
          <input type="submit" formaction='transaction.jsp' value="예약하기">
          <input type="reset"  class="discouraged" onClick='javascript:history.back();'>
        </div>
      </div>
    </form>    
  </body>
  
</html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String date = request.getParameter("reservationDateInput");
    request.getSession().setAttribute("reservationDate",date);
    response.sendRedirect("reservationMachine.jsp");

%>

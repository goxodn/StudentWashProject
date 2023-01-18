<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.getSession().invalidate();
    response.sendRedirect("login.jsp");
%>
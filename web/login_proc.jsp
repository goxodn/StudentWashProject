<%@ page import="com.beakseok.clean.user.User" %>
<%@ page import="com.beakseok.clean.user.dao.UserDAO" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("utf-8");
%>

<%
    String pattern = "yyyy-MM-dd";
    SimpleDateFormat sdf = new SimpleDateFormat(pattern);
    String date = sdf.format(new Date());

    User user = new User();

    User loginUser = new User();
    String id = request.getParameter("id");
    String password = request.getParameter("password");

    user.setId(id);
    user.setPassword(password);

    UserDAO userDAO = new UserDAO();

    //return null , user 2가지 경우
    loginUser = userDAO.loginUser(user);

    if(loginUser != null){
        //세션 -> db, html 웹 서버 저장공간 ,
        request.getSession().setAttribute("user",loginUser);
        request.getSession().setAttribute("reservationDate",date);
        response.sendRedirect("main.jsp");
    }else{
        response.sendRedirect("login.jsp");
    }

%>
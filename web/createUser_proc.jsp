<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.beakseok.clean.user.User" %>
<%@ page import="com.beakseok.clean.user.dao.UserDAO"%>
<%
    request.setCharacterEncoding("utf-8");
%>
<%
    String id = request.getParameter("id");
    String password = request.getParameter("password");
    String address = request.getParameter("address");
    String studentRoomLevel = request.getParameter("studentRoomLevel");
    String studentRoomNum = request.getParameter("studentRoomNum");
    String name = request.getParameter("name");
    String phone = request.getParameter("phone");
%>

<%
    User user = new User();
    UserDAO userDAO = new UserDAO();

    user.setId(id);
    user.setPassword(password);
    user.setAddress(address);
    user.setStudentRoomLevel(Integer.parseInt(studentRoomLevel));
    user.setStudentRoomNum(Integer.parseInt(studentRoomNum));
    user.setName(name);
    user.setPhone(phone);

    // 1 : 아이디 없음 ,  0 : 아이디 존재
    int idCheckNum = userDAO.create_user_id_check(user);
    if(idCheckNum == 1){
        userDAO.create_user(user);
        response.sendRedirect("login.jsp");
    }else{
        response.sendRedirect("createUser.jsp");
    }

%>


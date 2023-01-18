<%@ page import="com.beakseok.clean.payment.Payment" %>
<%@ page import="com.beakseok.clean.user.User" %>
<%@ page import="com.beakseok.clean.payment.dao.PaymentDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Payment payment = new Payment();
    PaymentDAO paymentDAO = new PaymentDAO();

    User user = (User)request.getSession().getAttribute("user");
    String id = user.getId();
    int coinNum = Integer.parseInt(request.getParameter("coinNum"));
    int price = 0;


    if(coinNum == 1){
        price = 700;
    } else if (coinNum == 5) {
        price = 3250;
    } else if (coinNum == 10) {
        price = 6250;
    } else if (coinNum == 100) {
        price = 50000;
    }

    payment.setId(id);
    payment.setCoin(coinNum);
    payment.setPrice(price);
    //date는 데이터베이스 NOW() 함수사용

    //영수증 입력
    paymentDAO.paymentCoin(payment);
    //계정 db에 코인 넣기
    paymentDAO.paymentUserCoin(payment);

    user.setStudentToken(paymentDAO.searchUserCoin(payment));
    request.getSession().setAttribute("user",user);

    //결제 창 이동
    response.sendRedirect("payment.jsp");




%>

코인의 개수 <%=coinNum%>
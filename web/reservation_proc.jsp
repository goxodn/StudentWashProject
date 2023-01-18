<%@ page import="com.beakseok.clean.user.User" %>
<%@ page import="com.beakseok.clean.reservation.dao.ReservationDAO" %>
<%@ page import="com.beakseok.clean.payment.dao.PaymentDAO" %>
<%@ page import="com.beakseok.clean.payment.Payment" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

    /*
    CREATE TABLE RESERVATIONMACHINE(
	ID VARCHAR(100) NOT NULL,
	PHONE VARCHAR(100) NOT NULL,
	STUDENTROOMNUM INT NOT NULL,
	RESERVATIONDATE VARCHAR(100) NOT NULL,
	RESERVATIONTIME VARCHAR(100) NOT NULL,
	RESERVATIONMACHINENUM INT NOT NULL,
	RESERVATIONSUCESSTIME DATE NOT NULL
);
    * */
    ReservationDAO reservationDAO = new ReservationDAO();
    //예약 날짜
    PaymentDAO paymentDAO = new PaymentDAO();

    String reservationDate = request.getParameter("reservationDate");
    //예약 시간
    String reservationTime = request.getParameter("reservationTime");
    //세탁기 번호
    String reservationMachineNum = request.getParameter("reservationMachineNum");
    //유저의 정보
    User user = (User) request.getSession().getAttribute("user");
    //유저 아이디
    String id = user.getId();
    //유저 핸드폰 번호
    String phone = user.getPhone();
    //유저의 방 번호
    int studentRoomNum = user.getStudentRoomNum();

    int studentLevelNum = user.getStudentRoomLevel();

    int studentToken = user.getStudentToken();

    // 예약 불가 0 , 예약 가능 1
    int sucess = reservationDAO.reservationInquiry(reservationMachineNum,reservationTime,reservationDate,studentLevelNum);

    //필요한 정보 : 예약하는 날짜, 예약하는 시간 , 예약하는 세탁기 번호 , 유저 id , 유저 핸드폰 번호 , 유저 방 호수
    //예약 시작
    if(sucess == 0 || studentToken == 0 ){
        //예약 불가능 일 경우
        System.out.println("예약이 불가능 합니다");
        response.sendRedirect("reservationMachine.jsp");
    }else{
        Payment payment = new Payment();
        payment.setId(user.getId());
        //예약 하는 경우
        //insert
        reservationDAO.reservation(id,phone,studentRoomNum,reservationDate,reservationTime,reservationMachineNum,studentLevelNum);
        //update
        reservationDAO.reservationUserMinusToken(user.getId());
        //return 으로 studentToken을 받아와 User클래스 안에 setToken 안에 데이터를 넣어준다.
        user.setStudentToken(paymentDAO.searchUserCoin(payment));
        //새로 user클래스에 새로운 데이터를 집어넣었기 때문에 세션도 다시 설정해준다.
        request.getSession().setAttribute("user",user);
        // 유저 클래스에 데이터가 바뀌었고 예약 페이지의 현재 토큰 개수 출력은 user 세션에서 받아와서 출력하는것이기 때문에
        // 새로 user 세션을 새로 설정해준다.
        //예약이 성공 할 경우 콘솔창에 예약 성공이라고 한다.
        System.out.println("예약 성공");
        response.sendRedirect("reservationMachine.jsp");
    }


%>

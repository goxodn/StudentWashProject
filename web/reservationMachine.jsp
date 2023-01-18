<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.beakseok.clean.reservation.dao.ReservationDAO" %>
<%@ page import="com.beakseok.clean.reservation.Reservation" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.beakseok.clean.user.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <title>BU:RE_기숙사 세탁기 예약시스템</title>
</head>
<%
    User user = (User)request.getSession().getAttribute("user");
    ReservationDAO reservationDAO = new ReservationDAO();
    String reservationDate = (String)request.getSession().getAttribute("reservationDate");
    Map<String, Reservation> reservationList =  reservationDAO.reservationMainInquery(reservationDate,user.getStudentRoomLevel());
    int size = reservationList.size();

    //1번 2번 3번 섞여

    //각자 1,2,3 세탁기 분리
    ArrayList<Reservation> firstMachine = new ArrayList<>();
    ArrayList<Reservation> secondMachine = new ArrayList<>();
    ArrayList<Reservation> thirdMachine = new ArrayList<>();

    //Map key , Object
    // 시간 - 세탁기 번호

    for ( String key : reservationList.keySet() ) {
        if (key.substring(3).equals("1")) {
            firstMachine.add(reservationList.get(key));
        }
        if(key.substring(3).equals("2")){
            secondMachine.add(reservationList.get(key));
        }
        if(key.substring(3).equals("3")){
            // key Level 12 - machineNum 3 예약 중
            thirdMachine.add(reservationList.get(key));
        }
    }


    int firstMachineSize = firstMachine.size();
    int secondMachineSize = firstMachine.size();
    int thirdMachineSize = firstMachine.size();
%>

<body>
<div>
    <jsp:include page="header.jsp"></jsp:include>
    <!-- 회원권 -->
    <div class="row mt-4">
        <div id="membership" class="col">
            <p>기숙사 입주기간 /<span class="membership_date"> 2022-08-29 ~ 2022-12-22 (2022-2학기)</span></p>
            <br>
            <p><span class="membership_date">층 : <%=user.getStudentRoomLevel()%> 층</span></p>
            <br>
            <p>COIN : <span class="membership_date"><%=user.getStudentToken()%></span></p>

        </div>
    </div>
    <div class="row mt-4" style="text-align: center">
            <p>
                <form action="reservationSetTime_proc.jsp" method="post">
                    <input type="date" name="reservationDateInput">
                    <input type="submit" value="날짜변경">
                    <br>
                    현재 예약 날짜는 ${reservationDate} 입니다
                    <br>리스트의 사이즈는 <%=size%>입니다
                </form>
            </p>
    </div>

    <!-- 예약취소  -->
    <div id="reservation_cancel" class="row mt-4" style="display: none;">
        <p><span>번</span> / <span></span> ~ <span></span></p>
        <button id="reser_cancel">예약 취소</button>
    </div>

    <!-- 메인 컨텐츠 -->
    <div class="row mt-2">
        <!-- 테이블 색상 가이드 -->
        <div id="reser_color_Info">
            <div class="div_circle bg_white_green"></div>
            <span class="align_text">비어있음</span>
            <div class="div_circle bg_green"></div>
            <span class="align_text"> 예약가능</span>
            <div class="div_circle bg_white_gray"></div>
            <span class="align_text"> 예약불가</span>
        </div>
        <!-- 예약 테이블  -->
        <div id="reser_table">
            <table class="table table-bordered">
                <tbody>
                <tr>
                    <td class="empty td_emptyGreen" id="reservationMachineOne" data-bs-toggle="modal"
                        data-bs-target="#reser_start"><h1>1</h1>
                        <p>비어있음</p>
                    </td>
                    <td class="empty td_emptyGreen" id="reservationMachineTwo" data-bs-toggle="modal"
                        data-bs-target="#reser_start3"><h1>2</h1>
                        <p>비어있음</p></td>
                    <td class="empty td_emptyGreen" id="reservationMachineThree" data-bs-toggle="modal"
                        data-bs-target="#reser_start2"><h1>3</h1>
                        <p>비어있음</p></td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>

    <div>

        1번 세탁기 예약 현황 :
        <c:forEach items="<%=firstMachine%>" var="firstMachineNum">
            <br>${firstMachineNum.toString()}
        </c:forEach>

        <br>
        2번 세탁기 예약 현황 :
        <c:forEach items="<%=secondMachine%>" var="secondMachineNum">
            <br>${secondMachineNum.toString()}
        </c:forEach>

        <br>
        3번 세탁기 예약 현황 :
        <c:forEach items="<%=thirdMachine%>" var="thirdMachineNum">
            <br>${thirdMachineNum.toString()}
        </c:forEach>


    </div>

    <!--세탁기 예약하기 모달 -->
    <div class="modal fade" id="reser_start" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header text-center">
                    <h4 class="modal-title" id="reser_cancelModalLable">
                        <strong><a class="numFseat text-dark" style="text-decoration: none;"></a></strong><strong
                            id="modalReservationMachineNum">3</strong>번 세탁기를 예약합니다.

                        <input type="hidden" id="inputReservationMachineNum">
                        <input type="hidden" id="studentLevel">
                        <input type="hidden" id="studentRoomNum">
                    </h4>
                </div>
                <div class="modal-body text-center">
                    <form action="reservation_proc.jsp" method="post">
                        <input type="hidden" id="reservationMachineNum" name="reservationMachineNum">
                        <input type="hidden" name="reservationDate" value="${reservationDate}">
                        <div>

                            <!-- 예약 시간 -->
                            <h1 style="text-align: left; font-size: 14pt; padding-bottom: 10px;">예약 시간</h1>

                            <div id="emptyModal" style="border: 1px solid black;">
                                <input type="radio" value="10"  class="btn-check" name="reservationTime" id="option1" autocomplete="off" checked>
                                <label class="btn btn-secondary" for="option1">
                                    <%=reservationDAO.searchTime(10,1,firstMachine,secondMachine,thirdMachine)%>
                                </label>
                                <input type="radio" value="11" class="btn-check" name="reservationTime" id="option2" autocomplete="off" checked>
                                <label class="btn btn-secondary" for="option2"><%=reservationDAO.searchTime(11,1,firstMachine,secondMachine,thirdMachine)%></label>
                                <input type="radio" value="12" class="btn-check" name="reservationTime" id="option3" autocomplete="off" checked>
                                <label class="btn btn-secondary" for="option3"><%=reservationDAO.searchTime(12,1,firstMachine,secondMachine,thirdMachine)%></label>
                                <br>
                                <input type="radio" value="13" class="btn-check" name="reservationTime" id="option4" autocomplete="off" checked>
                                <label class="btn btn-secondary" for="option4"><%=reservationDAO.searchTime(13,1,firstMachine,secondMachine,thirdMachine)%></label>
                                <input type="radio" value="14" class="btn-check" name="reservationTime" id="option5" autocomplete="off" checked>
                                <label class="btn btn-secondary" for="option5"><%=reservationDAO.searchTime(14,1,firstMachine,secondMachine,thirdMachine)%></label>
                                <input type="radio" value="15" class="btn-check" name="reservationTime" id="option6" autocomplete="off" checked>
                                <label class="btn btn-secondary" for="option6"><%=reservationDAO.searchTime(15,1,firstMachine,secondMachine,thirdMachine)%></label>
                                <br>
                                <input type="radio" value="16" class="btn-check" name="reservationTime" id="option7" autocomplete="off" checked>
                                <label class="btn btn-secondary" for="option7"><%=reservationDAO.searchTime(16,1,firstMachine,secondMachine,thirdMachine)%></label>
                                <input type="radio" value="17" class="btn-check" name="reservationTime" id="option8" autocomplete="off" checked>
                                <label class="btn btn-secondary" for="option8"><%=reservationDAO.searchTime(17,1,firstMachine,secondMachine,thirdMachine)%></label>
                                <input type="radio" value="18" class="btn-check" name="reservationTime" id="option9" autocomplete="off" checked>
                                <label class="btn btn-secondary" for="option9"><%=reservationDAO.searchTime(18,1,firstMachine,secondMachine,thirdMachine)%></label>
                                <br>
                                <input type="radio" value="19" class="btn-check" name="reservationTime" id="option10" autocomplete="off" checked>
                                <label class="btn btn-secondary" for="option10"><%=reservationDAO.searchTime(19,1,firstMachine,secondMachine,thirdMachine)%></label>
                                <input type="radio" value="20" class="btn-check" name="reservationTime" id="option11" autocomplete="off" checked>
                                <label class="btn btn-secondary" for="option11"><%=reservationDAO.searchTime(20,1,firstMachine,secondMachine,thirdMachine)%></label>
                                <input type="radio" value="21" class="btn-check" name="reservationTime" id="option12" autocomplete="off" checked>
                                <label class="btn btn-secondary" for="option12"><%=reservationDAO.searchTime(21,1,firstMachine,secondMachine,thirdMachine)%></label>
                                <br>
                            </div>

                        </div>

                        <div class="modal-footer text-center">
                            <button id="model_c" type="button" onclick="defaultModal();" class="btn btn-primary"
                                    data-bs-dismiss="modal">닫기
                            </button>
                            <button id="reser_sub" type="submit" class="btn btn-primary" style="margin-left: 40px;">예약
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- 3 세탁기 예약하기 모달 -->
    <div class="modal fade" id="reser_start2" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header text-center">
                    <h4 class="modal-title" id="reser_cancelModalLable">
                        <strong><a class="numFseat text-dark" style="text-decoration: none;"></a></strong><strong
                            >3</strong>번 세탁기를 예약합니다.
                    </h4>
                </div>
                <div class="modal-body text-center">
                    <form action="reservation_proc.jsp" method="post">
                        <input type="hidden" name="reservationMachineNum" value="3">
                        <input type="hidden" name="reservationDate" value="${reservationDate}">
                        <div>

                            <!-- 예약 시간 -->
                            <h1 style="text-align: left; font-size: 14pt; padding-bottom: 10px;">예약 시간</h1>

                            <div id="emptyModal" style="border: 1px solid black;">
                                <input type="radio" value="10"  class="btn-check" name="reservationTime" id="option3-10" autocomplete="off" checked>
                                <label class="btn btn-secondary" for="option3-10">
                                    <%=reservationDAO.searchTime(10,3,firstMachine,secondMachine,thirdMachine)%>
                                </label>
                                <input type="radio" value="11" class="btn-check" name="reservationTime" id="option3-11" autocomplete="off" checked>
                                <label class="btn btn-secondary" for="option3-11">
                                    <%=reservationDAO.searchTime(11,3,firstMachine,secondMachine,thirdMachine)%>
                                </label>
                                <input type="radio" value="12" class="btn-check" name="reservationTime" id="option3-12" autocomplete="off" checked>
                                <label class="btn btn-secondary" for="option3-12">
                                    <%=reservationDAO.searchTime(12,3,firstMachine,secondMachine,thirdMachine)%>
                                </label>
                                <br>
                                <input type="radio" value="13" class="btn-check" name="reservationTime" id="option3-13" autocomplete="off" checked>
                                <label class="btn btn-secondary" for="option3-13">
                                    <%=reservationDAO.searchTime(13,3,firstMachine,secondMachine,thirdMachine)%>
                                </label>
                                <input type="radio" value="14" class="btn-check" name="reservationTime" id="option3-14" autocomplete="off" checked>
                                <label class="btn btn-secondary" for="option3-14">
                                    <%=reservationDAO.searchTime(14,3,firstMachine,secondMachine,thirdMachine)%>
                                </label>
                                <input type="radio" value="15" class="btn-check" name="reservationTime" id="option3-15" autocomplete="off" checked>
                                <label class="btn btn-secondary" for="option3-15">
                                    <%=reservationDAO.searchTime(15,3,firstMachine,secondMachine,thirdMachine)%>
                                </label>
                                <br>
                                <input type="radio" value="16" class="btn-check" name="reservationTime" id="option3-16" autocomplete="off" checked>
                                <label class="btn btn-secondary" for="option3-16">
                                    <%=reservationDAO.searchTime(16,3,firstMachine,secondMachine,thirdMachine)%>
                                </label>
                                <input type="radio" value="17" class="btn-check" name="reservationTime" id="option3-17" autocomplete="off" checked>
                                <label class="btn btn-secondary" for="option3-17">
                                    <%=reservationDAO.searchTime(17,3,firstMachine,secondMachine,thirdMachine)%>
                                </label>
                                <input type="radio" value="18" class="btn-check" name="reservationTime" id="option3-18" autocomplete="off" checked>
                                <label class="btn btn-secondary" for="option3-18">
                                    <%=reservationDAO.searchTime(18,3,firstMachine,secondMachine,thirdMachine)%>
                                </label>
                                <br>
                                <input type="radio" value="19" class="btn-check" name="reservationTime" id="option3-19" autocomplete="off" checked>
                                <label class="btn btn-secondary" for="option3-19">
                                    <%=reservationDAO.searchTime(19,3,firstMachine,secondMachine,thirdMachine)%>
                                </label>
                                <input type="radio" value="20" class="btn-check" name="reservationTime" id="option3-20" autocomplete="off" checked>
                                <label class="btn btn-secondary" for="option3-20">
                                    <%=reservationDAO.searchTime(20,3,firstMachine,secondMachine,thirdMachine)%>
                                </label>
                                <input type="radio" value="21" class="btn-check" name="reservationTime" id="option3-21" autocomplete="off" checked>
                                <label class="btn btn-secondary" for="option3-21">
                                    <%=reservationDAO.searchTime(21,3,firstMachine,secondMachine,thirdMachine)%>
                                </label>
                                <br>
                            </div>

                        </div>

                        <div class="modal-footer text-center">
                            <button id="model_c" type="button" onclick="defaultModal();" class="btn btn-primary"
                                    data-bs-dismiss="modal">닫기
                            </button>
                            <button id="reser_sub" type="submit" class="btn btn-primary" style="margin-left: 40px;">예약
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- 2 세탁기 예약하기 모달 -->
    <div class="modal fade" id="reser_start3" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header text-center">
                    <h4 class="modal-title" id="reser_cancelModalLable">
                        <strong><a class="numFseat text-dark" style="text-decoration: none;"></a></strong><strong
                            >3</strong>번 세탁기를 예약합니다.
                    </h4>
                </div>
                <div class="modal-body text-center">
                    <form action="reservation_proc.jsp" method="post">
                        <input type="hidden" name="reservationMachineNum" value="2">
                        <input type="hidden" name="reservationDate" value="${reservationDate}">
                        <div>

                            <!-- 예약 시간 -->
                            <h1 style="text-align: left; font-size: 14pt; padding-bottom: 10px;">예약 시간</h1>

                            <div id="emptyModal" style="border: 1px solid black;">
                                <input type="radio" value="10"  class="btn-check" name="reservationTime" id="option2-10" autocomplete="off" checked>
                                <label class="btn btn-secondary" for="option2-10">
                                    <%=reservationDAO.searchTime(10,2,firstMachine,secondMachine,thirdMachine)%>
                                </label>
                                <input type="radio" value="11" class="btn-check" name="reservationTime" id="option2-11" autocomplete="off" checked>
                                <label class="btn btn-secondary" for="option2-11">
                                    <%=reservationDAO.searchTime(11,2,firstMachine,secondMachine,thirdMachine)%>
                                </label>
                                <input type="radio" value="12" class="btn-check" name="reservationTime" id="option2-12" autocomplete="off" checked>
                                <label class="btn btn-secondary" for="option2-12">
                                    <%=reservationDAO.searchTime(12,2,firstMachine,secondMachine,thirdMachine)%>
                                </label>
                                <br>
                                <input type="radio" value="13" class="btn-check" name="reservationTime" id="option2-13" autocomplete="off" checked>
                                <label class="btn btn-secondary" for="option2-13">
                                    <%=reservationDAO.searchTime(13,2,firstMachine,secondMachine,thirdMachine)%>
                                </label>
                                <input type="radio" value="14" class="btn-check" name="reservationTime" id="option2-14" autocomplete="off" checked>
                                <label class="btn btn-secondary" for="option2-14">
                                    <%=reservationDAO.searchTime(14,2,firstMachine,secondMachine,thirdMachine)%>
                                </label>
                                <input type="radio" value="15" class="btn-check" name="reservationTime" id="option2-15" autocomplete="off" checked>
                                <label class="btn btn-secondary" for="option2-15">
                                    <%=reservationDAO.searchTime(15,2,firstMachine,secondMachine,thirdMachine)%>
                                </label>
                                <br>
                                <input type="radio" value="16" class="btn-check" name="reservationTime" id="option2-16" autocomplete="off" checked>
                                <label class="btn btn-secondary" for="option2-16">
                                    <%=reservationDAO.searchTime(16,2,firstMachine,secondMachine,thirdMachine)%>
                                </label>
                                <input type="radio" value="17" class="btn-check" name="reservationTime" id="option2-17" autocomplete="off" checked>
                                <label class="btn btn-secondary" for="option2-17">
                                    <%=reservationDAO.searchTime(17,2,firstMachine,secondMachine,thirdMachine)%>
                                </label>
                                <input type="radio" value="18" class="btn-check" name="reservationTime" id="option2-18" autocomplete="off" checked>
                                <label class="btn btn-secondary" for="option2-18">
                                    <%=reservationDAO.searchTime(18,2,firstMachine,secondMachine,thirdMachine)%>
                                </label>
                                <br>
                                <input type="radio" value="19" class="btn-check" name="reservationTime" id="option2-19" autocomplete="off" checked>
                                <label class="btn btn-secondary" for="option2-19">
                                    <%=reservationDAO.searchTime(19,2,firstMachine,secondMachine,thirdMachine)%>
                                </label>
                                <input type="radio" value="20" class="btn-check" name="reservationTime" id="option2-20" autocomplete="off" checked>
                                <label class="btn btn-secondary" for="option2-20">
                                    <%=reservationDAO.searchTime(20,2,firstMachine,secondMachine,thirdMachine)%>
                                </label>
                                <input type="radio" value="21" class="btn-check" name="reservationTime" id="option2-21" autocomplete="off" checked>
                                <label class="btn btn-secondary" for="option2-21">
                                    <%=reservationDAO.searchTime(21,2,firstMachine,secondMachine,thirdMachine)%>
                                </label>
                                <br>
                            </div>

                        </div>

                        <div class="modal-footer text-center">
                            <button id="model_c" type="button" onclick="defaultModal();" class="btn btn-primary"
                                    data-bs-dismiss="modal">닫기
                            </button>
                            <button id="reser_sub" type="submit" class="btn btn-primary" style="margin-left: 40px;">예약
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <br><br>

    </main>

    <!-- 하단메뉴 -->

    <footer>
        <p id="openTime">기숙사 세탁기 이용시간 : <span id="notice"> 09:00 ~ 09:00</span></p>

        <div class="footer-time"><p>2022년 11월 05일<br>PM 18시 27분</p></div>

    </footer>

    <!-- 하단 더미메뉴  -->
    <div id="hidden-footer" class="">

    </div>
</div>


</body>
<!--메인 창에서 세탁기 선택시 modal창에 데이터 넘김-->
<script type="text/javascript">

    document.getElementById("reservationMachineOne").addEventListener("click", function () {
        document.getElementById("modalReservationMachineNum").innerText = "1";
        document.getElementById("inputReservationMachineNum").value = 1;
        document.getElementById("reservationMachineNum").value = 1;
    });
    document.getElementById("reservationMachineTwo").addEventListener("click", function () {
        document.getElementById("modalReservationMachineNum").innerText = "2";
        document.getElementById("inputReservationMachineNum").value = 2;
        document.getElementById("reservationMachineNum").value = 2;
    });
    document.getElementById("reservationMachineThree").addEventListener("click", function () {
        document.getElementById("modalReservationMachineNum").innerText = "3";
        document.getElementById("inputReservationMachineNum").value = 3;
        document.getElementById("reservationMachineNum").value = 3;
    });

    document.getElementById("reservationDate").value = new Date();


</script>


<link rel="stylesheet" href="style/bootstrap.min.css">
<link rel="stylesheet" href="style/member_style.css">
<link rel="stylesheet" href="style/m_main_page.css">
<link rel="icon" type="image/x-icon" href="img/favicon.ico"/>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script src="/resources/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>



</html>

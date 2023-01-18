<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <title>BU:RE-마이페이지</title>
</head>

<body>
<div id="wrap">
    <jsp:include page="header.jsp"></jsp:include>
    <div id="hidden-header" class="mt-2">

    </div>
    <!-- Header-->
    <header class="py-5">
        <div class="container px-lg-5">
            <div class="p-4 p-lg-5 bg-light rounded-3 text-center">
                <div class="m-4 m-lg-5">
                    <h1 class="display-5 fw-bold">BU:RE 마이페이지</h1>
                    <p class="fs-4">BU:RE는 백석대학교 기숙사 학우들을 위한 세탁기 예약프로그램입니다.</p>
                    <a class="btn btn-primary btn-lg" href="reservationMachine.jsp">예약하러 가기</a>
                </div>
            </div>
        </div>
    </header>

    </main>
</div>

<!-- Page Content-->
<section class="pt-4">
    <div class="container px-lg-5">
        <!-- Page Features-->
        <div class="row gx-lg-5">
            <div class="col-lg-6 col-xxl-4 mb-5">
                <div class="card bg-light border-0 h-100">
                    <div class="card-body text-center p-4 p-lg-5 pt-0 pt-lg-0">
                        <div class="feature bg-primary bg-gradient text-white rounded-3 mb-4 mt-n4"><i
                                class="bi bi-collection"></i></div>
                        <h2 class="fs-4 fw-bold">내 세탁기</h2>
                        <p class="mb-0">내가 이용중인 세탁기 현황 확인</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-6 col-xxl-4 mb-5">
                <div class="card bg-light border-0 h-100">
                    <div class="card-body text-center p-4 p-lg-5 pt-0 pt-lg-0">
                        <div class="feature bg-primary bg-gradient text-white rounded-3 mb-4 mt-n4"><i
                                class="bi bi-cloud-download"></i></div>
                        <h2 class="fs-4 fw-bold">세탁 알림</h2>
                        <p class="mb-0">종료 시간 알림</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-6 col-xxl-4 mb-5">
                <div class="card bg-light border-0 h-100">
                    <div class="card-body text-center p-4 p-lg-5 pt-0 pt-lg-0">
                        <div class="feature bg-primary bg-gradient text-white rounded-3 mb-4 mt-n4"><i
                                class="bi bi-card-heading"></i></div>
                        <h2 class="fs-4 fw-bold">정보 수정</h2>
                        <p class="mb-0">내 정보 수정</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-6 col-xxl-4 mb-5">
                <div class="card bg-light border-0 h-100">
                    <div class="card-body text-center p-4 p-lg-5 pt-0 pt-lg-0">
                        <div class="feature bg-primary bg-gradient text-white rounded-3 mb-4 mt-n4"><i
                                class="bi bi-bootstrap"></i></div>
                        <h2 class="fs-4 fw-bold">결제 내역</h2>
                        <p class="mb-0">세탁기 결제 내역 확인</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-6 col-xxl-4 mb-5">
                <div class="card bg-light border-0 h-100">
                    <div class="card-body text-center p-4 p-lg-5 pt-0 pt-lg-0">
                        <div class="feature bg-primary bg-gradient text-white rounded-3 mb-4 mt-n4"><i
                                class="bi bi-code"></i></div>
                        <h2 class="fs-4 fw-bold">이용 내역</h2>
                        <p class="mb-0">세탁기 이용 내역 확인</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-6 col-xxl-4 mb-5">
                <div class="card bg-light border-0 h-100">
                    <div class="card-body text-center p-4 p-lg-5 pt-0 pt-lg-0">

                        <div id="paymentIconBtn" class="feature bg-primary bg-gradient text-white rounded-3 mb-4 mt-n4"><i
                                class="bi bi-patch-check"></i></div>

                        <h2 class="fs-4 fw-bold">결제 수단</h2>
                        <p class="mb-0">결제 수단 확인</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Footer-->
<footer class="py-5 bg-dark">
    <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2022</p></div>
</footer>

</body>

<script>
    document.getElementById("paymentIconBtn").addEventListener("click",function (){
       location.href="payment.jsp";
    });
</script>


<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="js/scripts.js"></script>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="img/favicon.ico"/>
<!-- Bootstrap icons-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet"/>
<!-- Core theme CSS (includes Bootstrap)-->
<link href="style/styles.css" rel="stylesheet"/>
<link href="style/bootstrap.min.css" rel="stylesheet"/>
<link href="style/member_style.css" rel="stylesheet"/>
</html>

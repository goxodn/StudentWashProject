<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <main class="container-fluid">
        <!-- Responsive navbar-->
        <div id="header" class="row">
            <button class="btn btn-secondary " onclick="laundryCheck()"
                    style="position: absolute; top: 12px; left: 20px; width: 100px; font-size: 11px;">세탁기 현황
            </button>
            <button class="btn btn-secondary " onclick="lostboard()" href="./login_BURE/dist/board.html"
                    style="position: absolute; top: 12px; left: 145px; width: 100px; font-size: 11px;">분실물 게시판
            </button>
            <button class="btn btn-secondary"
                    style="position: absolute; top: 12px; left: 265px; width: 100px; font-size: 11px;">마이페이지
            </button>
            <div class="col tap-bar">
                <a class="mt-2 banner" id="LogoBtn" href="main.jsp" style="display: inline; font-size: 30px;">BU:RE</a>
            </div>
            <button class="btn btn-secondary btn-sm" id="myInfo"
                    style="position: absolute; top: 12px; right: 80px; width: 70px; font-size: 11px;">내 정보
            </button>
            <button class="btn btn-danger btn-sm" id="logoutBtn"
                    style="position: absolute; top: 12px; right: 0; width: 70px; font-size: 11px;">로그아웃
            </button>
        </div>
    </main>
</body>

<script>
    document.getElementById("logoutBtn").addEventListener("click",function (){
        location.href="logout_proc.jsp";
    });
    document.getElementById("myInfo").addEventListener("click",function (){
        location.href="myInfo.jsp";
    });
</script>

<!--부트스트랩 link-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
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

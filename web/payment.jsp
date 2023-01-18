<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BU:RE 결제수단</title>
</head>
<body>

<%@include file="header.jsp"%>

    <div style="padding-left: 50px;padding-right: 50px;width: 400px; height: 600px;margin: 0 auto;
    border: 1px solid gray;border-radius: 5px;background-color: white;
    box-shadow: 5px 5px 5px gray;margin-top: 30px;">
        <br>
        <h4>My Coin : ${user.studentToken} </h4>
        <br>
        <h4>BeakSeok 예약 코인 구매</h4>
        <p style="color: gray;font-size: 10px;">더욱 저렴한 가격에 세탁을 즐겨보세요</p>
        <hr>
        <strong>
            이용권 구매
        </strong>
        <form action="payment_proc.jsp" id="payment_form" method="post">
            <input type="hidden" name="coinNum" id="coinNum">
            <input type="hidden" name="coinPrice" id="coinPrice">

            <button type="button" onclick="test(1)" id="oneCoinBtn" class="btn btn-primary" style="width: 100%;height: 50px;margin-top: 30px;">
                <strong>1 COIN</strong> = 700WON
            </button>
            <button type="button" onclick="test(5)" id="fiveCoinBtn" class="btn btn-success" style="width: 100%;height: 50px;margin-top: 30px;">
                <strong>5 COIN</strong> = 3250WON
            </button>
            <button type="button" onclick="test(10)" id="tenCoinBtn" class="btn btn-info" style="width: 100%;height: 50px;margin-top: 30px;">
                <strong>10 COIN</strong> = 6250WON
            </button>
            <button type="button" onclick="test(100)" id="hundredCoinBtn" class="btn btn-danger" style="width: 100%;height: 50px;margin-top: 30px;">
                <strong>100 COIN</strong> = 50000WON
            </button>
        </form>
    </div>


</body>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<link rel="stylesheet" href="style/m_main_page.css">
<script>

    function test(e) {
        if (!confirm(e + " Coin을 구매하시겠습니까?")) {
            alert("구매가 취소됐습니다.");
        } else {
            alert("구매가 완료됐습니다.");
            document.getElementById("coinNum").value = e;
            document.getElementById("payment_form").submit();
        }
    }

</script>

</html>

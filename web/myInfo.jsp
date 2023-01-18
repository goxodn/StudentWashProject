<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>BU:RE 내정보</title>
</head>
<body>

<main class="container-fluid">
    <!-- 상단 메뉴 -->
    <jsp:include page="header.jsp"></jsp:include>
    <!-- 더미 상단 메뉴 -->
    <div id="hidden-header" class="mt-2">

    </div>

    <div class="row" style="margin-top: 71px;">
        <div class="text-center">
            <h2>내 정보</h2>
        </div>
        <table id="seat" class="table table-bordered text-center mt-5" style="margin-left: auto; margin-right: auto; width: 350px; height: 150px;">
            <tbody><tr class="align-middle">
                <td width="30%">이름</td>
                <td id="uesr_name">${user.name}</td>
            </tr>
            <tr class="align-middle">
                <td>전화번호</td>
                <td id="user_phone">${user.phone}</td>
            </tr>
            <tr class="align-middle">
                <td>가입일</td>
                <td id="user_joindate">${user.createUserDate}</td>
            </tr>
            <tr class="align-middle">
                <td>입주 기간</td>
                <td id="practice">2022-08-29 ~ 2022-12-22</td>
            </tr>
            <tr class="align-middle">
                <td>레슨 여부(머하지)</td>
                <td id="use_lesson">신청</td>
            </tr>
            <tr class="align-middle">
                <td>비밀번호</td>
                <td id="user_password">
                    <button type="button" class="chg_pw btn btn-secondary" data-bs-toggle="modal" data-bs-target="#pw_cng">변경</button>
                </td>
            </tr>
            </tbody></table>
    </div>
    <div class="text-center" style="margin-top: 70px;">
        <button onclick="location.replace('member_main.html');" class="btn btn-success">확인</button>
    </div>
    <script>
        data_insert();
    </script>

    <div class="modal fade" id="pw_cng" data-bs-backdrop="static" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header text-center">
                    <h4 class="modal-title" id="reser_cancelModalLable">비밀번호 변경</h4>
                </div>

                <div class="modal-body text-center">
                    <div>
                        <main class="col-xl-10 mt-5" style="margin-left: auto; margin-right: auto;">
                            <form class="mt-5" name="password_change">
                                <table class="text-center table table-bordered" style="margin-left: auto; margin-right: auto; width: 100%; height: 200px;">
                                    <tbody><tr class="align-middle">
                                        <td>현재 비밀번호</td>
                                        <td width="60%"><input type="text" class="form-control now_password" autocomplete="off" name="now_password"></td>
                                    </tr>
                                    <tr class="align-middle">
                                        <td>새 비밀번호</td>
                                        <td><input type="text" class="form-control new_password" oninput="autoHyphen(this)" maxlength="13" autocomplete="off" name="new_password"></td>
                                    </tr>
                                    <tr class="align-middle">
                                        <td>비밀번호 확인</td>
                                        <td><input type="text" class="form-control chk_password" oninput="autoHyphen(this)" maxlength="13" autocomplete="off" name="chk_password"></td>
                                    </tr>
                                    </tbody></table>
                                <!-- <div class="mb-4" style="width: 400px; margin-left: auto; margin-right: auto;">
                                      <label for="formGroupExampleInput2" class="form-label">비밀번호</label>
                                      <input type="text" class="form-control" id="formGroupExampleInput2" placeholder="비밀번호">
                                </div> -->

                                <div class="col text-center mt-5">
                                    <button id="model_c" type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                                    <button type="button" class="btn btn-success md_suc" style="margin-left: 40px;" id="pw_sub" data-bs-toggle="modal">변경</button>
                                </div>
                            </form>
                        </main>
                    </div>
                </div>

            </div>
        </div>
    </div>
</main>


</body>
<link rel="stylesheet" href="style/bootstrap.min.css">
<link rel="stylesheet" href="style/member_style.css">
<link rel="icon" type="image/x-icon" href="img/favicon.ico" />
<script src="/resources/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script type="text/javascript">
    var get_pw;

    $(function() {

        $(".chg_pw").click(function() {

            $.ajax({
                url: "/get_pw",
                method: "POST",
                dataType: 'json',
                async: false,
                success: function(result) {
                    //alert("sc " + result.password);
                    get_pw = result.password;

                }
            });


        });

        $("#pw_sub").click(function() {

            now_pw = $(".now_password").val();
            now_pw_l = now_pw.length;
            change_pw = $(".new_password").val();
            change_pw_l = change_pw.length;
            chk_pw = $(".chk_password").val();
            chk_pw_l = chk_pw.length;

            if(now_pw_l < 1){
                alert("현재 비밀번호를 입력하세요.");
                return false;
            } else if(now_pw != get_pw){
                alert("비밀번호가 다릅니다.");
                return false;
            } else if(change_pw_l == 0){
                alert("새 비밀번호를 입력하세요.");
            } else if(change_pw == now_pw){
                alert("이전 비밀번호를 입력하셨습니다.");
            } else if(chk_pw_l == 0){
                alert("확인 비밀번호를 입력하세요.");
            } else if(chk_pw != change_pw){
                alert("확인 비밀번호를 다시 입력하세요.");
            } else {
                $.ajax({
                    url:'/change_password',
                    method:'POST',
                    data: {
                        chg_pw: change_pw
                    },
                    dataType: 'json',
                    success: function(result) { // ajax에서 success는 정상적으로 완료되었을 때, 실행된다. 현재 소스 코드는 json 형식으로 return 받지 못해 success가 되지 않는다.
                        alert("비밀번호가 변경되었습니다.");
                    }
                });
            }


        });

    })


    function chkPw() {


    }
</script>
</html>

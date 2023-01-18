<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h2>회원가입</h2>
    <table style="width: 800px;">
        <form action="createUser_proc.jsp" method="post">
            <tr>
                <td>학번</td>
                <td><input class="form-control" type="text" name="id"></td>
            </tr>
            <tr>
                <td>비밀번호</td>
                <td><input class="form-control" type="password" name="password"></td>
            </tr>
            <tr>
                <td>이름</td>
                <td><input class="form-control" type="text" name="name"></td>
            </tr>
            <tr>
                <td>휴대폰 번호</td>
                <td><input class="form-control" type="text" name="phone"></td>
            </tr>
            <tr>
                <td>주소</td>
                <td>
                    <input class="form-control"  type="text" id="sample6_postcode" placeholder="우편번호">
                    <input class="form-control" style="color: white;background-color: #0a53be;" type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
                    <input class="form-control" name="address" type="text" id="sample6_address" placeholder="주소"><br>
                    <input class="form-control" name="addressDetail" type="text" id="sample6_detailAddress" placeholder="상세주소">
                    <input class="form-control" name="addressSubDetail" type="text" id="sample6_extraAddress" placeholder="참고항목">
                </td>
            </tr>
            <tr>
                <td>층</td>
                <td>
                    <select name="studentRoomLevel" class="form-select form-select-lg mb-3" aria-label=".form-select-lg example">
                        <option selected>Open this select Level</option>
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                        <option value="6">6</option>
                        <option value="7">7</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>호실</td>
                <td><input class="form-control" type="text" name="studentRoomNum"></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" class="btn btn-primary" value="회원가입" style="width: 100%"></td>
            </tr>
        </form>
    </table>
</body>

<style>
</style>

<!--부트스트랩 link-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">

<!--다음 주소 api -->

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;

                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
</html>

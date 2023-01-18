<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<table>
    <form action="login_proc.jsp" method="post">
        <tr>
            <td>아이디</td>
            <td><input type="text" name="id"></td>
        </tr>
        <tr>
            <td>비밀번호</td>
            <td><input type="text" name="password"></td>
        </tr>
        <tr>
            <td colspan="2"><input class="btn btn-primary" type="submit" value="로그인" style="width: 100%;"></td>
        </tr>
        <tr>
            <td colspan="2"><input class="btn btn-secondary" id="createBtn" type="button" style="width: 100%" value="회원가입"></td>
        </tr>
    </form>
</table>

</body>
<script>
    document.getElementById("createBtn").addEventListener("click",function (){
       location.href="createUser.jsp";
    });
</script>
<!--부트스트랩 link-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">

</html>

<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("EUC-KR"); %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="euc-kr" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="uinfo" content="" />
    <title>로그인</title>
    //<link href="css/styles.css" rel="stylesheet" />
	<link href="css/loginstyle.css" rel="stylesheet" />
    <link rel="icon" type="image/x-icon" href="zz/bure.png" />
    <script data-search-pseudo-elements defer src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/js/all.min.js" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.28.0/feather.min.js" crossorigin="anonymous"></script>
</head>

<body class="bg-primary">
    <div id="layoutAuthentication">
        <div id="layoutAuthentication_content">
            <main>
                <div class="container-xl px-4">
                    <div class="row justify-content-center">
                        <div class="col-lg-5">
                            <div class="card shadow-lg border-0 rounded-lg mt-5">
                                <div class="card-header justify-content-center"><h3 class="fw-600 my-3">로그인</h3></div>
                                <div class="card-body">
                                    <form action="logincheck.jsp" method="POST">
                                        <div class="mb-3">
                                            <label class="small mb-1" for="userid">아이디</label>
                                            <input class="form-control" id="userid" name="userid" type="text" placeholder="아이디를 입력하세요." />
                                        </div>
                                        <div class="mb-3">
                                            <label class="small mb-1" for="userpwd">비밀번호</label>
                                            <input class="form-control" id="userpwd" name="userpwd" type="password" placeholder="비밀번호를 입력하세요." />
                                        </div>
                                            <button type="submit" class="btn btn-primary" style="float: right;">완료</button>
                                    </form>
                                </div>
                                <div class="card-footer text-center">
                                    <div class="small"><a href="register.jsp">회원가입</a></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </main>

        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="js/scripts.js"></script>
</body>
</html>

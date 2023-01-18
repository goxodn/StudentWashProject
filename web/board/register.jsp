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
    <title>ȸ������</title>
    <link href="css/styles.css" rel="stylesheet" />
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
                            <div class="col-lg-7">

                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header justify-content-center"><h3 class="fw-600 my-3">ȸ������</h3></div>
                                    <div class="card-body">
                                        <form method="post" action="user_insert.jsp" onsubmit="return sendit();" name="joinForm">
                                            <div class="mb-3">
                                                <label class="small mb-1" for="userid">���̵�</label>
                                                <input class="form-control" id="userid" name="userid" type="text" placeholder="���̵� �Է��ϼ���." onclick="idCheck()" readonly/>
                                            </div>
                                            <div class="row gx-3">
                                                <div class="col-md-6">
                                                    <div class="mb-3">
                                                        <label class="small mb-1" for="pwd">��й�ȣ</label>
                                                        <input class="form-control" id="pwd" name="pwd" type="password" placeholder="��й�ȣ�� �Է��ϼ���." />
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="mb-3">
                                                        <label class="small mb-1" for="userpwd">��й�ȣ Ȯ��</label>
                                                        <input class="form-control" id="userpwd" name="userpwd" type="password" placeholder="��й�ȣ�� Ȯ���ϼ���." />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="mb-3">
                                                <label class="small mb-1" for="username">�̸�</label>
                                                <input class="form-control" id="username" name="username" type="text" placeholder="�̸��� �Է��ϼ���." />
                                            </div>
                                            <div class="mb-3">
                                                <label class="small mb-1" for="useremail">�̸���</label>
                                                <input class="form-control" id="useremail" name="useremail" type="email" placeholder="�̸����� �Է��ϼ���." />
                                            </div>
											<div class="mb-3">
                                                <label class="small mb-1" for="usernum">�й�</label>
                                                <input class="form-control" id="usernum" name="usernum" type="text" placeholder="�й��� �Է��ϼ���." />
                                            </div>
											<div class="mb-3">
                                                <label class="small mb-1" for="userphone">�޴�����ȣ</label>
                                                <input class="form-control" id="userphone" name="userphone" type="text" placeholder="�޴�����ȣ�� �Է��ϼ���." />
                                            </div>

                                            <button type="submit" class="btn btn-primary btn-block" style="float: right;">�Ϸ�</button>
                                        </form>
                                    </div>
                                    <div class="card-footer text-center">
                                        <div class="small"><a href="index.jsp">�α���</a></div>
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
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script src="js/register_check.js"></script>
        <script>
            function idCheck() {
                window.open("idCheckForm.jsp", "idwin", "width=600, height=500");
            }
        </script>
    </body>
</html>
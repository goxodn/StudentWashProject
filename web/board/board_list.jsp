<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%@ page import="java.sql.*" %>
<%@ include file="config.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<% request.setCharacterEncoding("EUC-KR"); %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="euc-kr" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="uinfo" content="" />
    <title>게시판</title>
    <link href="css/styles.css" rel="stylesheet" />
	<link rel="icon" type="image/x-icon" href="zz/bure.png" />
    <script data-search-pseudo-elements defer src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/js/all.min.js" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.28.0/feather.min.js" crossorigin="anonymous"></script>
</head>

<body class="nav-fixed">
<%
    Connection con = null;
    PreparedStatement pstmt = null;
	String sql;

	sql = "select * from uinfo a inner join board3 b on a.id = b.id order by b.boardid desc";

    int rowCount = 1;
    try {
		Class.forName(driverName);
		con = DriverManager.getConnection(dbURL, dbID, dbPW);
		pstmt = con.prepareStatement(sql);

        ResultSet result = pstmt.executeQuery();
%>

    <%@ include file="topbar.jsp" %>
    <div id="layoutSidenav">
    <%@ include file="sidebar.jsp" %>

        <div id="layoutSidenav_content">
            <main>
                <header class="page-header page-header-compact page-header-light border-bottom bg-white mb-4">
                    <div class="container-xl px-4">
                        <div class="page-header-content">
                            <div class="row align-items-center justify-content-between pt-3">
                                <div class="col-auto mb-3">
                                    <h1 class="page-header-title fw-600">
                                        <div class="page-header-icon"><i data-feather="list"></i></div>
                                        게시판 목록
                                    </h1>
                                </div>
                                <div class="col-12 col-xl-auto mb-3">
                                    <a class="btn btn-sm btn-light text-primary" href="board_sheet.jsp">
                                        <i class="me-1" data-feather="folder-plus"></i>
                                        글 등록
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </header>

                <div class="container-xl px-4">
                    <div class="card mb-4">
                        <div class="card-header text-center fw-600 text-black">게시판</div>
                        <div class="card-body">
                            <table id="datatablesSimple">
                                <thead>
                                    <tr>
                                        <th class="text-center">순번</th>
                                        <th class="text-center">등록일</th>
                                        <th class="text-center">제목</th>
                                        <th class="text-center">작성자</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        while (result.next()) {
                                    %>
                                    <tr>
                                        <td class="text-center"><%= rowCount %></td>
                                        <td class="text-center"><%= result.getDate("regdate") %></td>
                                        <td class="text-center"><a href="board_detail.jsp?pno=<%= result.getString("boardid") %>"><%= result.getString("title") %><span class="badge-green">상세</span></a></td>
                                        <td class="text-center"><%= result.getString("a.userid") %></td>
                                    </tr>
                                    <%
										rowCount++;
										}
										result.close();
                                        }
                                        catch (Exception e) {
                                            out.println("[board3] 테이블 조회에 문제가 있습니다. <hr>");
                                            out.println(e.toString());
                                            e.printStackTrace();
                                        }
                                        finally {
                                            if (pstmt != null) pstmt.close();
                                            if (con != null) con.close();
                                        }
									    %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

            </main>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
    <script src="js/datatables/datatables-simple-demo.js"></script>
    <script src="js/scripts.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-1.11.2.min.js"></script>

</body>
</html>

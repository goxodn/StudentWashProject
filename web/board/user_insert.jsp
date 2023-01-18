<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("EUC-KR"); %>
<%@ include file="config.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="EUC-KR" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="uinfo" content="" />
    <title>회원가입</title>
    <link href="css/styles.css" rel="stylesheet" />
</head>

<body class="text-center">

<%
    Connection con = null;
    PreparedStatement pstmt = null;
	Statement stmt = null;
    StringBuffer SQL = new StringBuffer("insert into uinfo(userid, userpwd, username, useremail, usernum, userphone)"); 
    SQL.append("values (?, ?, ?, ?, ?, ?)");

    try {
		String encoding    = "EUC-KR";
		String username    = request.getParameter("username");

		Class.forName(driverName);
        con = DriverManager.getConnection(dbURL, dbID, dbPW);

        pstmt = con.prepareStatement(SQL.toString());
        //삽입할 레코드 데이터 입력
        pstmt.setString(1, request.getParameter("userid"));
        pstmt.setString(2, request.getParameter("userpwd"));
        pstmt.setString(3, request.getParameter("username"));
        pstmt.setString(4, request.getParameter("useremail"));
		pstmt.setString(5, request.getParameter("usernum"));
		pstmt.setString(6, request.getParameter("userphone"));

        int rowCount = pstmt.executeUpdate();        
        if (rowCount == 1) out.println("회원가입이 완료 되었습니다.");
        else out.println("레코드 삽입에 문제가 있습니다.");
        
        //다시 조회
        stmt = con.createStatement();
    }
    catch (Exception e) {
    	out.println("데이터베이스 조회에 문제가 있습니다.");
        out.println(e.toString());
        e.printStackTrace();
    }
    finally {
        if (pstmt != null) pstmt.close();
        if (con != null) con.close();
    }
	out.println("<meta http-equiv='Refresh' content='1;URL=index.jsp'>");
%>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
</body>
</html>

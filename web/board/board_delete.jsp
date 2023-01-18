<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("euc-kr"); %>
<%@ include file="config.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="EUC-KR" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="uinfo" content="" />
    <title>게시글 삭제</title>
    <link href="css/styles.css" rel="stylesheet" />
</head>

<body class="text-center">
<%
    Connection con = null;
    PreparedStatement pstmt = null;
	Statement stmt = null;
    StringBuffer SQL = new StringBuffer("delete from board3 "); 
    SQL.append("where boardid = ?");
    
	String pno = request.getParameter("id");

    try {
		Class.forName(driverName);
        con = DriverManager.getConnection(dbURL, dbID, dbPW);

        pstmt = con.prepareStatement(SQL.toString());
        pstmt.setString(1, pno);

        int rowCount = pstmt.executeUpdate();        
        stmt = con.createStatement();

    }
    catch (Exception e) {
    	out.println("업체 정보 삭제에 문제가 있습니다.");
        out.println(e.toString());
        e.printStackTrace();
    }
    finally {
        if (pstmt != null) pstmt.close();
        if (con != null) con.close();
    }
	out.println("<meta http-equiv='Refresh' content='1;URL=board_list.jsp'>");
%>

</body>
</html>
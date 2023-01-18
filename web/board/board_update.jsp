<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "com.oreilly.servlet.MultipartRequest" %>
<%@ page import = "com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.io.*" %>

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
    <title>게시글 수정</title>
    <link href="css/styles.css" rel="stylesheet" />
</head>

<body class="text-center">
<%
    Connection con = null;
    PreparedStatement pstmt = null;
	Statement stmt = null;
    StringBuffer SQL = new StringBuffer("update board3 set title = ?, content = ?, tfile = ? where boardid = ?"); 

	try {
		String encoding    = "euc-kr";
		int sizeLimit = 10 * 1024 * 1024; 
		String relativeDirectory = "kk/";
		ServletContext context = getServletContext();
		String realDirectory = context.getRealPath(relativeDirectory);
		MultipartRequest multi = new MultipartRequest(request, realDirectory, sizeLimit, encoding, new DefaultFileRenamePolicy());
	
		String my_image = multi.getFilesystemName("my_image");
	
		Class.forName(driverName);
		con = DriverManager.getConnection(dbURL, dbID, dbPW);

        pstmt = con.prepareStatement(SQL.toString());

        pstmt.setString(1, multi.getParameter("title"));
        pstmt.setString(2, multi.getParameter("content"));
		pstmt.setString(3, multi.getFilesystemName("my_image"));
		int pno = Integer.parseInt(multi.getParameter("pno"));
		pstmt.setInt(4, pno);

		//out.println(pstmt.toString());
        pstmt.executeUpdate();


    }
    catch (Exception e) {
    	out.println("데이터베이스 조회에 문제가 있습니다. <hr>");
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
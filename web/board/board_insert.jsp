<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>

<%@ page import = "com.oreilly.servlet.MultipartRequest" %>
<%@ page import = "com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.io.*" %>

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
    <title>게시글 등록</title>
    <link href="css/styles.css" rel="stylesheet" />
</head>

<body class="text-center">
<%
    Connection con = null;
    PreparedStatement pstmt = null;
	Statement stmt = null;
    StringBuffer SQL = new StringBuffer("insert into board3(id, title, content, tfile, regdate) "); 
    SQL.append("values (?, ?, ?, ?, now())");
	
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

        int id = (Integer)session.getAttribute("id");
        pstmt.setInt(1, (id));
        pstmt.setString(2, multi.getParameter("title"));
        pstmt.setString(3, multi.getParameter("content"));
		pstmt.setString(4, multi.getFilesystemName("my_image"));
		

		//out.println(pstmt.toString());
        int rowCount = pstmt.executeUpdate();        
        if (rowCount == 1) out.println("게시글이 등록 되었습니다.");
        else out.println("레코드 삽입에 문제가 있습니다.");
		
        //다시 조회
        stmt = con.createStatement();

    }
    catch (Exception e) {
    	out.println("데이터베이스 처리에 문제가 있습니다.");
        out.println(e.toString());
        e.printStackTrace();
    }
    finally {
        if (pstmt != null) pstmt.close();
        if (con != null) con.close();
    }
	out.println("<meta http-equiv='Refresh' content='1;URL=board_list.jsp'>");
%>
       
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="js/scripts.js"></script>

</body>
</html>

<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("EUC-KR"); %>

<%


	Connection con = null;
	PreparedStatement pstmt = null;
	Statement stmt = null;

    StringBuffer SQL = new StringBuffer("SELECT * FROM uinfo WHERE userid = ? and userpwd = ?");

	int id = 0;
	String userid = null;
	String userpwd = null;
	String username = null;
	String useremail = null;
	String usernum = null;
	String userphone = null;

	String driverName = "org.gjt.mm.mysql.Driver";
	String dbURL = "jdbc:mysql://58.232.79.151:3306/mysql24";

	try {
		String encoding    = "EUC-KR";
		//String username    = request.getParameter("username");

		Class.forName(driverName);
        con = DriverManager.getConnection(dbURL, "root", "kbc0924");

		pstmt = con.prepareStatement(SQL.toString());
		pstmt.setString(1, request.getParameter("userid"));
		pstmt.setString(2, request.getParameter("userpwd"));

		//out.println(pstmt.toString());
		ResultSet result = pstmt.executeQuery();

		if (result.next())
		{
			id = result.getInt("id");
			userid = result.getString("userid");
			userpwd = result.getString("userpwd");
			username = result.getString("username");
			useremail = result.getString("useremail");
			usernum = result.getString("usernum");
			userphone = result.getString("userphone");

			session.setAttribute("member", "ok");

			session.setAttribute("id", id);
			session.setAttribute("userid", userid);
			session.setAttribute("userpwd", userpwd);
			session.setAttribute("username", username);
			session.setAttribute("useremail", useremail);
			session.setAttribute("usernum", usernum);
			session.setAttribute("userphone", userphone);
%>
            <script>
				location.href="board_list.jsp";
			</script>
<%
		}
		else
		{
%>
			<script>
				alert("Login failed");
				location.href="index.jsp";
			</script>
<%
		}
	} catch (Exception e) {
		// TODO: handle exception
		System.out.println(e.getMessage());
	}
	finally {
		if (pstmt != null) pstmt.close();
		if (con != null) con.close();
	}
%>
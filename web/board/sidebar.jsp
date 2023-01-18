<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("EUC-KR"); %>

<!-- Sidebar -->
<div id="layoutSidenav_nav">
    <nav class="sidenav shadow-right sidenav-light">
        <div class="sidenav-menu">
            <div class="nav accordion" id="accordionSidenav">
                          
                <div class="sidenav-menu-heading">게시판 관리</div>
                    <a class="nav-link" href="board_sheet.jsp">
                        <div class="nav-link-icon"><i data-feather="edit-3"></i></div>
                        글 등록
                    </a>
                    <a class="nav-link" href="board_list.jsp">
                        <div class="nav-link-icon"><i data-feather="list"></i></div>
                        게시판 목록
                    </a>
            </div>
        </div>
    </nav>
</div>
 <!-- End of Sidebar-->

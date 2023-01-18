<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>

<nav class="topnav navbar navbar-expand shadow justify-content-between justify-content-sm-start navbar-light bg-white" id="sidenavAccordion">
    <button class="btn btn-icon btn-transparent-dark order-1 order-lg-0 me-2 ms-lg-2 me-lg-0" id="sidebarToggle"><i data-feather="menu"></i></button>
        <a class="navbar-brand pe-3 ps-4 ps-lg-2" href="board_list.jsp">BOARD</a>

            <ul class="navbar-nav align-items-center ms-auto">
                <li class="nav-item dropdown no-caret dropdown-user me-3 me-lg-4">
                    <% 
                        String username = (String)session.getAttribute("username");
                        if(username == null || username.equals("")) {
                            out.println("�α����� �ʿ��մϴ�.");
                        } else {
                            out.println((String)session.getAttribute("username"));
                        }
                    %>

                    <a class="btn btn-icon btn-transparent-dark dropdown-toggle" id="navbarDropdownUserImage" href="javascript:void(0);" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i data-feather="user"></i></a>
                    <div class="dropdown-menu dropdown-menu-end border-0 shadow animated--fade-in-up" aria-labelledby="navbarDropdownUserImage">
                        <h6 class="dropdown-header d-flex align-items-center">
                        
                        <% if(username != null) { %>                            
                            <div class="dropdown-user-details">
                                <div class="dropdown-user-details-name"><%= (String)session.getAttribute("username")%> ��</div>
                            </div>
                        </h6>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="logout.jsp">
                            <div class="dropdown-item-icon"><i data-feather="log-out"></i></div>
                            �α׾ƿ�
                        </a>

                        <% } else { %>                            
                            <div class="dropdown-user-details">
                                <div class="dropdown-user-details-name">�α����� �ʿ��մϴ�.</div>
                            </div>
                        </h6>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="index.jsp">
                            <div class="dropdown-item-icon"><i data-feather="log-in"></i></div>
                            �α���
                        </a>
                        <% } %>

					</div>
                </li>
            </ul>
</nav>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model1.AdminTO" %>
<%@ page import="java.util.ArrayList" %>
<%
	ArrayList<AdminTO> boardLists = (ArrayList)request.getAttribute( "boardLists" );

	int totalRecord = boardLists.size();
	
	StringBuffer sbHtml = new StringBuffer();
	
	for( AdminTO to : boardLists ) {
		String id = to.getID();
		String nickname = to.getNickname();
		String name = to.getName();
		String birth = to.getBirth();
		String email = to.getEmail();
		String address = to.getAddress();
		String gender = to.getGender();
		String date = to.getDate();

		if ( gender.equals( "M" ) ) {
			gender = "남자";
		} else {
			gender = "여자";
		}
		
		sbHtml.append( "<tr>" );
		sbHtml.append( "<td>" + id +"</td>" );
		sbHtml.append( "<td>" + nickname + "</td>" );
		sbHtml.append( "<td>" + name + "</td>" );
		sbHtml.append( "<td>" + birth + "</td>" );
		sbHtml.append( "<td>" + gender + "</td>" );
		sbHtml.append( "<td>" + date + "</td>" );
		sbHtml.append( "<td align='center' > <a href='./userview.do?ID=" + id + "'  target='_blank'> 자세히 보기</a> </td>" );

		
		//버튼 활성화 안됨
		//sbHtml.append( " <td align ='center' > " );
		//sbHtml.append( " <button onclick='window.open('./userview.do?ID=12341234','window_name','width=790,height=850,location=no,status=no,scrollbars=no');'>자세히 보기</button> " );
		//sbHtml.append( " </td> " );
		//sbHtml.append( "<td> <button onclick='window.open('./userview.do?ID=12341234','window_name','width=790,height=850,location=no,status=no,scrollbars=no');'>자세히 보기</button> </td>" );

		sbHtml.append( "</tr> " );
    

	}
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>COVID-19 Admin</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="css/styles2.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
    </head>
    <body class="sb-nav-fixed">
        <%
	    	Object admin_id = session.getAttribute("admin_id");
	        if (admin_id == null) {
	        	out.println( "<script type='text/javascript'>" );
	            out.println( "alert('접속 권한이 없는 페이지입니다. 로그인 후 다시 시도해주세요.');" );
	            out.println( "location.href='./loginController?action=main';" );
	            out.println( "</script>" );
	        } else {
        %>
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="index.do">Main</a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <!-- Navbar Search-->
            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
                <div class="input-group">
                	<font color="white"><%=admin_id %>님</font> &nbsp;&nbsp;
                </div>
            </form>
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                	<a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <!-- <li><a class="dropdown-item" href="#!">Login</a></li> -->
                        <!-- <li><hr class="dropdown-divider" /></li> -->
                        <!-- <li><a class="dropdown-item" href="#!">Logout</a></li> -->
                        <li><a class="dropdown-item" href="./loginController?action=logout">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <%
        	}
        %>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            
                            <div class="sb-sidenav-menu-heading"></div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                기본 설정
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="aadmin.do">관리자 설정</a>
                                </nav>
                            </div>
                                   
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts1" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                                회원 관리
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts1" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="users.do">회원 목록</a>
                                </nav>
                            </div>

                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
                                <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                                게시판 관리
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                    <a class="nav-link" href="board.do">게시글 관리</a>
                                    
                                </nav>
                            </div>
                        </div>
                    </div>       
                </nav>
            </div>
           
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4"></h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active"></li>
                        </ol>
                        
                        
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                회원 목록
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr bgcolor="#A9A9A9" >
                                            <th>아이디</th>
                                            <th>닉네임</th>
                                            <th>이름</th>
                                            <th>생년월일</th>
                                            <th>성별</th>
                                            <th>생성일</th>
                                            <th>기능</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr  align="center" >
                                            <th>아이디</th>
                                            <th>닉네임</th>
                                            <th>이름</th>
                                            <th>생년월일</th>
                                            <th>성별</th>
                                            <th>생성일</th>
                                            <th>기능</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <%=sbHtml %>                               
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </main>
                <footer class="py-4 bg-light mt-auto">

                </footer>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/chart-area-demo.js"></script>
        <script src="assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="js/datatables-simple-demo.js"></script>
    </body>
</html>


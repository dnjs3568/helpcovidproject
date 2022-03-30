<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="model1.AdminTO" %>
<%@ page import="java.util.ArrayList" %>

<!-- 최근 가입 회원 -->
<%
	ArrayList<AdminTO> boardLists2 = (ArrayList)request.getAttribute( "boardLists2" );

	int totalRecord2 = boardLists2.size();	
	
	StringBuffer sbHtml = new StringBuffer();
	
	for( AdminTO to : boardLists2 ) {
		String id = to.getID();
		String nickname = to.getNickname();
		String name = to.getName();
		String birth = to.getBirth();
		String date = to.getDate();

		sbHtml.append( "<tr align ='center' >" );
		sbHtml.append( "<td class='lt'>" + id +"</td>" );
		sbHtml.append( "<td>" + nickname + "</td>" );
		sbHtml.append( "<td>" + name + "</td>" );
		sbHtml.append( "<td>" + birth + "</td>" );
		sbHtml.append( "<td>" + date + "</td>" );
		sbHtml.append( "</tr> " );
    

	}
%>

<!-- 최근 게시글 -->
<%
	ArrayList<AdminTO> boardLists4 = (ArrayList)request.getAttribute( "boardLists4" );
	
	int totalRecord4 = boardLists4.size();	
	
	StringBuffer sbHtml1 = new StringBuffer();
	
	for( AdminTO to : boardLists4 ) {
		String seq = to.getSeq();
		String subject = to.getSubject();
		String id = to.getID();
		String date = to.getWdate();
		String category = to.getCategory();

		if ( category.equals( "0" ) ) {
			category = "[자유]";
		} else {
			category = "[확진자 / 자가 격리]";
		}
		
		String category1 = "0";
		if ( category.equals( "[자유]" ) ) {
			category1 = "view";
		} else {
			category1 = "view1";
		}
		
		sbHtml1.append( "<tr align ='center' >" );
		sbHtml1.append( "<td>" + category + "</td>" );
		sbHtml1.append( "<td class='lt'>" );
		sbHtml1.append( "<a href='./ComBoardController?action=" + category1 + "&seq=" + seq + "'>" + subject + "</a>");
		sbHtml1.append( "</td>" );
		sbHtml1.append( "<td>" + id + "</td>" );
		sbHtml1.append( "<td>" + date + "</td>" );	
		sbHtml1.append( "</tr> " );
	}
%>

<%
	ArrayList<AdminTO> boardLists5 = (ArrayList)request.getAttribute( "boardLists5" );
	
	int totalRecord5 = boardLists5.size();	
	
	StringBuffer sbHtml2 = new StringBuffer();
	StringBuffer sbHtml3 = new StringBuffer();

	for( AdminTO to : boardLists5 ) {
		String hdate = to.getHdate();
		int hhit = to.getHhit();

		sbHtml2.append( hdate );
		sbHtml3.append( hhit );
		sbHtml3.append( "명" );
	}
	
%>

<%
	ArrayList<AdminTO> boardLists6 = (ArrayList)request.getAttribute( "boardLists6" );
	
	int totalRecord6 = boardLists6.size();	
	
	StringBuffer sbHtml4 = new StringBuffer();
	StringBuffer sbHtml5 = new StringBuffer();

	for( AdminTO to : boardLists6 ) {
		String day = to.getDay();
		String bcount = to.getBcount();

		sbHtml4.append( day );
		sbHtml5.append( bcount );
		sbHtml5.append( "명" );


	}
	
%>

<%
	AdminTO to = (AdminTO)request.getAttribute( "to" );	
	String tbcount = to.getTbcount();
	if( tbcount == null || tbcount == "" ) {
		tbcount = "0";
		}
%>

<%
	AdminTO to1 = (AdminTO)request.getAttribute( "to1" );	
	String tccount = to1.getTccount();
	if( tccount == null || tccount == "" ) {
		tccount = "0";
		}
%>

<%
	AdminTO to2 = (AdminTO)request.getAttribute( "to2" );	
	String ttccount = to2.getTtccount();
	if( ttccount == null || ttccount == "" ) {
		ttccount = "0";
		}
%>

<%
	AdminTO to3 = (AdminTO)request.getAttribute( "to3" );	
	String ttbcount = to3.getTtbcount();
	if( ttbcount == null || ttbcount == "" ) {
		ttbcount = "0";
		}
%>

<%
	AdminTO to4 = (AdminTO)request.getAttribute( "to4" );	
	String ttucount = to4.getTtucount();
	if( ttucount == null || ttucount == "" ) {
		ttucount = "0";
		}
%>

<%
	AdminTO to5 = (AdminTO)request.getAttribute( "to5" );	
	String tucount = to5.getTucount();
	if( tucount == null || tucount == "" ) {
		tucount = "0";
		}
%>

<!DOCTYPE html>
<html>
    <head>
        <title>COVID-19 Admin</title> 
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="css/styles.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
    	<script src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
		<script src="http://code.highcharts.com/highcharts.js"></script>

<script type="text/javascript">

	const str1 = "<%=sbHtml2%>";
	
	const arr1 = str1.split( "일" , 5);
	
	const tmp = arr1[4];
	arr1[4] = arr1[0];
	arr1[0] = tmp
	
	const tmp1 = arr1[3];
	arr1[3] = arr1[1];
	arr1[1] = tmp1
	/////////////
	const str2 = "<%=sbHtml3%>";
	const arr2 = str2.split("명", 5 );
	
	const tmp2 = arr2[4];
	arr2[4] = arr2[0];
	arr2[0] = tmp2
	
	const tmp3 = arr2[3];
	arr2[3] = arr2[1];
	arr2[1] = tmp3

	const array1 = arr2;

	const map1 = array1.map(x => x * 1);


/////////////////

const str3 = "<%=sbHtml4%>";
const arr3 = str3.split("일", 5 );

const tmp4 = arr3[4];
arr3[4] = arr3[0];
arr3[0] = tmp4

const tmp5 = arr3[3];
arr3[3] = arr3[1];
arr3[1] = tmp5

////////////

	const str4 = "<%=sbHtml5%>";
	const arr4 = str4.split("명", 5 );

	const tmp6 = arr4[4];
	arr4[4] = arr4[0];
	arr4[0] = tmp6
	
	const tmp7 = arr4[3];
	arr4[3] = arr4[1];
	arr4[1] = tmp7

	const array2 = arr4;

	const map2 = array2.map(x => x * 1);
//////////////////

	$(document).ready(function() {  
	   var chart = {
	      type: 'column'
	   };
	   var title = false;
	   
	   var xAxis = {
	      categories: arr3
	      ,
				
				
	      crosshair: true
	   };
	   var yAxis = {
	      min: 0,
	      title: {
	         text: ''         
	      }      
	   };
	   var tooltip = {
			 headerFormat : '<span style="font-size:10px">{point.key}</span><table>',
			pointFormat : '<tr><td style="color:{series.color};padding:0">{series.name}: </td>'
						+ '<td style="padding:0"><b>{point.y} 개</b></td></tr>',
			footerFormat : '</table>',
	      	shared: true,
	      	useHTML: true
	   };
	   var plotOptions = {
	      column: {
	         pointPadding: 0.2,
	         borderWidth: 0
	      }
	   };  
	   var credits = {
	      enabled: false
	   };
	   
	   var series= [{
	        name: '게시글 수',
	            data:  map2

	   }];     
	      
	   var json = {};   
	   json.chart = chart; 
	   json.title = title;   
	   json.tooltip = tooltip;
	   json.xAxis = xAxis;
	   json.yAxis = yAxis;  
	   json.series = series;
	   json.plotOptions = plotOptions;  
	   json.credits = credits;
	   $('#chart').highcharts(json);
	  
	});
	
	
	$(document).ready(function() {  
		   var chart = {
		      type: 'column'
		   };
		   
		   var title = false;


		   var xAxis = {
		      categories:  arr1 ,
		      crosshair: true
		   };
		   var yAxis = {
		      min: 0,
		      title: {
		         text: ''         
		      }      
		   };
		   var tooltip = {
				headerFormat : '<span style="font-size:10px">{point.key}</span><table>',
				pointFormat : '<tr><td style="color:{series.color};padding:0">{series.name}: </td>'
						+ '<td style="padding:0"><b>{point.y} 명</b></td></tr>',
				footerFormat : '</table>',
		      	shared: true,
		      	useHTML: true
		   };
		   var plotOptions = {
		      column: {
		         pointPadding: 0.2,
		         borderWidth: 0
		      }
		   };  
		   var credits = {
		      enabled: false
		   };
		   
 		   var series = [ {
				name : '인원',
				data : map1
			}];
		   
		   var json = {};   
		   json.chart = chart; 
		   json.title = title;   
		   json.tooltip = tooltip;
		   json.xAxis = xAxis;
		   json.yAxis = yAxis;  
		   json.series = series;
		   json.plotOptions = plotOptions;  
		   json.credits = credits;
		   $('#chart1').highcharts(json);
		  
		});
</script>
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
                        
                        <div class="row">
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        최근 게시글
                                    </div>
                                    <div>
                                        <div class="bbs">
                                            
                                            <table >
                                                <tbody>
                                                    <tr align ="center" >
                                                    	<td><p>게시판</p></td>
                                                        <td><p>제목</p></td>
                                                        <td><p>아이디</p></td>
                                                        <td><p>작성일</p></td>
                                                    </tr>
                                                         <%=sbHtml1 %>                                        

                                                    </tbody>
                                                </table>
                                                
                                        </div>
                                        

                                    </div>

                                    <div>
                                        <table width="100%" height="100%" border="0"    >
                                            <tbody>
                                                <tr align ="center">
                                                    <td><p>총 게시글 수</p><b><%=ttbcount%></b> 개</td>
                                                    <td><p>총 댓글 수</p><b><%=ttccount%></b> 개</td>
                                                    <td><p>오늘 게시글 수</p><b><%=tbcount%></b> 개</td>
                                                    <td><p>오늘 댓글 수</p><b><%=tccount%></b> 개</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>

                                </div>
                            </div>
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        최근 가입 회원 
                                    </div>
                                    <div>
                                        <div class="visitor_latest">
                                            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                                <tbody>
                                                    <tr align ="center">
                                                        <td><p>아이디</p></td>
                                                        <td><p>닉네임</p></td>
                                                        <td><p>이름</p></td>
                                                        <td><p>생년월일</p></td>
                                                        <td><p>생성일</p></td>
                                                    </tr>
                                                         <%=sbHtml %>                                        
                                                </tbody>
                                            </table>
                                        </div>
                                        
                                    </div>
                                    
                                    
                                    <div>
                                        <table width="100%" height="100%" border="0"  >
                                            <tbody>
                                                <tr align ="center">
                                                    <td><p>총 가입 회원</p><b><%=ttucount%></b> 명</td>
                                                    <td><p></p><b></b> </td>
                                                    <td><p>오늘 가입 회원</p><b><%=tucount%></b> 명</td>
                                                    <td><p></p><b></b> </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    
                                </div>
                            </div>
                        </div>
  
                        
                        <div class="row">
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        최근 게시글 
                                    </div>
                                    <div>
                                        <div class="bbs">
                                        <div id="chart" style="width: 100%; height: 100%; margin: 0 auto"></div>     

                                        </div>    

                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        최근 접속 통계 
                                    </div>
                                    <div>
                                        <div class="visitor_latest">
                                         <div id="chart1" style="width: 100%; height: 100%; margin: 0 auto"></div>     
                                            
                                        </div>
                                        
                                    </div>
       
                                </div>
                            </div>
                        </div>
                    </div>                    
                    <div>
                     
	                   
                    </div>
                </main>
               	
               	
               	
               	
               
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts1.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/chart-area-demo.js"></script>
        <script src="assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="js/datatables-simple-demo.js"></script>
    </body>
</html>


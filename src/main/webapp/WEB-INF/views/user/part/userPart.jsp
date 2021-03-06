<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List, emt.emt.common.domain.Question" %>

<jsp:include page="/WEB-INF/views/template/header.jsp"/>

<body class="hold-transition skin-blue layout-top-nav">


	<div class="wrapper">
		<header class="main-header">
			<nav class="navbar navbar-static-top">
				<div class="container">
					<div class="navbar-header">
						<a href="/emt/index" class="navbar-brand"><b>English</b>Mock
							Test</a>
						<button type="button" class="navbar-toggle collapsed"
							data-toggle="collapse" data-target="#navbar-collapse">
							<i class="fa fa-bars"></i>
						</button>
					</div>

					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse pull-left"
						id="navbar-collapse">
						<ul class="nav navbar-nav">
							<li><a href="/emt/user/test/mockTest">토익스피킹 모의고사</a></li>
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown">파트별문제풀기 <span class="caret"></span></a>
								<ul class="dropdown-menu" role="menu">
									<li><a href="/emt/user/part/part1">Part1</a></li>
									<li><a href="/emt/user/part/part2">Part2</a></li>
									<li><a href="/emt/user/part/part3">Part3</a></li>
									<li><a href="/emt/user/part/part4">Part4</a></li>
									<li><a href="/emt/user/part/part5">Part5</a></li>
									<li><a href="/emt/user/part/part6">Part6</a></li>
								</ul></li>
							<li><a href="/emt/user/grammar/userGrammar">문법문제</a></li>	
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown">게시판 <span class="caret"></span></a>
								<ul class="dropdown-menu" role="menu">
									<li><a href="/emt/notice">공지사항</a>
									<li><a href="/emt/board">문제공유</a>
								</ul></li>
						</ul>
					</div>
					<!-- /.navbar-collapse -->
					<!-- Navbar Right Menu -->
					<div class="navbar-custom-menu">
						<ul class="nav navbar-nav">

							<c:choose>
								<c:when test="${sessionScope.sid==null }">
									<li><a href="/emt/login/login"> 로그인 </a></li>
									<li><a href="/emt/join/join"> 회원가입 </a>
									</li>
									<!-- 회원가입 -->
								</c:when>
								<c:otherwise>
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown">${sid }</a>
								<ul class="dropdown-menu" role="menu">
									<li><a href="/emt/user/review/userReview?sid=${sid }">복습</a></li>
									<li><a href="/emt/user/score/userScore">문법점수</a></li>
									<li><a href="/emt/user/member/userMemberList?userId=${sid }">정보수정</a></li>
									<li id="logout"><a>로그아웃</a></li>
								</ul></li>
									<!-- 회원가입 -->
								</c:otherwise>
							</c:choose>

						</ul>
					</div>
					<!-- /.navbar-custom-menu -->
				</div>
				<!-- /.container-fluid -->
			</nav>
		</header>
		<!-- Full Width Column -->
		<div class="content-wrapper">
			<div class="container">
				<!-- Content Header (Page header) -->
				<section class="content-header"></section>

				<!-- Main content -->
				<section class="content">
					
					<div class="box box-info">
						<!-- /.box-header -->
							<div class="box-body">
							
							
					<!-- 이곳에 문제내용이 들어갑니다. -->
                     <div style="width:1000px;margin-left: auto; margin-right: auto; text-align: center">
						
						<c:set var="partQuestions" value="${partQuestion }"/>
						<%
						
							List<Question> parts = (List)request.getAttribute("partQuestion");
							
							int random = (int)(Math.random()*parts.size());
							
							Question part = parts.get(random);
							
							// 문제유형
							int type=part.getQuestionType();
							
							// 파일 경로
							String path="";
							
							switch (type)
							{
							case 1 : path="part1/"; break;
							case 2 : path="part2/"; break;
							case 3 : path="part3/"; break;
							case 4 : path="part4/"; break;
							case 5 : path="part5/"; break;
							case 6 : path="part6/"; break;
							}
							
							// 파일 이름
							String videoFile = part.getQuestionVideo();
						%>
						<!-- 파일 경로와 유형을 jstl로 -->
						<c:set var="part" value="<%=part %>"/>
						
						<c:set var="file" value="<%=path+videoFile %>"/>
						
						<video onended="gogo()" width="700" height="500" id="videos" controls="controls"
						src="<c:url value="/upload/${file }"/>" autoplay="autoplay" width="800px" height="800px">
						</video>
						
						
                     </div>	<!-- /.box-body -->
							<!-- /.table-responsive -->
					<div style="text-align: center">
						<button onclick="captures()" class="btn btn-default">화면 캡쳐하기</button>
						</div>
					</div>
				</div>
				
				</section>
				<!-- /.content -->
			</div>
			<!-- /.container -->
		</div>
		<!-- /.content-wrapper -->
		<footer class="main-footer navbar-fixed-bottom">
				<div class="container">
					<div class="pull-right hidden-xs">
						<b>Version</b> 1.0.0
					</div>
					<strong>Copyright &copy; 2016 <a
						href="/emt/index">English Mock Test</a>
					</strong> All rights reserved.
				</div>
			</footer>
	</div>
	<!-- ./wrapper -->

	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	<!-- Bootstrap 3.3.5 -->
	<script src="<c:url value="/js/bootstrap.min.js"/>"></script>
	<!-- SlimScroll -->
	<script src="<c:url value="/js/jquery.slimscroll.min.js"/>"></script>
	<!-- FastClick -->
	<script src="<c:url value="/js/fastclick.min.js"/>"></script>
	<!-- AdminLTE App -->
	<script src="<c:url value="/js/app.min.js"/>"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="<c:url value="/js/demo.js"/>"></script>
	
	<script type="text/javascript">
	var no;
	var id;
	var type;
	var tf=true;
	
	function gogo(){
			
		// 문제를 저장한다
		no = "${part.questionNo}";
		id = "${sessionScope.sid}";
		type = "${part.questionType}";
		
 		
		
		// 저장여부를 묻는 모달 출력, tf=0이므로 다시시작함수 실행시킴
		$("#modalContent2").html("문제를 저장하시겠습니까?<br>저장된 문제는 복습에서 다시 풀수 있습니다.");
		$("#modalBtns2").html("<button type='button' class='btn btn-default' data-dismiss='modal'>안함</button>"+
				"<button type='button' onclick='savePart()' class='btn btn-primary'>저장</button>");
		
		$("#modal2").modal({show:true});
		
		$("#modal2").on("hidden.bs.modal", function(){
			if(tf){
				restart();
			}
		}); 
	};
		
	
	function savePart(){
		 $.ajax({
			
			url: "/emt/user/part/saveReview",
			method : "POST",
			data : {
				questionNo : no,
				userId : id
			},
			success : function(result){
				
				tf=false; 
				
				// 저장성공시
				if(result>0){
					
					
					$("#modal2").modal('hide');
					$("#modalContent").html("저장되었습니다.");
					$("#modalBtns").html("<button type='button' class='btn btn-primary' data-dismiss='modal'>확인</button>");
					$("#modal").modal({show:true});
					
					
				} else {
					$("#modal2").modal('hide');
					$("#modalContent").html("이미 복습목록에 있습니다.");
					$("#modalBtns").html("<button type='button' class='btn btn-primary' data-dismiss='modal'>확인</button>");
					$("#modal").modal({show:true});
				};
				
				$("#modal").on("hidden.bs.modal", function(){
					//tf=true;
					restart();
				});
			}
		}); 
	
	}
	
	function restart(){
		
		$("#modalContent2").html("계속 하시겠습니까?");
		$("#modalBtns2").html("<button type='button' class='btn btn-default' data-dismiss='modal'>취소</button>"+
				"<button type='button' onclick='part()' class='btn btn-primary'>다시하기</button>");
		$("#modal2").modal('show');
		
		// 닫힐시 인덱스이동
		$("#modal2").on("hidden.bs.modal", function(){
				location.replace('/emt/index');
		});
	}
	
	function part(){
		location.replace('/emt/user/part/part'+type);
	}
	
	function captures(){
		var video = document.getElementById("videos");
		canvas = document.getElementById("captures");
		
		var ctx = canvas.getContext("2d");
		canvas.width = video.clientWidth;
		canvas.height = video.clientHeight;
		ctx.drawImage(video, 0, 0, video.clientWidth, video.clientHeight);
		
		$("#canvasModal").modal("show");
	}
	
	</script>
	
	<!-- 로그아웃 -->
	<script src="<c:url value="/js/logout.js"/>"></script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<title>EMT</title>
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- Bootstrap 3.3.5 -->
<link rel="stylesheet" href="<c:url value="/css/bootstrap.min.css"/>">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="<c:url value="/css/AdminLTE.min.css"/>">
<!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet" href="<c:url value="/css/_all-skins.min.css"/>">
<link rel="stylesheet" href="<c:url value="/css/member/userMemberList.css"/>">
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">	var id= "${sid}"</script>
<script type="text/javascript">	var updateResult = "${updateResult}"</script>

<!-- ADD THE CLASS layout-top-nav TO REMOVE THE SIDEBAR. -->



<body class="hold-transition skin-blue layout-top-nav">

		<!-- 작은 모달 -->
	<div class="modal fade" id="modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-sm">
	    <div class="modal-content">
	      <div class="modal-header" id="modalHeader">
		<button type="button"  class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
		<h4 class="modal-title" id="modalTitle">EMT 알림메시지</h4>
	      </div>
	      <div class="modal-body" id="modalContent">
			...
	      </div>
	      <div class="modal-footer" id="modalBtns">
		<button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
	      </div>
	    </div>
	  </div>
	</div><!-- 모달 END -->
	
	<!-- 로그아웃용 작은 모달 -->
	<div class="modal fade" id="modal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-sm">
	    <div class="modal-content">
	      <div class="modal-header" id="modalHeader1">
		<button type="button" class="close" data-dismiss="modal">
		<span aria-hidden="true">×</span>
		<span class="sr-only">Close</span>
		</button>
		<h4 class="modal-title" id="modalTitle1">EMT 알림메시지</h4>
	      </div>
	      <div class="modal-body" id="modalContent1">
			로그아웃 되었습니다.
	      </div>
	      <div class="modal-footer" id="modalBtns1">
		<button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
	      </div>
	    </div>
	  </div>
	</div><!-- 모달 END -->
	
	<!-- confirm용 작은 모달 -->
	<div class="modal fade" id="modal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-sm">
	    <div class="modal-content">
	      <div class="modal-header" id="modalHeader2">
		<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
		<h4 class="modal-title" id="modalTitle2">EMT 알림메시지</h4>
	      </div>
	      <div class="modal-body" id="modalContent2">
		...
	      </div>
	      <div class="modal-footer" id="modalBtns2">
		<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
		<button type="button" onclick="userDeleteAjax()" class="btn btn-primary">확인</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	
	
	
	

	<div class="wrapper">
		<header class="main-header">
			<nav class="navbar navbar-static-top">
				<div class="container">
					<div class="navbar-header">
						<a href="/emt/index" class="navbar-brand"><b>English</b>Mock Test</a>
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
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown">${sid }</a>
								<ul class="dropdown-menu" role="menu">
									<li><a href="/emt/user/review/userReview?sid=${sid}">복습</a></li>
									<li><a href="/emt/user/score/userScore">문법점수</a></li>
									<li><a href="/emt/user/member/userMemberList?userId=${sid}">정보수정</a></li>
									<li id="logout"><a>로그아웃</a></li>
								</ul></li>
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
						<div class="box-header with-border">
							<h3 class="box-title">내정보 수정</h3>
							<div class="box-tools pull-right">

							</div>
						</div>
						<!-- /.box-header -->
						<form action="/emt/user/member/userMemberUpdate" method="post" id="signupForm">
						<div class="box-body">
							<div class="table-responsive">

								<table class="table no-margin">
									<thead>
										<tr>
											<td width=150><b>아이디</b></td>
											<td width=300><b>${user.userId }<input type="hidden" name="userId" value="${user.userId }">	</b></td>
										</tr>

										
										<tr>
											<td width=150><b>가입일자</b></td>
											<td width=300><b>${user.userDate }</b></td>
										</tr>

									</thead>
									<tbody>
										<tr>			 
													
											<td width=150><label for="userPw">변경 비밀번호 (수정 가능)</label></td>
											<td width=300><input id="userPw" name="userPw" type="password"></td>
										</tr>
										<tr>
											<td width=150><label for="confirm_password">변경 비밀번호 확인 (수정 가능)</label> </td>
											<td width=300><input id="confirm_password" name="confirm_password" type="password"></td>
										</tr>
										<tr>

										</tr>

										<tr>
											<td width=150><b>이메일 (수정 가능)</b></td>
											<td width=300><input type="text" name="email" value=${user.email } required></td>
										</tr>

									</tbody>
								</table>
								
							</div>
							<div style="text-align: right;">

								<input type="submit" class="btn btn-default" value="수정">
								<input type="button" class="btn btn-default" onclick="userDelete()" value="탈퇴">				 
								<button class="btn btn-default"  onclick="location.href='/emt/index'">취소</button>
								
							</div>
							
							<!-- /.table-responsive -->
						</div>
						</form>
						<!-- /.box-body -->
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
	<script	src="//cdn.jsdelivr.net/jquery.validation/1.14.0/jquery.validate.min.js"></script>
	<script src="<c:url value="/js/member/userMemberList.js"/>"></script>	
	<script src="<c:url value="/js/logout.js"/>"></script>
	
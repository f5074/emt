<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"/>

<c:choose>
	<c:when test="${loginMsg!=null }">
		<script>
			alert("${loginMsg}");
			<%
	    	session.removeAttribute("loginMsg");
		    %>
		</script>
	</c:when>
</c:choose>


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
						<div class="box-header with-border" style="text-align: center;">
							<h3 id="title" class="box-title"></h3>
							
							<div class="box-tools pull-right">

							</div>
						</div>
						<!-- /.box-header -->
						<div class="box-body">
							<div class="table-responsive" style="text-align: center;">
								<table class="table no-margin">
									<thead>
										<tr>
											<th>
											
											<div id="noticeInfo" style="text-align: right">
											</div>
											
											</th>
										</tr>
									</thead>
									<tbody>

										<tr>
											<td>
										<textarea id="noticeContent"  rows="15"
											 style="resize: none; outline-style:none; height:auto;width:100%; border: none;" readonly>
											</textarea>
											</td>
										</tr>

									</tbody>
								</table>

							</div>
							<div id="updel" style="text-align: right;">
							<c:choose>
								<c:when test="${sessionScope.sid.equals('admin') || sessionScope.sid.equals(boardUserId) }">
									<input type="button" class="btn btn-default"
										onclick="location.replace('boardModify?boardNo=${boardNo}')" value="수정하기">
									<input id="btnDelete" type="button" class="btn btn-default" value="삭제하기">
								</c:when>
							</c:choose>
							
								<input type="button" class="btn btn-default"
									onclick="location.replace('board')" value="목록보기">
									 
							</div>
							<!--댓글 시작  -->
												<h3 id="title" class="box-title">댓글</h3>													
												<div style="text-align: center;">
													<form id="replyInsert">
														<input type="hidden" name="userId" id="userId" value='${sid}' >
														<input type="hidden" name="boardNo" id="boardNo" value='${boardNo}' >
														<input type="text" name="replyContent"  id="replyContent" style="width: 85%"> 
														<input class="btn btn-default" type="submit" style='width: 10%' value="등록">
													</form>
												</div>

							<div id="replyView" class="table-responsive"></div>
							<div id="replyPage" style="text-align: right"></div>	
							<!--댓글 끝  -->

							<!-- /.table-responsive -->
						</div>
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
	<!-- 로그아웃 스크립트 -->
	<script src="<c:url value="/js/logout.js"/>"></script>
	<!-- 공지사항 상세보기 -->
	<script type="text/javascript">var no = "${boardNo}"</script>
	<script src="<c:url value="/js/board/boardDetailView.js"/>"></script>
	<script src="<c:url value="/js/reply/replyList.js"/>"></script>
	<script type="text/javascript">	var sid = "${sid}"</script>
	
	
</body>
</html>
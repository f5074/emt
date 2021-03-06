<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"/>

<body class="hold-transition login-page">

	
	<div class="login-box">
		<div class="login-logo">
			<a href="/emt/index"><b>English Mock</b>Test</a>
		</div>
		<!-- /.login-logo -->
		<div class="login-box-body login-page">

			<form method="post" action="findIdResult">
				<div class="form-group has-feedback">
					<input type="text" name="email" id="email" class="form-control"
						placeholder="가입시 입력한 email"> <span
						class="glyphicon glyphicon-pencil form-control-feedback"></span>
				</div>
				<div>
					<!-- /.col -->
					<div class="social-auth-links text-center">
						<input type="submit" name="Submit"
							class="btn btn-primary btn-block btn-flat" value="아이디 찾기">
						
					</div>
					<!-- /.col -->
				</div>
			</form>
		</div>
		<!-- /.social-auth-links -->
	</div>
	
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
	</body><!-- /.login-box-body -->
var exp = /^[a-z0-9]{5,10}$/;
var mailExp = /^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$/;
// id확인
function idCheck() {
	if (!exp.test($("#userId").val())) {
		$("#joinModalContent").html("아이디는 영문,숫자 5~10자리로 입력해주세요");
		$("#joinModal").modal('show');
		return false;
	} else {
		return true;
	}
}
// pw확인
function pwCheck() {
	if (!exp.test($("#userPw").val())) {
		$("#joinModalContent").html("비밀번호는 영문,숫자 5~10자리로 입력해주세요");
		$("#joinModal").modal('show');
		return false;
	} else {
		return true;
	}
}
// 비밀번호와 비밀번호 확인 일치여부
function pwCheck2() {
	if ($("#userPwCh").val() != frmJoin.userPw.value) {
		$("#joinModalContent").html("비밀번호확인과 비밀번호가 일치하지 않습니다.");
		$("#joinModal").modal('show');
		return false;
	} else {
		return true;
	}
}
// 메일 확인
function mailCheck() {
	if (!mailExp.test($("#email").val())) {
		$("#joinModalContent").html("메일 형식은 abc@abc.com입니다.");
		$("#joinModal").modal('show');
		return false;
	} else {
		return true;
	}
}
//function term() {
//	if ($("input[type='radio'][name='term']:checked").val() == 'agree') {
//		return true;
//	} else if ($("input[type='radio'][name='term']:checked").val() == 'disagree') {
//		alert("약관 동의 하셔야 가입하실 수 있습니다.");
//		return false;
//	} else {
//		alert("약관 동의 하셔야 가입하실 수 있습니다.");
//		return false;
//	}
//}

//Admin 전용 회원등록 어드민 전용 js파일 생성해서 하자.
$(function() {
	var userId = $("#userId");
	var userPw = $("#userPw");
	var email = $("#email");
//	var terms = $("input[name='term']");
	var duplch = false;
	// /////////// var userId = $("#userId").val();
	$("#userId").change(function() {
	//	duplch=false;
		idCheck();
	});
	$("#duplbtn2").click(function() {
		// 이 시점의 userId.val() 가져와서 함
		// alert("입력값 : "+userId.val());
		$.ajax({
			method : "POST",
			url : "/emt/duplCheck2",
			data : {
				userId : encodeURI(userId.val())
			},
			success : function(result) {
				if (result == "") {
					duplch = true;
					$("#joinModalContent").html("사용하실 수 있는 ID입니다.");
					$("#joinModal").modal('show');
				} else {
					$("#joinModalContent").html("사용하실 수 없는 ID입니다.");
					$("#joinModal").modal('show');
				}
			},
			error : function(request, status, error) {
				alert("code: " + request.status + "\n" + "error:" + error);
			}
		});
	});
	$("#userPw").change(function() {
		pwCheck();
	});
	$("#userPwCh").change(function() {
		pwCheck2();
	});
	$("#email").change(function() {
		mailCheck();
	});
	$("#join").click(function() {
						// 아이디, Pw, pw확인 일치하면 가입 ㄱㄱ
						if (idCheck() && pwCheck() && pwCheck2() && mailCheck()) {
							if (duplch) {
								$.ajax({
											method : "POST",
											url : "/emt/admin/addUser2",
											contentType : "application/x-www-form-urlencoded; charset=UTF-8",
											data : {
												userId : encodeURI(userId.val()),
												userPw : encodeURI(userPw.val()),
												email : encodeURI(email.val())
											},
											success : function(result) {
												if (result == 1) {
													$("#resultModalContent").html("정상적으로 등록되었습니다.");
													$("#resultModal").modal('show');
													
												} else {
													$("#joinModalContent").html("정상적으로 등록되지 않았습니다.");
													$("#joinModal").modal('show');
												}
											},
											error : function(request, status,
													error) {
												alert("code: " + request.status
														+ "\n" + "error:"
														+ error);
											}
										});
							} else if (!duplch) {
								alert("ID 중복 확인 해주십시오.");
							}
						}
					});
});
// 등록후 이동
$("#resultModal").on("hidden.bs.modal", function(){
	document.location.href = "/emt/admin/adminMain";
});

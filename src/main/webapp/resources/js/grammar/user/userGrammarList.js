		var answer= new Array();
	function userGrammarList() {
		$.ajax({
			url: "/emt/user/grammar/userGrammarList",
			method: "GET",
			data: { type: 1,
				grammarInning: 1
			
			},
			success: function(result){
				$("#userGrammarView").html("<table id='userGrammarTable' class='table no-margin'></table>");
				$("#userGrammarTable").append("<thead><tr><th></th><th></th></thead>");
				$("#userGrammarTable").append("<tbody>")
				
				for(var i=0; i<result.length; i++){

					answer[i] = result[i].grammarAnswer;					

					$("#userGrammarTable").append(
							"<tr>"
							+"<td>"
							+"<div class='lime'>"+result[i].grammarInning+"회 "+(i+1)+"번 "+result[i].grammarQuiz+"</div>"
							+"<pre style='word-wrap: break-word;white-space: pre-wrap;white-space: -moz-pre-wrap;white-space: -pre-wrap;white-space: -o-pre-wrap;word-break:break-all;'>"+result[i].grammarEx+"</pre>"
							+"<div><input type='radio' name='"+i+"' value='1'>"+result[i].grammarEx1+"</div>"
							+"<div><input type='radio' name='"+i+"' value='2'>"+result[i].grammarEx2+"</div>"
							+"<div><input type='radio' name='"+i+"' value='3'>"+result[i].grammarEx3+"</div>"
							+"<div><input type='radio' name='"+i+"' value='4'>"+result[i].grammarEx4+"</div>"
							+"<div class='showHide' style='text-align:right' >정답:"+answer[i]+"</div>"
							+"</td>"
							+"</tr>"
							);
					/*정답을 가려숨겨주는 매서드*/
					$('.showHide').hide(); 	
				}
				$("#userGrammarTable").append("</tbody>");
				
			}
		});
	};	

	//문법 회차 클릭시 해당 회차 출력
	function userGrammarInnning(){
		$.ajax({
			url:"/emt/user/grammar/userGrammarInning",
			method:"GET",
			data: {
				type:1,
				grammarInning: $("#selecter :selected").val()
			},
			success: function(result){
				$("#userGrammarView").html("<table id='userGrammarTable' class='table no-margin'></table>");
				$("#userGrammarTable").append("<thead><tr><th></th><th></th></thead>");
				$("#userGrammarTable").append("<tbody>")
				
				if(result.length > 9){
					$("#userGrammarChk").html("<input type='button' style='float: right' class='btn btn-primary' onclick='answerChk()' value='채점하기'>");	
				}
				
				for(var i=0; i<result.length; i++){

					answer[i] = result[i].grammarAnswer;
					
					$("#userGrammarTable").append(
							"<tr>"
							+"<td>"
							+"<div class='lime'>"+result[i].grammarInning+"회 "+(i+1)+"번 "+result[i].grammarQuiz+"</div>"
							+"<pre style='word-wrap: break-word;white-space: pre-wrap;white-space: -moz-pre-wrap;white-space: -pre-wrap;white-space: -o-pre-wrap;word-break:break-all;'>"+result[i].grammarEx+"</pre>"
							+"<div><input type='radio' name='"+i+"' value='1'>"+result[i].grammarEx1+"</div>"
							+"<div><input type='radio' name='"+i+"' value='2'>"+result[i].grammarEx2+"</div>"
							+"<div><input type='radio' name='"+i+"' value='3'>"+result[i].grammarEx3+"</div>"
							+"<div><input type='radio' name='"+i+"' value='4'>"+result[i].grammarEx4+"</div>"
							+"<div class='showHide' style='text-align:right' >정답:"+answer[i]+"</div>"
							+"</td>"
							+"</tr>"
							);
					/*정답을 가려숨겨주는 매서드*/
					$('.showHide').hide(); 	
				}
				$("#userGrammarTable").append("</tbody>");
			}
		});
	};
	
	


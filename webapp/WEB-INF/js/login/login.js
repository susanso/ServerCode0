/**
 * 
 */

//찾고자 하는 것
var findType = "findUserId";
var userId = "";
var email = "";

$(".loginDo").click(function(){
	var id = $(".insertId").val();
	var pwd = $(".insertPwd").val();
	$.ajax({
		url: "/login.go",
		type: "POST",
		dataType: "json",
		data:{"id":id,"pwd":pwd},
		success: function(data){
			if(data.path == "true"){
				location.href = "/";
			}else if(data.path == "false"){
				alert("아이디, 비밀번호를 다시 확인해주세요.");
				$(".insertId").val("");
				$(".insertPwd").val("");
			}
		}
	});
})
//엔터만 쳐도 로그인 실행
$(".insertPwd").add(".insertId").keyup(function(e){
	if(e.keyCode == 13){
		var id = $(".insertId").val();
		var pwd = $(".insertPwd").val();
		$.ajax({
			url: "/login.go",
			type: "POST",
			dataType: "json",
			data:{"id":id,"pwd":pwd},
			success: function(data){
				if(data.path == "true"){
					location.href = "/";
				}else if(data.path == "false"){
					alert("아이디, 비밀번호를 다시 확인해주세요.");
					$(".insertId").val("");
					$(".insertPwd").val("");
				}
			}
		});
	} 
});
	
$(".signUp").click(function(){
	location.href = "/signUp.do";
});
$(".findUserinfo").click(function(){
	$(".login_box").css("display","none");
	$(".findInfo_box").fadeIn(500);
});
//아이디찾기 활성화
$(".findUserId").click(function(){
	findType = $(this).attr("value");
	//비밀번호에 필요한 input 출력 및 결과페이지 숨기기
	$(".findIdBox").fadeIn();
	$(".findPwdBox").fadeIn();
	$(".authenticate").fadeIn();
	$(".resultBoxMsg").text("");
	$(".resetPwdBox").css("display","none");
	$(".resultBox").css("display","none");
	//input안에 쓴 글자 전부 지우기
	$(".findIdEmail").val("");
	$(".findIdBirth").val("");
	//아이디찾기 활성화 표시
	$(".findUserId").css("background","linear-gradient(0.25turn, rgb(168, 136, 161), rgb(52, 112, 157)");
	$(".findUserPwd").css("background","#333333");
	//아이디 찾기 on
	$(".findIdEmail").css("display","inline-block");
	$(".findIdBirth").css("display","inline-block");
	//비밀번호 찾기 off
	$(".findPwsId").css("display","none");
	$(".findPwdEmail").css("display","none");
	
});
//비밀번호찾기 활성화
$(".findUserPwd").click(function(){
	findType = $(this).attr("value");
	//비밀번호에 필요한 input 출력 및 결과페이지 숨기기
	$(".findIdBox").fadeIn();
	$(".findPwdBox").fadeIn();
	$(".authenticate").fadeIn();
	$(".resultBoxMsg").text("");
	$(".resetPwdBox").css("display","none");
	$(".resultBox").css("display","none");
	//input안에 쓴 글자 전부 지우기
	$(".findPwsId").val("");
	$(".findPwdEmail").val("");
	//비밀번호찾기 활성화 표시
	$(".findUserPwd").css("background","linear-gradient(0.25turn, rgb(168, 136, 161), rgb(52, 112, 157)");
	$(".findUserId").css("background","#333333");
	//아이디 찾기 off
	$(".findIdEmail").css("display","none");
	$(".findIdBirth").css("display","none");
	//비밀번호 찾기 on
	$(".findPwsId").css("display","inline-block");
	$(".findPwdEmail").css("display","inline-block");
});
$(".showLogin").click(function(){
	location.href = "/login.do";
});
$(".authenticate").click(function(){
	//아이디 찾기
	if(findType == "findUserId"){
		var idEmail = $(".findIdEmail").val();
		var birth = $(".findIdBirth").val();
		//값이 비어있을 경우
		if($(".findIdEmail").val()== "" || $(".findIdBirth").val() =="" ){
			alert("이메일과 생년월일을 다시 학인해주세요.");
			return;
		}
		$.ajax({
			url: "/findId.go",
			type: "POST",
			dataType: "json",
			data:{"birthyear":birth,"email":idEmail},
			success: function(data){
				//가져오는 아이디값이 없을 경우
				if(data.userId != null){
					$(".findIdBox").css("display","none");
					$(".findPwdBox").css("display","none");
					$(".resultBox").fadeIn();
					$(".authenticate").css("display","none");
					$(".resultBoxMsg").text("회원님의 아이디는 "+data.userId+" 입니다.");
				}else {
					alert("일치하는 회원정보가 없습니다.");
					$(".findIdEmail").val("");
					$(".findIdBirth").val("");
				}
			}
		});
	//비밀번호 찾기
	}else if(findType =="findUserPwd"){
		userId = $(".findPwsId").val();
		email = $(".findPwdEmail").val();
		
		
		//ajax 실행
		$.ajax({
			url: "/findPwd.go",
			type: "POST",
			dataType: "json",
			data:{"userId":userId,"email":email},
			success: function(data){
				if(data.userPwd == 1 ){
					//인증번호 화면 보이기
					$(".findIdBox").css("display","none");
					$(".findPwdBox").css("display","none");
					$(".resetPwdEmailBox").fadeIn();
					$(".authenticate").css("display","none");
					
					//ajax 실행
					$.ajax({
						url: "/signUpMailSending.go",
						type: "get",
						dataType: "json",
						data:{"email":email},
						success: function(data){
							var resultPwdEmail =data.num; 
							//이메일 인증
							$(".resetPwdEmailBtn").click(function(){
								var resetPwdEmail = $(".resetPwdEmail").val();
								if(userId =="" || email ==""){
									alert("비정상적인 접근입니다.");
									location.href="/";
									return;
								}
								if(resultPwdEmail == resetPwdEmail){
									$(".resetPwdEmailBox").css("display","none");
									$(".resetPwdBox").fadeIn();
								}else{
									alert("인증 번호가 일치 하지 않습니다.");
									$(".resetPwdEmail").val("");
									$(".resetPwdEmail").focus();
								}
							});
						}
					});
				}else{
					alert("일치하는 회원정보가 없습니다.");
					$(".findPwsId").val("");
					$(".findPwdEmail").val("");
				}
			}
		});
	}
});

$(".resetPwdBtn").click(function(){
	var resetPwdAfter = $(".resetPwdAfter").val();
	if(userId =="" || email ==""){
		alert("비정상적인 접근입니다.");
		location.href="/";
		return;
	}		
	if($(".resetPwdBefore").val() != $(".resetPwdAfter").val()){
		alert("비밀번호가 서로 불일치 합니다.");
		$(".resetPwdBefore").val("");
		$(".resetPwdAfter").val("");
		return;
	}else if($(".resetPwdBefore").val().length < 5){
		alert("비밀번호는 6자 이상 입력해야 합니다.");
		$(".resetPwdBefore").val("");
		$(".resetPwdAfter").val("");
		return;
	}else{
		//ajax 실행
		$.ajax({
			url: "/updatePwd.go",
			type: "POST",
			dataType: "json",
			data:{"userId":userId,"email":email,"updatePwd":resetPwdAfter},
			success: function(data){
				alert("성공적으로 변경하였습니다.");
				location.reload();
			}
		});
	}
	
});
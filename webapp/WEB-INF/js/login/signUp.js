/**
 * 
 */
var checkPwdBoolean = null;
var checkIdBoolean = null;
var email ="";
var emailNum ="";
var emailBoolean =null;
$(".createSignUp").click(function(){
	let userName = $(".signUpUserName").val();
	console.log(userName);
	let id = $(".signUpId").val();
	let pwd = $(".signUpPwd2").val();
	email = $(".email_start").val()+"@"+$(".email_end").val();
	let phone = $(".phoneSelectBox option:selected").val()+"-"+$(".phoneInputBox_before").val()+"-"+$(".phoneInputBox_after").val();
	
	console.log(id);
	console.log(pwd);
	console.log(email);
	console.log(phone);
//	
	if($('.signUpId').val() ==""){
		alert("아이디를 입력해주세요.");
		$(".signUpId").focus();
		return;
	}else if(!checkIdBoolean){
		alert("아이디를 확인해 주세요.");
		//$(".signUpId").val("");
		$(".signUpId").focus();
		return;
	}else if($(".signUpUserName").val()==""){
		alert("이름을 입력해주세요.");
		$(".signUpUserName").val("");
		$(".signUpUserName").focus();
		return;
	}else if($('.signUpPwd1').val() ==""){
		alert("비밀번호를 입력해주세요.");
		$(".signUpPwd1").focus();
		return;
	}else if($('.signUpPwd2').val() ==""){
		alert("비밀번호를 입력해주세요.");
		$(".signUpPwd2").focus();
		return;
	}else if(!checkPwdBoolean){
		alert("비밀번호가 불일치 합니다.");
		$(".signUpPwd1").val("");
		$(".signUpPwd2").val("");
		$(".signUpPwd1").focus();
		return;
	}else if(!emailBoolean){
		alert("이메일 인증을 진행해주세요.");
		return;
	}else if(phone ==""){
		alert("핸드폰 번호를 입력해주세요.");
		$(".phoneInputBox_before").val("");
		$(".phoneInputBox_after").val("");
		$(".phoneInputBox_before").focus();
		return;
	}else if($(".email_start").val() ==""){
		alert("이메일을 입력해주세요.");
		$(".email_start").val("");
		$(".email_start").focus();
		return;
	}else if($(".email_end").val() ==""){
		alert("이메일을 입력해주세요.");
		$(".email_end").val("");
		$(".email_end").focus();
		return;
	}
	
	//회원가입
	$.ajax({
		url : "signUp.go",
		data : {"id":id, "pwd":pwd,"email":email,"phone":phone,"username":userName},
		dataType : "json",
		type : "get",
		success : function(data){
			if(data.success == "success"){
				alert("회원가입이 완료 되었습니다.");
				location.href = 'login.do';
			}
		}
	});
	//이메일보내기
	$.ajax({
		url : "mailSending.go",
		data : {"id":id},
		dataType : "json",
		type : "get",
		success : function(data){
			
		}
	});
	
});
//아이디 중복확인
$(".signUpId").on("propertychange change paste input", function() {
	if($(this).val() == "" ){
		$(".alertId").html("영문으로 입력해주세요");
		$(".alertId").css("color","#ff8f8f");
		return;
	}
	let id = $(this).val();
	let first_char = id.charAt(0);
	console.log(first_char);
    $.ajax({
		url: "/isCheckIdMember",
		type: "GET",
		dataType: "json",
		data:{"id":id},
		success: function(data){
			var checkId = data;
			checkIdBoolean = false;
			if($(".signUpId").val()==""){
				$(".alertId").html("");
			}else if(!isNaN(first_char)){
				$(".alertId").html("숫자로 시작할수 없습니다.");
				$(".alertId").css("color","#ff8f8f");
			}else if($(".signUpId").val().length < 6){
				$(".alertId").html("6~12자로 입력해주세요");
				$(".alertId").css("color","#ff8f8f");
			}else if(checkId == 1){
				$(".alertId").html("중복된 아이디 입니다.");
				$(".alertId").css("color","#ff8f8f");
			}else if(checkId == 0) {
				$(".alertId").html("사용가능한 아이디 입니다.");
				checkIdBoolean = true;
				$(".alertId").css("color","#fff");
			}
		}
	})
});
//비밀번호 유효성
$(".signUpPwd2").on("propertychange change paste input", function() {
	var pwd_bofore = $(".signUpPwd1").val();
	var pwd_after = $(this).val();
	checkPwdBoolean = false;
	if(pwd_bofore=="" && pwd_after==""){
		$(".alertPwd").html("");
	}else if(pwd_after.length < 5){
		$(".alertPwd").text("6자이상으로 입력해주세요.");
		$(".alertPwd").css("color","#ff8f8f");
	}else{
		if(pwd_bofore != pwd_after){
			$(".alertPwd").text("비밀번호가 불일치 합니다.");
			$(".alertPwd").css("color","#ff8f8f");
		}else if(pwd_bofore == pwd_after){
			$(".alertPwd").text("비밀번호가 일치합니다.");
			$(".alertPwd").css("color","#fff");
			checkPwdBoolean = true;
		}
	} 
});
//이메일 취소후 다시 입력
$(".cancelEmailBox").click(function(){
	if (confirm("인증 정보가 사라집니다. 취소하시겠습니까? ") == true){    //확인
		$(".createSubmitEmail").css("display","none");
		$(".submitEmail").css("display","flex");
		$(".cancelEmailBox").css("display","none");
		$(".email_start").val("");
		$(".email_end").val("");
		$(".selectEmail").val("").prop("selected", true); //값이 ""인 option 선택
		$(".email_start").removeAttr("readonly");  // 이메일아이디 활성화
		$(".email_end").removeAttr("readonly");  // 이메일주소 활성화
		$(".selectEmail").removeAttr("disabled");  // 셀렉트박스 비활성화
		$(".selectEmail").val("").attr("selected", "selected"); //기본 설정으로 변환
	}else{   //취소
	return false;
	}
});
//이메일 인증 중 다시 입력
$(".returnInsertEmail").click(function(){
	$(".submitEmail").css("display","flex");
	$(".createSubmitEmail").css("display","none");
	$(".emailResultBox").css("display","none");
	$(".emailBox").fadeIn(100);
});
//이메일  인증번호 버튼
$(".email_resultBtn").click(function(){
	if($(".email_result").val() == emailNum){
		alert("이메일 인증이 완료 되었습니다.");
		$(".emailResultBox").css("display","none");
		$(".emailBox").fadeIn();
		
		$(".cancelEmailBox").css("display","flex");
		$(".email_start").attr("readonly", "readonly");  // 이메일아이디 비활성화
		$(".email_end").attr("readonly", "readonly");  // 이메일주소 비활성화
		$(".selectEmail").attr("disabled", "disabled");  // 셀렉트박스 비활성화
	}else{
		alert("인증번호를 다시한번 확인해주세요.");
	}
});
//이메일 유효성
$(".submitEmail").on("click",function(){
	//이메일 형식이 맞는지 검사
	$(".email_result").val("");
	emailBoolean = false;
	var isContains = $('.email_end').val().indexOf('.com') > -1;
	if(isContains){
		email = $(".email_start").val()+"@"+$(".email_end").val();
		console.log(email);	
	}else if(!isContains){
		alert("이메일 형식이 올바르지 않습니다.");
		$(".email_end").val("");
		$(".email_end").focus();
		return;
	}else if($(".email_start").val()==""){
		alert("이메일 형식이 올바르지 않습니다.");
		$(".email_start").val("");
		$(".email_start").focus();
		return;
	}
	alert("인증번호가 이메일로 발송 되었습니다.")
	$(".emailBox").css("display","none");
	$(".emailResultBox").fadeIn(100);
	$(".emailResultBox").css("display","flex");
	$(".createSubmitEmail").css("display","flex");
	$(".submitEmail").css("display","none");
	$.ajax({
		url: "/signUpMailSending.go",
		type: "GET",
		dataType: "json",
		data:{"email":email},
		success: function(data){
			emailNum = data.num
			emailBoolean = true;
		}
	});
});
//주소(우편번호) 찾기 - 다음 API 활용
function searchAddr(){
       new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
            }
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            $(".postNumber").val(data.zonecode);
            $(".addrCode").val(addr+extraAddr);
            // 커서를 상세주소 필드로 이동한다.
            $(".detailAddrCode").focus();
        }
    }).open();
}
//$(".findAddr").click(function(){
//	searchAddr();
//});


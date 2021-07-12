/**
 * 
 */
window.onload = function(){
	console.log(userNick);
	console.log(userName); 
    console.log(userId);
	console.log(userPostNumber);
	console.log(userAddrCode);
	console.log(userDetailAddrCode);
	console.log(userEmailId);
	console.log(userEmailAddr);
	$(".myPageNickName").val(userNick);
	$(".myPageUserName").val(userName);
	$(".myPageUpId").val(userId);
	$(".postNumber").val(userPostNumber);
	$(".addrCode").val(userAddrCode);
	if(userDetailAddrCode != null){
		$(".detailAddrCode").val(userDetailAddrCode);
	}
	$(".email_start").val(userEmailId);
	$(".email_end").val(userEmailAddr);
	$(".submitEmailBox").addClass("createSubmitEmail");
	$(".selectEmail").val(userEmailAddr).prop("selected", true); //값이 userEmailAddr 인 option 선택
	$(".myPageJob").val(userJob);
	$(".phoneSelectBox").val(phoneType).prop("selected", true); //값이 phoneType 인 option 선택
	var selectJobBoolean = $(".selectJob").val(userJob).prop("selected", true); //값이 userJob 인 option 선택
	console.log(selectJobBoolean);
	$(".phoneInputBox_before").val(phoneBefore);
	$(".phoneInputBox_after").val(phoneAfter);
	
	var email ="";
	var emailBoolean =null;
	var emailNum ="";
	
	//프로필 기본 설정
	if(sessionProfileImg == "default"){
		$(".myPageProfile").css("background-image","url(../../image/profile/default_profile.png)");
	}else{
		$(".myPageProfile").css("background-image","url(../../../usr/"+userId+"/profile/"+sessionProfileImg+")");
	}	
}
function callMyWorkList(list){
	let viewMyWorkList = "";
	list.forEach(function(element){
	    console.log(element);
		console.log(element.albumcover);
		viewMyWorkList +="<div class='col-xs-12 col-sm-6 col-md-4 col-lg-4' style='padding: 0'>";
		if(element.composetype == "레퍼런스 기반 작곡"){
		viewMyWorkList += "<div class='workCardBox composeReference'>";	
		}else if(element.composetype == "분위기 기반 작곡"){
		viewMyWorkList += "<div class='workCardBox composeKeyword'>";
		}
		viewMyWorkList +="<div class='CardtitleBox'>"+
			"<div class='title'>"+element.subject+"</div>"+
				"<div class='optionBox'>";
				if(element.sell == "no"){
				viewMyWorkList +="<div class='not_sold'>미판매</div>";
				}else{
				viewMyWorkList +="<div class='sale'>판매중</div>";	
				}
		viewMyWorkList +="<div class='date'>"+element.createdate+"</div>"+
				"<div class='deleteButton' value='"+element.subject+"'></div>"+
			"</div>"+
		"</div>"+
		"<div class='CardContentBox'>"+
			"<div class='albumCover' style='background: url(../../image/album_cover/"+element.albumcover+".jpg) 0% 0% / cover'>"+
				"<div class='playBtn'></div>"+
			"</div>"+
			"<div class='ContentselectBox'>"+
				"<div class='selectCompose'>"+element.composetype+"</div>"+
				"<div class='ComposeName'>"+element.songinfo1+"</div>"+
				"<div class='Contentselect'>"+element.songinfo2+"</div>"+
			"</div>"+
			"<div class='CardDownBox'>"+
				"<div class='downBox pdf' value="+element.subject+"></div>"+
				"<div class='downBox mp3' value="+element.subject+"></div>"+
				"<div class='downBox midi' value="+element.subject+"></div>"+
			"</div></div>"+
			//추가사항
			"<div class='CardStoreSetBox'><div class='CardStoreSet' value='"+element.subject+"'>판매하기</div> </div>"+
			"</div></div>";
	});
	$(".workListBox").html(viewMyWorkList);
};

//닉네임중복확인
$(".myPageNickName").on("propertychange change paste input", function() {
	let nickName = $(this).val();
	let nickName_first_char = nickName.charAt(0);
	console.log(nickName_first_char);
    $.ajax({
		url: "/isCheckNickNameMember",
		type: "GET",
		dataType: "json",
		data:{"nickName":nickName},
		success: function(data){
			console.log("ㅁㄴㅇㅁㅇ");
			var checkNickName = data;
			checkNickBoolean = false;
			if($(".myPageNickName").val()==""){
				$(".alertNickName").html("");
			}else if(!isNaN(nickName_first_char)){
				$(".alertNickName").html("숫자로 시작할수 없습니다.");
				$(".alertNickName").css("color","#ff8f8f");
				console.log("숫자로 시작할수 없습니다.");
			}else if($(".myPageNickName").val().length < 6){
				$(".alertNickName").html("6~12자로 입력해주세요");
				$(".alertNickName").css("color","#ff8f8f");
				console.log("6~12자로 입력해주세요");
			}else if(checkNickName == 1){
				$(".alertNickName").html("중복된 아이디 입니다.");
				$(".alertNickName").css("color","#ff8f8f");
				console.log("중복된 아이디 입니다.");
			}else if(checkNickName == 0) {
				$(".alertNickName").html("사용가능한 닉네임 입니다.");
				checkNickBoolean = true;
				$(".alertNickName").css("color","#fff");
			}
		}
	})
});
//직업 전환
$(".selectJob").on("propertychange change", function() {
	var job = $(".selectJob option:selected").val();
	console.log(job);
	$(".myPageJob").val(job);
	if(job ==""){
		$(".myPageJob").focus();
	}
});
//페이지 전환
$(".myPageTitle").click(function(){
	$(".myPageTitle").removeClass("myPageTitleActive");
	$(this).addClass("myPageTitleActive");
	if($(this).hasClass("changeMyInfo")){
		$(".myPageShowBox").css("display","none");
		$(".changeMyInfoBox").fadeIn();
	}else if($(this).hasClass("paymentHistory")){
		$(".myPageShowBox").css("display","none");
		$(".paymentHistoryBox").fadeIn();
	}else if($(this).hasClass("workList")){
		$(".myPageShowBox").css("display","none");
//		userId = 
		$.ajax({
			url: "click_show_myList",
			type: "GET",
			dataType: "json",
			data:{"username":userId},
			success: function(data){
					let myList = data.list;
					console.log(myList);
					console.log(myList.albumcover);
					callMyWorkList(myList);
				}
			});
		$(".workListBox").fadeIn();
		console.log(userId);
	} else if($(this).hasClass("myRanking")){
		$(".myPageShowBox").css("display","none");
		$(".myRankingBox").fadeIn();
	} else if($(this).hasClass("QnAList")){
		$(".myPageShowBox").css("display","none");
		$(".QnAListBox").fadeIn();
	} 
});
//비밀번호 유효성
$(".myPagePwd2").on("propertychange change paste input", function() {
	var pwd_bofore = $(".myPagePwd1").val();
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
//이메일 유효성
//$(".submitEmail").on("click",function(){
$(".submitEmailBox").click(function(){
	if($(this).hasClass("submitEmail")){
		//이메일 형식이 맞는지 검사
	$(".email_result").val("");
	emailBoolean = false;
	var isContains = $('.email_end').val().indexOf('.com') > -1;
	if(isContains){
		email = $(".email_start").val()+"@"+$(".email_end").val();
		console.log(email);	
	}else{
		alert("이메일 형식이 올바르지 않습니다.");
		$(".email_end").val("");
		$(".email_end").focus();
		return;
	}
	alert("인증번호가 이메일로 발송 되었습니다.")
	$(".emailBox").css("display","none");
	$(".emailResultBox").fadeIn(100);
	$(".createSubmitEmail").css("display","flex");
	$(".submitEmail").css("display","none");
	$(".selectEmail").val($(".email_end").val()).prop("selected", true); //값이 ""인 option 선택
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
	}
});

//이메일 바꾸면 저절로 이메일 인증으로 바뀌기
$(".email_start").add(".email_end").on("propertychange change keyup paste input",function(){
	var email = $(".email_start").val()+"@"+$(".email_end").val();
	if(userEmailFullName == email){
		$(".submitEmailBox").html("이메일 인증완료");
		$(".submitEmailBox").removeClass("submitEmail");
		$(".submitEmailBox").addClass("createSubmitEmail");
	}else if(userEmailFullName != email){
		$(".submitEmailBox").html("이메일 인증하기");
		$(".submitEmailBox").addClass("submitEmail");
		$(".submitEmailBox").removeClass("createSubmitEmail");
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
		$(".submitEmailBox").css("display","flex");
		$(".submitEmailBox").html("이메일 인증완료");
		$(".submitEmailBox").removeClass("submitEmail");
		$(".submitEmailBox").addClass("createSubmitEmail");
		 userEmailFullName =  email ;
	}else{
		alert("인증번호를 다시한번 확인해주세요.");
	}
});
//이메일 select 박스 클릭시
$(".selectEmail").on("propertychange change", function() {
	var emailOption = $(".selectEmail option:selected").val();
	console.log(emailOption);
	$(".email_end").val(emailOption);
	if(emailOption ==""){
		$(".email_end").focus();
	}
	email = $(".email_start").val()+"@"+$(".email_end").val();
	if(userEmailFullName == email){
		$(".submitEmailBox").css("background","#505051");
		$(".submitEmailBox").html("인증완료");
		$(".submitEmailBox").removeClass("submitEmail");
		$(".submitEmailBox").addClass("createSubmitEmail");
	}else if(userEmailFullName != email){
		$(".submitEmailBox").css("background","linear-gradient(0.25turn, #a888a1, #34709d)");
		$(".submitEmailBox").html("이메일 인증");
		$(".submitEmailBox").addClass("submitEmail");
		$(".submitEmailBox").removeClass("createSubmitEmail");
	}
});
//비밀번호 유효성 검사
var changePwdBoolean = true;
$(".myPagePwd1").add(".myPagePwd2").on("propertychange change", function() {
	if($(".myPagePwd1").val() == "" && $(".myPagePwd2").val() == ""){
		changePwdBoolean = true;	
	}else if($(".myPagePwd1").val() != "" && $(".myPagePwd2").val() == ""){
		changePwdBoolean = true;
	}else{
		changePwdBoolean = false;
	}
	console.log(changePwdBoolean);
});
//프로필 변경
  $("#changeProfileFinder").change(function(){
     var formData=new FormData();
     var inputFile=$("#changeProfileFinder");
     var files=inputFile[0].files;
     for(var i=0;i<files.length;i++){
        formData.append("profileImg",files[i]);
     }
	 formData.append("id",userId);
        $.ajax({
        url:"photo.do",
        processData:false,
        contentType:false,
        type:'post',
        data:formData,
        dataType:'json',
        success:function(data){
			console.log("이미지명:"+data.profileImgName);   
			profile = data.profileImgName;
			$(".myPageProfile").css("background-image","url(../../../usr/"+userId+"/profile/"+profile+")");
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
$(".findAddr").click(function(){
	searchAddr();
});

var checkPwdBoolean = true;
$(".changeProfile").click(function(){
	let id = $(".myPageUpId").val();
	let pwd = $(".myPageMainPwd").val();
	let updatepwd = $(".myPagePwd2").val();
	let job = $(".myPageJob").val();
	email = $(".email_start").val()+"@"+$(".email_end").val();
	let phone = $(".phoneSelectBox option:selected").val()+"-"+$(".phoneInputBox_before").val()+"-"+$(".phoneInputBox_after").val();
	//상세주소가 안적혀있을경우
	if($(".detailAddrCode").val()==""){
		var addr = $(".postNumber").val()+"_"+$(".addrCode").val();
		console.log(addr);	
	}else{
		var addr = $(".postNumber").val()+"_"+$(".addrCode").val()+"_"+$(".detailAddrCode").val();
		console.log(addr);	
	}
	if(userEmailFullName != email){
		alert("이메일 인증을 해주세요.");
		return;
	}else if(job == ""){
		alert("직업을 입력해주세요.");
		$(".myPageJob").focus();
		return;
	}else if(phone == ""){
		alert("핸드폰 번호를 입력해주세요.");
		$(".phoneInputBox_before").val("");
		$(".phoneInputBox_after").val("");
		$(".phoneInputBox_before").focus();
		return;
	}else if($(".email_start").val() ==""){
		alert("이메일을 입력해주세요.");
		$(".email_start").val("");
		$(".email_start").focus();
	}else if($(".email_end").val() ==""){
		alert("이메일을 입력해주세요.");
		$(".email_end").val("");
		$(".email_end").focus();
	}
	if(changePwdBoolean){
			if($(".myPagePwd1").val()!=""){
				alert("새비밀번호 확인을 입력해주세요");
				$(".myPagePwd2").focus();
				return;
			}
		//비밀번호 변경이 없을시 
		$.ajax({
		url : "/updateUserInfo",
		data : {"id":userId, "pwd":pwd, "job":job, "email":email, "phone":phone, "addr":addr, "profile":profile, "username":userName, "nick":userNick},
		dataType : "json",
		type : "get",
		success : function(data){
			if(data == 0){
				alert("비밀번호를 확인해주세요.");
				$(".myPageMainPwd").val("");
				$(".myPageMainPwd").focus();
			}else{
				alert("회원정보가 수정되었습니다.");
				location.href="/";
			}
		}
	});
	}else{
		//비밀번호 까지 변경이 들어갈시
		if(!checkPwdBoolean){
			alert("비밀번호가 불일치 합니다.");
			$(".signUpPwd1").val("");
			$(".signUpPwd2").val("");
			$(".signUpPwd1").focus();
			return;
		}
		$.ajax({
			url : "/updateUserInfo",
			data : {"id":userId,"updatepwd":updatepwd, "pwd":pwd, "job":job, "email":email, "phone":phone,
					 "addr":addr, "profile":profile, "username":userName, "nick":userNick},
			dataType : "json",
			type : "get",
			success : function(data){
					if(data == 0){
						alert("새 비밀번호를  확인해 주세요.");
						$(".myPagePwd1").val("");
						$(".myPagePwd2").val("");
						$(".myPagePwd1").focus();
					}else{
						alert("회원정보가 수정되었습니다.");
						location.href="/";
					}
			}
		});
	}
});
$(".backHome").click(function(){
	location.href="/";
});
$(document).on("click",".CardStoreSet",function(){
	let aubumName = $(this).attr("value");
	console.log(aubumName);
	
	$("#location").attr("action","show_detail_album");
	$("#locationValue1").attr("name","userName");
	$("#locationValue1").val(userId);
	$("#locationValue2").attr("name","albumName");
	$("#locationValue2").val(aubumName);
	
	$("#location").submit();
});



//악기들 관리 하기
var aaa = "eee"
var test = {"asd":"qwe","qqq":"ewq","eee":"eee"};
console.log(test);
$.each(test, function(key,value){
	if(key == aaa){
		test[key] = "good~!~!";
	}
	console.log("키"+key+", 값"+value);
});
console.log(test);

//리뉴얼 마이페이지
//회원 정보 보기
$(document).on("click",".selectMyInfo",function(){
	console.log("asdasd");	
		
	$("#location").attr("action","selectUserInfo");
	$("#locationValue1").attr("name","userName");
	$("#locationValue1").val(sessionBoolean);
	
	$("#location").submit();
});


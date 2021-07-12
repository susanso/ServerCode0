/**
 * 
 */
//confirmModal 을 불러오는 함수
function callConfirmModal(e){
	let maskHeight = $(document).height();  
	let maskWidth = $(window).width();
	$('.composeModal').css({'width':maskWidth,'height':maskHeight});
	$(".composeModal").fadeIn(100);
	$(".composeModal").css("display","flex");
	$(".composeModalContent").html(e);
	//화면 중앙으로 이동
	var modalOffset = $(".composeModalBox").offset();
	console.log(modalOffset);
	$('html, body').scrollTop(modalOffset.top-300);
}
var downType = "";
var fileName = "";
var createUserName = "";
var cdTitle = "MySong";
$(".downLoadBox").click(function(){
	
	if($(this).attr("value") == "midi"){
		downType = "mid";
		var confirmMsg = "<div class='confirmMsgBox'>"+
								"<div class='downloadSubjectInputBox'>"+
									"<div class='downloadSubjectTitle'>MIDI의 제목을 정해주세요</div>"+
									//기본으로 제목을 fileName 값으로 넣는다.
									"<div><input type='text' class='downloadMP3Input' placeholder ="+fileName+"></div>"+
									"<div><p class='downloadSubjectInputAlert'></p></div>"+
								"</div>"+
								"<div class='confirmModalBtnBox'>"+
									"<div class='downFileBtn downloadMidi confirmModalBtn'><span class=''>확인</span></div>"+
									"<div class='confirmModalCancel confirmModalBtn'><span class=''>취소</span></div>"+
								"</div>"+
						 	"</div> ";
		callConfirmModal(confirmMsg);		
	}else if($(this).attr("value") == "mp3"){
		downType = "mp3";
		var confirmMsg = "<div class='confirmMsgBox'>"+
								"<div class='downloadSubjectInputBox'>"+
									"<div class='downloadSubjectTitle'>곡의 제목을 정해주세요</div>"+
									//기본으로 제목을 fileName 값으로 넣는다.
									"<div><input type='text' class='downloadMP3Input' placeholder ="+fileName+"></div>"+
									"<div><p class='downloadSubjectInputAlert'></p></div>"+
								"</div>"+
								"<div class='confirmModalBtnBox'>"+
									"<div class='downFileBtn downloadMp3 confirmModalBtn'><span class=''>확인</span></div>"+
									"<div class='confirmModalCancel confirmModalBtn'><span class=''>취소</span></div>"+
								"</div>"+
						 	"</div> ";
		callConfirmModal(confirmMsg);
	}else if($(this).attr("value") == "pdf"){
//		alert("준비중입니다.");
//		return;
		downType = "pdf";
		createUserName = sessionBoolean;
		var confirmMsg = "<div class='confirmMsgBox'>"+
								"<div class='downloadSubjectInputBox'>"+
									"<div class='downloadSubjectTitle'>악보의 제목을 정해주세요</div>"+
									"<div><input type='text' class='downloadSubjectInput'></div>"+
									"<div><p class='downloadSubjectInputAlert'></p></div>"+
								"</div>"+
								"<div class='downloadSubjectInputBox'>"+
									"<div class='downloadSubjectTitle'>곡의 제작자를 지정해 주세요</div>"+
									//기본으로 제작자 아이디를 createUserName 값으로 넣는다.
									"<div><input type='text' class='downloadCreateUserInput' placeholder ="+sessionBoolean+"></div>"+
									"<div><p class='downloadCreateUserAlert'></p></div>"+
								"</div>"+
								"<div class='confirmModalBtnBox'>"+
									"<div class='downFileBtn downloadPdf confirmModalBtn'><span class=''>확인</span></div>"+
									"<div class='confirmModalCancel confirmModalBtn'><span class=''>취소</span></div>"+
								"</div>"+
						 	"</div> "+
							"<div class='confirmMsgLoading'>"+
							"</div>";
		callConfirmModal(confirmMsg);
	}
});
//Modal을 닫을 경우
$(document).on("click",".confirmModalBtn",function(){
	if($(this).hasClass("composeModalClose")){
		$(this).css("display","none");
		$(".composeModal").fadeOut(100);
		$(".composeModalContent").html("");
	}else if($(this).hasClass("downFileBtn")){
		return;
	}else {
		$(".composeModal").fadeOut(100);
		$(".composeModalContent").html("");
	}
});
//다운 실행 하기
$(document).on("click",".downFileBtn",function(){
	//3개 버튼 전부 적용
	if($.trim(fileName) == ""){
		$(".downloadSubjectInputAlert").css("display","none");
		$(".downloadSubjectInputAlert").text("제목을 확인해주세요");
		$(".downloadSubjectInputAlert").fadeIn(200);
		return;
	}
	//pdf 다운 클릭시
	if($(this).hasClass("downloadPdf")){
		if($.trim(createUserName) == ""){
			$(".downloadCreateUserAlert").css("display","none");
			$(".downloadCreateUserAlert").text("제작자를 확인해주세요");
			$(".downloadCreateUserAlert").fadeIn(200);
			return;
		}
		//로딩 구현
		$(".confirmMsgBox").css("display","none");
		$(".confirmMsgLoading").fadeIn(200);
		
		console.log("아이디 : "+sessionBoolean);
		console.log("악보에 적힐 악보이름 : "+fileName);
		console.log("악보에 적힐 작곡가 이름 : "+createUserName);
		console.log("PDF이름 : "+fileName);
		console.log("원곡노래이름 : "+finalSongName);
		console.log("작곡가 : "+originSongInfo[0]);
		console.log("midi 파일 이름 : "+sampleString);
		console.log("GS 확인 여부 : "+gs);
		$.ajax({
			url: "/referenceDownFile",
			type: "GET",
			dataType: "json",
			//			아이디,                       악보에 적힐 악보이름,    악보에 적힐 작곡가 이름,     PDF이름, 원곡노래이름   , 원곡 작곡가,   midi 파일 이름
			data:{"sessionBoolean":sessionBoolean,"createSongName":fileName,"createUserName":createUserName,"originSongName":finalSongName,"originComposer":originSongInfo[0],"MidiName":sampleString,"GS":gs},
			success: function(data){
				if(data.result == "good"){
					console.log("로그 출력");
					console.log(data.values);
					//파일이름을 default로 만든다.
					fileName = data.fileName;
					console.log(fileName);
					location.href="download.do?downType="+downType+"&sessionBoolean="+sessionBoolean+"&fileName="+data.fileName+"&originFileName="+sampleString;	
				}else{
					console.log("비정상적인 접근입니다");	
				}
				//모달창 사라짐
				$(".composeModal").fadeOut(100);
				$(".composeModalContent").html("");
				$(".cdTitle").text(data.fileName);
			}
		});	
	}
	//mp3 다운클릭시
	if($(this).hasClass("downloadMp3")){
		console.log("downType : "+downType);
		console.log("fileName : "+fileName);
		console.log("sessionBoolean : "+sessionBoolean);
		
		location.href="download.do?downType="+downType+"&sessionBoolean="+sessionBoolean+"&fileName="+fileName+"&originFileName="+sampleString;	
		//모달창 사라짐
		$(".composeModal").fadeOut(100);
		$(".composeModalContent").html("");
		$(".cdTitle").text(fileName);
	}
	
	//midi 다운클릭시
	if($(this).hasClass("downloadMidi")){
		console.log("downType : "+downType);
		console.log("sampleMidi : "+sampleMidi);
		console.log("fileName : "+fileName);
		console.log("sessionBoolean : "+sessionBoolean);
		location.href="download.do?downType="+downType+"&sessionBoolean="+sessionBoolean+"&fileName="+fileName+"&originFileName="+sampleMidi;	
		//모달창 사라짐
		$(".composeModal").fadeOut(100);
		$(".composeModalContent").html("");
		$(".cdTitle").text(fileName);
	}
});
//악보 다운 곡 제작자 입력시
$(document).on("propertychange change paste input",".downloadSubjectInput,.downloadMP3Input",function(){
	fileName = $(this).val();
	if($.trim(fileName) == ""){
		$(".downloadSubjectInputAlert").text("");
	}
});
//악보 다운 파일 이름 입력시
$(document).on("propertychange change paste input",".downloadCreateUserInput",function(){	
	createUserName = $(this).val();
	if($.trim(createUserName) == ""){
		createUserName = sessionBoolean;
		$(".downloadCreateUserAlert").text("");
	}
});
$(document).on("click",".completeAlbum",function(){
	if($.trim(finalAlbumName) == ""){
		$(".finalAlbumNameAlert").css("display","none");
		$(".finalAlbumNameAlert").text("제목을 확인해주세요");
		$(".finalAlbumNameAlert").fadeIn(200);
		$('.finalAlbumName').text("");
		return;
		//로딩 추가
		
	}else if($.trim(finalAlbumName) != ""){
		$(".confirmMsgBox").html("");
		$(".confirmMsgBox").addClass("down_loading");
		//여기서 악보 이름 저장 DB 저장, insert 문 수정하기
		$.ajax({
			url:"insert_myList",
			type:'GET',
			data:{
				"user":userSession,"subject":finalAlbumName,"createdate":formatDate(new Date()),"composetype":"레퍼런스 기반 작곡",
				"songinfo1":originSongInfo[0],"songinfo2":originSongInfo[1],"albumcover":originAlbumCover
				},
				success: function(data){
				console.log(data);	
				
				//insert 성공후
				if(data.result == "success"){
					
					console.log("아이디 : "+sessionBoolean);
					console.log("악보에 적힐 악보이름 : "+finalAlbumName);
					console.log("악보에 적힐 작곡가 이름 : "+createUserName);
					console.log("PDF이름 : "+finalAlbumName);
					console.log("원곡노래이름 : "+finalSongName);
					console.log("작곡가 : "+finalSongArtist);
					console.log("midi 파일 이름 : "+sampleString.replaceAll(" ","_"));
					console.log("GS 확인 여부 : "+gs);
					
					if(finalAlbumName.indexOf(" ") > 1 ){
						finalAlbumName = finalAlbumName.replaceAll(" ","_");
					}
					console.log("replace 된 이름 : "+finalAlbumName);
					$.ajax({
						url: "/referenceDownFile",
						type: "GET",
						dataType: "json",
						//아이디, 악보에 적힐 악보이름, 악보에 적힐 작곡가 이름,PDF이름, 원곡노래이름   , 원곡 작곡가,   midi 파일 이름
						data:{"sessionBoolean":sessionBoolean,"createSongName":finalAlbumName,"originSongName":finalSongName,"originComposer":finalSongArtist,"MidiName":sampleString.replaceAll(" ","_"),"GS":gs},
						success: function(data){
							if(data.result == "good"){
								console.log("로그 출력");
								console.log(data.values);
								//파일이름을 default로 만든다.
								fileName = data.fileName;
								if(fileName.indexOf("_") > 1 ){
									fileName = fileName.replaceAll("_"," ");
								}
								//컨텐츠 변경
								$(".confirmMsgBox").removeClass("down_loading");
								let myworkLiStr = "";
								myworkLiStr += "<div class='downloadSubjectTitle'>앨범이름이 "+fileName+"으로 저장이 완료 되었습니다</div>";
								myworkLiStr += "<div class='confirmModalBtnBox'>";
								myworkLiStr += "<div class='locationMyList createAlbumBtn'>";
								myworkLiStr += "<span class=''>확인</span>";
								myworkLiStr += "</div></div>";
								$(".confirmMsgBox").html(myworkLiStr);
							}else{
								console.log("비정상적인 접근입니다");	
							}
						}
					});	//ajax end
				}else if(data.result == "fail"){ //if(data.result == "success") end
					//컨텐츠 변경
					$(".confirmMsgBox").removeClass("down_loading");
					let myworkLiStr = "";
					myworkLiStr += "<div class='downloadSubjectTitle' >"+finalAlbumName+"은 이미 존재 합니다</div>"+
									"<div class='confirmModalBtnBox'>"+
										"<div class='completeAlbumCancel createAlbumBtn'>"+
											"<span class=''>확인</span>"+
										"</div>"+
									"</div>";
					$(".confirmMsgBox").html(myworkLiStr);			
				} 
			}//success end
		}); //main ajax end
	} // else if($.trim(finalAlbumName) != "") end
});
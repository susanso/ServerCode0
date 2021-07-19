/**
 * 
 */
	var downType = "";
	var fileName = "";
	var createUserName = "";
	var cdTitle = "MySong";
$(".downLoadBox").click(function(){
	let downPass = false;
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

//악보다운 실행 하기
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
		$.ajax({
			url: "/downloadFile",
			type: "GET",
			dataType: "json",
			data:{"sessionBoolean":sessionBoolean,"user":createUserName,"fileName":fileName,"keyword":keyword,"createType":"mood"},
			success: function(data){
				if(data.result == "good"){
					//파일이름을 default로 만든다.
					fileName = data.fileName;
					
					location.href="download.do?downType="+downType+"&sessionBoolean="+sessionBoolean+"&fileName="+data.fileName+"&originFileName=MyMelody";	
				}else{
					console.log("비정적인 접근입니다");	
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
		location.href="download.do?downType="+downType+"&sessionBoolean="+sessionBoolean+"&fileName="+fileName+"&originFileName=MySong";	
		//모달창 사라짐
		$(".composeModal").fadeOut(100);
		$(".composeModalContent").html("");
		$(".cdTitle").text(fileName);
	}
	
	//midi 다운클릭시
	if($(this).hasClass("downloadMidi")){
		location.href="download.do?downType="+downType+"&sessionBoolean="+sessionBoolean+"&fileName="+fileName+"&originFileName=MySong";	
		//모달창 사라짐
		$(".composeModal").fadeOut(100);
		$(".composeModalContent").html("");
		$(".cdTitle").text(fileName);
	}
});
var finalAlbumName = "";
var albumCover ="defaultAlbum";
$(document).on("propertychange change paste input keyup",".finalAlbumName",function(e){
	finalAlbumName = $(this).val();
	console.log(finalAlbumName);
	$(".finalAlbumNameAlert").fadeOut(200);
	
	if(e.keyCode == 13){
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
			console.log("키워드 : "+keywordTitle)
			console.log("장르 : "+genreTitle)
			//여기서 악보 이름 저장 DB 저장, insert 문 수정하기
			$.ajax({
				url:"insert_myList",
				type:'GET',
				data:{
					"user":sessionBoolean,"subject":finalAlbumName,"createdate":formatDate(new Date()),"composetype":"분위기 기반 작곡",
					"songinfo1":genreTitle,"songinfo2":keywordTitle,"albumcover":albumCover
					},
					success: function(data){
					console.log(data);	
					
					//insert 성공후
					if(data.result == "success"){
						
						console.log("아이디 : "+sessionBoolean);
						console.log("앨범 이름 : "+finalAlbumName);
						if(finalAlbumName.indexOf(" ") > 1 ){
							finalAlbumName = finalAlbumName.replaceAll(" ","_");
						}
						console.log("replace 된 이름 : "+finalAlbumName);
						$.ajax({
							url: "/downloadFile",
							type: "GET",
							dataType: "json",
							//아이디, 악보에 적힐 악보이름, 악보에 적힐 작곡가 이름,PDF이름, 원곡노래이름   , 원곡 작곡가,   midi 파일 이름
							data:{"user":sessionBoolean,"fileName":finalAlbumName,"keyword":keyword},
							success: function(data){
								if(data.result == "good"){
									console.log("로그 출력");
									console.log(data.values);
									//파일이름을 default로 만든다.
									fileName = data.fileName;
									console.log(fileName);
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
						myworkLiStr += "<div class='downloadSubjectTitle'>"+finalAlbumName+"은 이미 존재 합니다</div>"+
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
		console.log("키워드 : "+keywordTitle)
		console.log("장르 : "+genreTitle)
		//여기서 악보 이름 저장 DB 저장, insert 문 수정하기
		$.ajax({
			url:"insert_myList",
			type:'GET',
			data:{
				"user":sessionBoolean,"subject":finalAlbumName,"createdate":formatDate(new Date()),"composetype":"분위기 기반 작곡",
				"songinfo1":genreTitle,"songinfo2":keywordTitle,"albumcover":albumCover
				},
				success: function(data){
				console.log(data);	
				
				//insert 성공후
				if(data.result == "success"){
					
					console.log("아이디 : "+sessionBoolean);
					console.log("앨범 이름 : "+finalAlbumName);
					if(finalAlbumName.indexOf(" ") > 1 ){
						finalAlbumName = finalAlbumName.replaceAll(" ","_");
					}
					console.log("replace 된 이름 : "+finalAlbumName);
					$.ajax({
						url: "/downloadFile",
						type: "GET",
						dataType: "json",
						//아이디, 악보에 적힐 악보이름, 악보에 적힐 작곡가 이름,PDF이름, 원곡노래이름   , 원곡 작곡가,   midi 파일 이름
						data:{"user":sessionBoolean,"fileName":finalAlbumName,"keyword":keyword},
						success: function(data){
							if(data.result == "good"){
								console.log("로그 출력");
								console.log(data.values);
								//파일이름을 default로 만든다.
								fileName = data.fileName;
								console.log(fileName);
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
					myworkLiStr += "<div class='downloadSubjectTitle'>"+finalAlbumName+"은 이미 존재 합니다</div>"+
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

$(document).on("click",".completeAlbumCancel",function(){
	//앨범 이름 초기화
	finalAlbumName ="";
	$(".composeModal").fadeOut(100);
	$(".composeModalContent").html("");
});
$(document).on("click",".locationMyList",function(){
//	location.href="show_myList?username="+userSession;
	//post로 페이지 이동
	$("#location").attr("action","show_myList");
	$("#locationValue1").attr("name","username");
	$("#locationValue1").val(sessionBoolean);
	
	$("#location").submit();
});
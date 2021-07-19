/**
 * 
 */
//리스트 가져오는 함수
function callMyWorkList(list){
	let viewMyWorkList = "";
	list.forEach(function(element){
	    console.log(element);
		console.log(element.albumcover);
		if(element.composetype == "레퍼런스 기반 작곡"){
			viewMyWorkList +="<div class='contentMusicBox composeReference'>";	
		}else{
			viewMyWorkList +="<div class='contentMusicBox composeKeyword'>";	
		}
				viewMyWorkList +="<div class='contentMusicInfo'>"+
									"<div class='contentMusicImg' style='background: url(../../image/album_cover/"+element.albumcover+".jpg) 0% 0% / cover'></div>"+
									"<div class='contentMusicTextBox'>"+
										"<div class='date'>"+element.createdate+"</div>"+
										"<div class='contentMusicTitle'>"+element.subject+"</div>"+
										"<div class='contentMusicUser'>"+element.songinfo1+" / "+element.songinfo2+"</div>"+
										"<div class='content_musicUpdate'>판매하기</div>"+
									"</div>"+
								"</div>"+
								"<div class='gridDivBox'>"+
									"<div class='deleteButtonBox'>"+
										"<div class='deleteButton' value="+element.subject+"></div>"+
									"</div>"+
									"<div class='cardDownBox'>"+
										"<div class='downBox pdf' value="+element.subject+"></div>"+
										"<div class='downBox mp3' value="+element.subject+"></div>"+
										"<div class='downBox midi' value="+element.subject+"></div>"+
									"</div>"+
								"</div>"+
							"</div>";
	});
	$(".workListcontentBox").html(viewMyWorkList);
};


$('.nav_title').click(function(){
	let thx = $(this);
	
	$('.nav_title').removeClass("navListActive");
	thx.addClass("navListActive");
	//content 변경
	$(".nav_content").css("display","none");
	if(thx.hasClass("workList")){
		//내 작곡 목록 가져오기
		$.ajax({
			url: "click_show_myList",
			type: "GET",
			dataType: "json",
			data:{"username":sessionBoolean},
			success: function(data){
					let myList = data.list;
					console.log(myList);
					callMyWorkList(myList);
				}
		});
		
		
		$("#workList").fadeIn(200);

		
	}else if(thx.hasClass("buyList")){
		$("#buyList").fadeIn(200);
	}else if(thx.hasClass("likeList")){
		$("#likeList").fadeIn(200);
	}else if(thx.hasClass("sellList")){
		$("#sellList").fadeIn(200);
	}
});
$(".selectOptionBox").click(function(){
	let thx = $(this);
	if(thx.hasClass("navListActive")){//버튼을 눌러 활성화가 되어있는지 되어있다면 내림차순으로 보여준다
		//-> 있으면
		if(thx.find(".nav_title_arrowBtn").hasClass("arrowBtn_slideUp")){
			thx.find(".nav_title_arrowBtn").removeClass("arrowBtn_slideUp");
		}else{
			$(".nav_title_arrowBtn").removeClass("arrowBtn_slideUp");
			thx.find(".nav_title_arrowBtn").addClass("arrowBtn_slideUp");
		}
//		thx.removeClass("navListActive");
		
	}else{//-> 없으면
		$(".nav_title_arrowBtn").removeClass("arrowBtn_slideUp");
		$(".selectOptionBox").removeClass("navListActive");
		thx.addClass("navListActive");
		
	}
	
	//화살표 돌아가기
//	if(thx.find(".nav_title_arrowBtn").hasClass("arrowBtn_slideUp")){
//		thx.find(".nav_title_arrowBtn").removeClass("arrowBtn_slideUp");
//	}else{
//		$(".nav_title_arrowBtn").removeClass("arrowBtn_slideUp");
//		thx.find(".nav_title_arrowBtn").addClass("arrowBtn_slideUp");
//		
//	}
	
	
});


function callConfirmModal(e){
	let maskHeight = $(document).height();  
	let maskWidth = $(window).width();
	$('.composeModal').css({'width':maskWidth,'height':maskHeight});
	$(".composeModal").fadeIn(100);
	$(".composeModal").css("display","flex");
	$(".composeModalContent").html(e);
	//화면 중앙으로 이동
	var modalOffset = $(".composeModalBox").offset();
	$('html, body').scrollTop(modalOffset.top-300);
}


//다운로드 이미지 클릭시
$(document).on("click",".cardDownBox>.downBox",function(){
	let fileName = $(this).attr("value");
	let downType = "";
	if($(this).hasClass("pdf")){
		downType = "pdf";
	}else if($(this).hasClass("mp3")){
		downType = "mp3";
	}else if($(this).hasClass("midi")){
		downType = "mid";
	}
	
	console.log(downType);
	console.log(fileName);
	
	location.href="download.do?downType="+downType+"&sessionBoolean="+sessionBoolean+"&fileName="+fileName+"&originFileName="+fileName;
	
});
var deleteFileName ="";
$(document).on("click",".deleteButton",function(){
	deleteFileName = $(this).attr("value");
	console.log(deleteFileName);
	//모달창 보여주기
	var confirmMsg = "<div class='confirmMsgBox'>"+
								"<div class='downloadSubjectInputBox'>"+
									"<div class='downloadSubjectTitle'><div> ' "+deleteFileName+" ' </div><div class='deleteMargin'>삭제 하시겠습니까?</div></div>"+
								"</div>"+
								"<div class='confirmModalBtnBox'>"+
									"<div class='deleteAlbum deleteAlbumBtn'><span class=''>삭제</span></div>"+
									"<div class='deleteAlbumCancel deleteAlbumBtn'><span class=''>취소</span></div>"+
								"</div>"+
						 	"</div> ";
	callConfirmModal(confirmMsg);
});

//모달창 닫기
$(document).on("click",".deleteAlbumCancel",function(){
	$(".composeModal").fadeOut(100);
	$(".composeModalContent").html("");
	
});
//삭제 확정할시
$(document).on("click",".deleteAlbum",function(){
	$.ajax({
		url:"delete_myList",
		type:"GET",
		datatype:"json",
		data:{"userId":sessionBoolean,"project":deleteFileName},
		success:function(data){
			console.log(data.fileResult);
			var confirmMsg = "<div class='confirmMsgBox'>"+
								"<div class='downloadSubjectInputBox'>"+
									"<div class='downloadSubjectTitle'><div class='deleteMargin'>삭제 되었습니다</div></div>"+
								"</div>"+
								"<div class='confirmModalBtnBox'>"+
									"<div class='replaceWorkList deleteAlbumBtn'><span class=''>확인</span></div>"+
								"</div>"+
						 	"</div> ";
			callConfirmModal(confirmMsg);
		}
	})
});
//리스트 다시 보여주기
$(document).on("click",".replaceWorkList",function(){
	$.ajax({
			url: "click_show_myList",
			type: "GET",
			dataType: "json",
			data:{"username":sessionBoolean},
			success: function(data){
					let myList = data.list;
					console.log(myList);
					console.log(myList.albumcover);
					callMyWorkList(myList);
					
					$(".composeModal").fadeOut(100);
					$(".composeModalContent").html("");
				}
			});
})
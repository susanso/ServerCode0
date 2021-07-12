/**
 * 
 */
//커스텀 모달
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
$(document).on("click",".CardDownBox>.downBox",function(){
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
		data:{"userId":userId,"project":deleteFileName},
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
			data:{"username":userId},
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


<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
  <%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- favicon -->
<link rel="apple-touch-icon" href="../image/favicon/favicon_ipad.png" type="image/png"/>
<link rel="shortcut icon" href="../image/favicon/favicon_pc.png" type="image/png">
<!-- 제이쿼리 -->
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- <link rel="stylesheet" type="text/css" href="../../css/compose/composeMakeSong.css"> -->
<!-- 부트스트랩 -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<!-- Swiper -->
<link rel="stylesheet" type="text/css" href="https://unpkg.com/swiper/swiper-bundle.min.css">
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<!-- 음악 wavesufer  -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/wavesurfer.js/1.1.10/wavesurfer.min.js"></script>
<!-- 외부css링크 -->
<link rel="stylesheet" type="text/css" href="../../css/market/market.css">
<title>Insert title here</title>
</head>
<body style="background: #000;color: #f2f2f3">
	<!--top-->
		<%@ include file="../top.jsp" %>
	
	<!--content -->
		<div class="scrollContainer">
			<div class="marketMainContainer">
				<div class="navUl">
					<div class="navList mainHome navListActive">
						Home
					</div>
					<div class="navList feedPage">
						Feed					
					</div>
					<div class="navList allListPage">
						<div>Album</div> <div class="nav_title_arrowBtn"></div>					
					</div>
					<div class="allListPage_option">
						<div class="albumOption navSubList searchKeywordTitle">
							<div class="searchTagBox">
								<div class="search_word"></div>
								<input type="text" class="searchTag" placeholder="Find a word...">
							</div>
							<div class="searchTagBox">
								<p class="searchResultTitle">real time result</p>
								<div class="searchResultBox">
<!-- 									<div class='searchResult_keyword'> -->
<!-- 										<div class='result_keyword'>고요한</div> -->
<!-- 										<div class='add_btn'>+</div>	 -->
<!-- 									</div> -->
								</div>
							</div>
						</div>
						<div class="albumOption navSubList navSubGenre selectOptionTitle_box">
							<div><span> - </span>Genre </div>
							<div class="nav_title_arrowBtn"></div>
						</div>
						<!-- Genre Option  -->
						<div class="navSubGenreContent">
							<div class="navdetailList selectGenreTitle">
								<div>POP</div>
								<input type="checkbox" id='pop' class="genreCheckBox" />
								<label for="pop" class="selectGenreToggle">
									POP
								</label>
							</div>
							<div class="navdetailList selectGenreTitle">
								<div>K-POP</div>
								<input type="checkbox" id='kpop' class="genreCheckBox" />
								<label for="kpop" class="selectGenreToggle">
									K-POP
								</label>
							</div> 
							<div class="navdetailList selectGenreTitle">
								<div>Dance</div>
								<input type="checkbox" id='dance' class="genreCheckBox" />
								<label for="dance" class="selectGenreToggle">
									Dance
								</label>
							</div>
							<div class="navdetailList selectGenreTitle">
								<div>Hip-Hop</div>
								<input type="checkbox" id='hiphop' class="genreCheckBox" />
								<label for="hiphop" class="selectGenreToggle">
									Hip-Hop
								</label>
							</div>
							<div class="navdetailList selectGenreTitle">
								<div>Children</div>
								<input type="checkbox" id='children' class="genreCheckBox" />
								<label for="children" class="selectGenreToggle">
									Children
								</label>
							</div>
							<div class='navdetailList selectGenreTitle'>
								<div>R&B/Soul</div>
								<input type='checkbox' id='R&B' class='genreCheckBox' />
								<label for='R&B' class='selectGenreToggle'>
									R&B/Soul
								</label>
							</div>
							<div class='navdetailList selectGenreTitle'>
								<div>Rock</div>
								<input type="checkbox" id='rock' class="genreCheckBox" />
								<label for="rock" class="selectGenreToggle">
									Rock
								</label>
							</div>
							<div class='navdetailList selectGenreTitle'>
								<div>Reggae</div>
								<input type="checkbox" id='reggae' class="genreCheckBox" />
								<label for="reggae" class="selectGenreToggle">
									Reggae
								</label> 
							</div>
							<div class='navdetailList selectGenreTitle'>
								<div>Classical</div>
								<input type="checkbox" id='classical' class="genreCheckBox" />
								<label for="classical" class="selectGenreToggle">
									Classical
								</label>
							</div>
							<div class='navdetailList selectGenreTitle'>
								<div>Blues</div>
								<input type="checkbox" id='blues' class="genreCheckBox" />
								<label for="blues" class="selectGenreToggle">
									Blues
								</label>
							</div>
							<div class='navdetailList selectGenreTitle'>
								<div>Country</div>
								<input type="checkbox" id='country' class="genreCheckBox" />
								<label for="country" class="selectGenreToggle">
									Country
								</label>
							</div>
							<div class='navdetailList selectGenreTitle'>
								<div>Electronic</div>
								<input type="checkbox" id='electronic' class="genreCheckBox" />
								<label for="electronic" class="selectGenreToggle">
									Electronic
								</label>
							</div>
							<div class='navdetailList selectGenreTitle'>
								<div>Jazz</div>
								<input type="checkbox" id='jazz' class="genreCheckBox" />
								<label for="jazz" class="selectGenreToggle">
									Jazz
								</label>
							</div>
							<div class='navdetailList selectGenreTitle'>
								<div>Latin</div>
								<input type="checkbox" id='latin' class="genreCheckBox" />
								<label for="latin" class="selectGenreToggle">
									Latin
								</label>
							</div>
							<div class='navdetailList selectGenreTitle'>
								<div>ETC</div>
								<input type="checkbox" id='ect' class="genreCheckBox" />
								<label for="ect" class="selectGenreToggle">
									ETC
								</label>
							</div>
						</div>
						<div class="albumOption navSubList navSubKeyword selectOptionTitle_box">
							<div><span> - </span>Keyword</div>
							<div class="nav_title_arrowBtn"></div>
						</div>
						<!-- Keyword Option  -->
						<div class="navSubKeywordContent">
							
						</div>
						<div class="albumOption navSubList navSubPrice selectOptionTitle_box">
							<div><span> - </span>Price</div>
							<div class="nav_title_arrowBtn"></div>
						</div>
						<!-- Price Option  -->
						<div class="navSubPriceContent">
							
						</div>
						<div class="albumOption navSubList navSubInstrument selectOptionTitle_box">
							<div><span> - </span>Instrument</div>
							<div class="nav_title_arrowBtn"></div>
						</div>
					</div>
					<!--Play List -->
					<div class="navList playListPage">
						<div>Play List</div> <div class="nav_title_arrowBtn"></div>					
					</div>
					<div class="playListOption playListPage_option">
						<div class="navSubList selectOptionTitle_box">
							<div>나의 리스트 </div>
						</div>
						<div class="playListOption navSubList selectOptionTitle_box">
							<div>테마 </div>
						</div>
					</div>
					<!--Play List end-->
				</div>
				<div class="contentContainer">
<!-- 				<div class="navContent"> -->
					<div class="optionPage homeList">
						<div class="swiper-container">
							<div class="swiper-wrapper">
								<a href="#" class="swiper-slide"><img alt="banner1" src="/image/market/test/banner1.jpg" width="100%" ></a>
								<a href="#" class="swiper-slide"><img alt="banner2" src="/image/market/test/banner2.jpg" width="100%" ></a>
								<a href="#" class="swiper-slide"><img alt="banner3" src="/image/market/test/banner3.jpg" width="100%" ></a>
							</div>
							<!-- Add Pagination -->
							<div class="swiper-pagination"></div>
							<!-- Add Arrows -->
							<button type="button" class="swiper-button-next bannerBtn"></button>
							<button type="button" class="swiper-button-prev bannerBtn"></button>
						</div>
						<div class="fireContainer">
							<div class="showListBox">
								<div class="newListContainer">
									<div class="titleBox">
										<div class="ContainerTitle">
											Promotion
										</div>
										<div class="arrowBox">
											<div class="arrowBtn arrowPrev"></div>
											<div class="arrowBtn arrowNext"></div>
										</div>
									</div>
									<div class="cardListContent newAlbumList">
									</div>
								</div>
								<div class="genreListContainer">
									<div class="ContainerTitle">
										Genre
									</div>
									<div class="genreListContent">
										<div class="genreListTitle">POP</div>
										<div class="genreListTitle">K-POP</div>
										<div class="genreListTitle">Dance</div>
										<div class="genreListTitle">Hip-Hop</div>
										<div class="genreListTitle">R&B/Soul</div>
										<div class="genreListTitle">New Age</div>
										<div class="genreListTitle">Children</div>
										<div class="genreListTitle">Rock</div>
										<div class="genreListTitle">Reggae</div>
										<div class="genreListTitle">Blues</div>
										<div class="genreListTitle">Classical</div>
										<div class="genreListTitle">Country</div>
										<div class="genreListTitle">Electronic</div>
										<div class="genreListTitle">Jazz</div>
										<div class="genreListTitle">Latin</div>
										<div class="genreListTitle">ETC</div>
									</div>
								</div>
							</div>
							<div class="famousListContainer">
								<div class="ContainerTitle">
									Hot Albums
								</div>
								<div class="famousListContent"></div>
							</div>
						</div>
						<div class="emptyArea">
						</div>
						<div class="searchContainer">
							<div class="keywordContainer">
								<div class="searchInfoBox">
									<div class="ContainerTitle">
										Keyword
									</div>
									<div class="searchBarInputBox">
										<div class="searchImg"></div>
										<input type="text" placeholder="Search" class="searchBar">
									</div>
								</div>
								<div class="keywordContent">
									<div class="keywordListTitle">귀여운</div>
									<div class="keywordListTitle">즐거운</div>
									<div class="keywordListTitle">당당한</div>
									<div class="keywordListTitle">로맨틱한</div>
									<div class="keywordListTitle">신나는</div>
									<div class="keywordListTitle">가벼운</div>
									<div class="keywordListTitle">달콤한</div>
									<div class="keywordListTitle">사랑스러운</div>
									<div class="keywordListTitle">행복한</div>
									<div class="keywordListTitle">편안한</div>
									<div class="keywordListTitle">졸린</div>
									<div class="keywordListTitle">몽환적인</div>
									<div class="keywordListTitle">레트로한</div>
									<div class="keywordListTitle">고조된</div>
									<div class="keywordListTitle">부드러운</div>
									<div class="keywordListTitle">열정적인</div>
									<div class="keywordListTitle">섹시한</div>
									<div class="keywordListTitle">긴장한</div>
									<div class="keywordListTitle">터프한</div>
									<div class="keywordListTitle">블루지한</div>
									<div class="keywordListTitle">그루비한</div>
									<div class="keywordListTitle">슬픈</div>
									<div class="keywordListTitle">감성적인</div>
									<div class="keywordListTitle">무서운</div>
									<div class="keywordListTitle">침착한</div>
									<div class="keywordListTitle">무기력한</div>
									<div class="keywordListTitle">무거운</div>
									<div class="keywordListTitle">추억에 빠진</div>
									<div class="keywordListTitle">처참한</div>
									<div class="keywordListTitle">울적한</div>
									<div class="keywordListTitle">황폐한</div>
									<div class="keywordListTitle">신나는</div>
									<div class="keywordListTitle">편안한</div>
									<div class="keywordListTitle">긴장한</div>
									<div class="keywordListTitle">무거운</div>
								</div>
							</div>
							<div class="subADContainer">
								<div class="subADContainerTitle">
									노래 판매는 어떻게 하나요?
								</div>
								<div class="sellMyMusicBtn">판매하기</div>
							</div>
						</div>
	<!-- 					<div class="searchResultContainer"> -->
	<!-- 						<div class="ContainerTitle"> -->
	<!-- 								Search Result -->
	<!-- 						</div> -->
	<!-- 						<div class="searchOptionContent"> -->
	<!-- 						</div> -->
	<!-- 						<div class="searchResultContent"> -->
	<!-- 						</div> -->
	<!-- 					</div> -->
						
						<!--반복문 돌리기 -->
	<!-- 					<div class='sellCardContainer'> -->
	<!-- 						<div class='albumImg' style='background: url(../../image/album_cover/emoHiphop.jpg) 0% 0% / cover'></div>	 -->
	<!-- 						<div class='defaultInfo'> -->
	<!-- 							<div class='sellerInfo'> -->
	<!-- 								<div class='songTitle'>asdkmasu main</div> -->
	<!-- 								<div class='sellerName'>susansok</div> -->
	<!-- 							</div> -->
	<!-- 							<div class='downInfo'> -->
	<!-- 								<div class='downCount'>2,347 Listen</div> -->
	<!-- 								<div class='sellerPrice'>2,900 ₩</div>	 -->
	<!-- 							</div> -->
	<!-- 						</div> -->
	<!-- 						<div class='reSetting'>수정</div> -->
	<!-- 					</div> -->
						<!--여기까지 돌리기 -->
						
						<div class="ContainerTitle">
							New Album
						</div>
						<div class="cardListContent promotionList"></div>
						<div class="banner_AISM_service">
							<div class="AISM_ADContainerTitle">AISM에서 작곡해봤어?</div>
							<div class="sellMyMusicBtn">작곡하기</div>
						</div>
						<div class="best_in_AISM">
							<div class="best_in_AISM_list"> 
								<div class="ContainerTitle">
									Best Keyword Album in AISM's Compose
								</div>
								<div class="famousListContent"></div>
							</div>
							<div class="best_in_AISM_list">
								<div class="ContainerTitle">
									Best Reference Album in AISM's Compose 
								</div>
								<div class="famousListContent"></div>
							</div>
						</div>
						<div class="ContainerTitle">
							AISM's Pick Album
						</div>
						<div class="cardListContent promotionList"></div>
						
						
					</div>
					<!-- -------- -->
					<div class="optionPage feedList">
						
					</div>
					<div class="optionPage allList">
						<div class="ContainerTitle">
							Genre
						</div>
						<div class="allListNav">
							<div class="row_Title">All</div>
							<div class="row_Title">POP</div>
							<div class="row_Title">K-POP</div>
							<div class="row_Title">Dance</div>
							<div class="row_Title">Hip-Hop</div>
							<div class="row_Title">R&B/Soul</div>
							<div class="row_Title">New Age</div>
							<div class="row_Title">Children</div>
							<div class="row_Title">Rock</div>
							<div class="row_Title">Reggae</div>
							<div class="row_Title">Blues</div>
							<div class="row_Title">Classical</div>
							<div class="row_Title">Country</div>
							<div class="row_Title">Electronic</div>
							<div class="row_Title">Jazz</div>
							<div class="row_Title">Latin</div>
							<div class="row_Title">ETC</div>
						</div>
						<div class="ContainerTitle">
								KeyWord
						</div>
						<div class="allListNav">
							<div class="row_keywordTitle">All</div>
							<div class="row_keywordTitle">귀여운</div>
							<div class="row_keywordTitle">즐거운</div>
							<div class="row_keywordTitle">당당한</div>
							<div class="row_keywordTitle">로맨틱한</div>
							<div class="row_keywordTitle">신나는</div>
							<div class="row_keywordTitle">가벼운</div>
							<div class="row_keywordTitle">달콤한</div>
							<div class="row_keywordTitle">사랑스러운</div>
							<div class="row_keywordTitle">행복한</div>
							<div class="row_keywordTitle">편안한</div>
							<div class="row_keywordTitle">졸린</div>
							<div class="row_keywordTitle">몽환적인</div>
							<div class="row_keywordTitle">레트로한</div>
							<div class="row_keywordTitle">고조된</div>
							<div class="row_keywordTitle">부드러운</div>
							<div class="row_keywordTitle">열정적인</div>
							<div class="row_keywordTitle">섹시한</div>
							<div class="row_keywordTitle">긴장한</div>
							<div class="row_keywordTitle">터프한</div>
							<div class="row_keywordTitle">블루지한</div>
							<div class="row_keywordTitle">그루비한</div>
							<div class="row_keywordTitle">슬픈</div>
							<div class="row_keywordTitle">감성적인</div>
							<div class="row_keywordTitle">무서운</div>
							<div class="row_keywordTitle">침착한</div>
							<div class="row_keywordTitle">무기력한</div>
							<div class="row_keywordTitle">무거운</div>
							<div class="row_keywordTitle">추억에 빠진</div>
							<div class="row_keywordTitle">처참한</div>
							<div class="row_keywordTitle">울적한</div>
							<div class="row_keywordTitle">황폐한</div>
							<div class="row_keywordTitle">신나는</div>
							<div class="row_keywordTitle">편안한</div>
							<div class="row_keywordTitle">긴장한</div>
							<div class="row_keywordTitle">무거운</div>
						</div>
						<div class="selectOptionContainer">
							<div class="ContainerTitle">
								Select Option 
							</div>
							<div class="selectOptionContent">
								<div class="selectOptionLi selected_genre">
									<span>K-POP</span>
									<span class="cancelSelectBtn"></span>
								</div>
								<div class="selectOptionLi selected_keyword">
									<span>신나는</span>
									<span class="cancelSelectBtn"></span>
								</div>
								<!-- 이거로 for문써라 -김성은 -->
								<div class='selectOptionLi selected_keyword'>
									<span>긴장한</span>
									<span class='cancelSelectBtn'></span>
								</div>
								
							</div>
						</div>
						
						<div class="allListContent"></div>
					</div>
					<div class="optionPage playList_list">
						<div class="playList_default_container">
							<div class='playList_default_box'>
								<div class=''>
									<div class='playList_default_img' style='background: url(../../image/album_cover/emoHiphop.jpg) 0% 0% / cover'></div>
									<div class='playList_default_title'>
										집중용 가요 반주곡
									</div>
									<div class='playList_default_content'>
										가사없는 감미로운 반주곡들과 편안하게 집중하세요.
									</div>
								</div>
							</div>
							<div class='playList_default_box'>
								<div class='playList_default_img' style='background: url(../../image/album_cover/emoHiphop.jpg) 0% 0% / cover'>
								</div>
								<div class='playList_default_title'>
									집중용 가요 반주곡
								</div>
								<div class='playList_default_content'>
									가사없는 감미로운 반주곡들과 편안하게 집중하세요.
								</div>
							</div>
							<div class='playList_default_box'>
								<div class='playList_default_img' style='background: url(../../image/album_cover/emoHiphop.jpg) 0% 0% / cover'>
								</div>
								<div class='playList_default_title'>
									집중용 가요 반주곡
								</div>
								<div class='playList_default_content'>
									가사없는 감미로운 반주곡들과 편안하게 집중하세요.
								</div>
							</div>
							<div class='playList_default_box'>
								<div class='playList_default_img' style='background: url(../../image/album_cover/emoHiphop.jpg) 0% 0% / cover'>
								</div>
								<div class='playList_default_title'>
									집중용 가요 반주곡
								</div>
								<div class='playList_default_content'>
									가사없는 감미로운 반주곡들과 편안하게 집중하세요.
								</div>
							</div>
							<div class='playList_default_box'>
								<div class='playList_default_img' style='background: url(../../image/album_cover/emoHiphop.jpg) 0% 0% / cover'>
								</div>
								<div class='playList_default_title'>
									집중용 가요 반주곡
								</div>
								<div class='playList_default_content'>
									가사없는 감미로운 반주곡들과 편안하게 집중하세요.
								</div>
							</div>
							<div class='playList_default_box'>
								<div class='playList_default_img' style='background: url(../../image/album_cover/emoHiphop.jpg) 0% 0% / cover'>
								</div>
								<div class='playList_default_title'>
									집중용 가요 반주곡
								</div>
								<div class='playList_default_content'>
									가사없는 감미로운 반주곡들과 편안하게 집중하세요.
								</div>
							</div>
							<div class='playList_default_box'>
								<div class='playList_default_img' style='background: url(../../image/album_cover/emoHiphop.jpg) 0% 0% / cover'>
								</div>
								<div class='playList_default_title'>
									집중용 가요 반주곡
								</div>
								<div class='playList_default_content'>
									가사없는 감미로운 반주곡들과 편안하게 집중하세요.
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
	<!--footer -->
<%-- 		<%@ include file="../footer.jsp"%> --%>

	<script src="../../../js/market/playList/playList.js"></script>
	<script src="../../../js/market/market.js"></script>
	
</body>
</html>
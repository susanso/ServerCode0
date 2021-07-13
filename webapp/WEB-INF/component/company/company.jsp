<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>AISM - Company</title>
<!-- favicon -->
<link rel="apple-touch-icon" href="../image/favicon/favicon_ipad.png" type="image/png"/>
<link rel="shortcut icon" href="../image/favicon/favicon_pc.png" type="image/png">
<!-- 제이쿼리 -->
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<!-- ajax -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 부트스트랩 -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 스크롤 이벤트 -->
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<!-- css -->
<link rel="stylesheet" type="text/css" href="../../css/company/company.css">
</head>
<body style="background-color: #000; color: #f2f2f3">
	
		<%@ include file="../../component/top.jsp" %>
		<div class="whoAISM_container">
		<div class="company_titleContainer">
			<div class="company_title">What AISM can make</div>
			<div class="company_title">Co-operation</div>
			<div class="company_title">Contact</div>
			<div class="company_title">History</div>
			
		</div>
		<div class="whoAISM" style="display: none;" >
			<div class="company-contentTitle"> What AISM can make </div>
			<div class="aboutAISMPage">
				<p>AISM(아이즘)은 인공지능 기술과 음악이론을 융합한 새로운 작곡 플랫폼 입니다</p>
				<p>AISM에서는 “좋은 음악”이라는 주관적인 기준을 사용자 빅데이터를 기반으로 빠르게 만족 시킬수 있습니다.</p>
				<p>AISM은 음악을 좋아하는 모든 사람들의 새로운 “창작의 공간” 입니다.</p>
				<p>AISM에서는 누구나 본인의 감성을 익숙하면서도 색다른 “멋진 음악으로 탄생” 시킬수 있습니다.</p>
			</div>
		</div>
	</div>
	
	<div class="cooperation_container">
		<div class="cooperation_companyBox"  >
			<div class="company-contentTitle"> Co-operation </div>
			<div class="cooperation_companyList">
				<img class="cooperation_company" src="../../image/company/cooperation/Bfamily.png">
				<img class="cooperation_company" src="../../image/company/cooperation/CJ.png">
				<img class="cooperation_company" src="../../image/company/cooperation/ehwa.png">
				<img class="cooperation_company" src="../../image/company/cooperation/gale.png">
				<img class="cooperation_company" src="../../image/company/cooperation/genie.png">
				<img class="cooperation_company" src="../../image/company/cooperation/gom.png">
				<img class="cooperation_company" src="../../image/company/cooperation/jaedam.png">
				<img class="cooperation_company" src="../../image/company/cooperation/MT.png">
				<img class="cooperation_company" src="../../image/company/cooperation/wbaba.png">
			</div>
		</div>
	</div>
	
	<div class="contact_container">
		<form action="" method="get">
			<div class="contact_form">
				<div class="company-contentTitle"> Contact </div>
				<div class="contact_form_inputBox">
					<input type="text" name="userName" class="contact_inputBox userName"  placeholder="What is your name?">
<!-- 				</div> -->
<!-- 				<div class="contact_form_inputBox"> -->
					<input type="text" name="userEmail" class="contact_inputBox userEmail" placeholder="What is your email?">
				</div>
				<div class="contact_form_inputBox">
					<textarea class="contact_textArea userMessage" placeholder="Please enter your message"></textarea>
				</div>
			</div>
		</form>
	</div>
	<div class="project_container">
		<div class="column_content">
			<div class="column_item date_title">발매 년월</div>
			<div class="column_item project_title">프로젝트명</div>
			<div class="column_item track_number_title">트랙 넘버</div>
			<div class="column_item song_title_title">노래 명</div>
			<div class="column_item create_ai_song_title">인공지능 생성음원</div>
			<div class="column_item result_song_title">편곡된 음원</div>
		</div>
		
		<div class="column_content">
			<div class="column_item date">20-09-24</div>
			<div class="column_item project">신비아파트 할로윈 앨범 </div>
			<div class="column_item track_number">1</div>
			<div class="column_item song_title">할로윈 성으로</div>
			 
			<div class="column_item create_ai_song">  -  </div>
			<div class="column_item result_song">
				<a href="https://youtu.be/oHRqJXM1524" target='_blank'>Link</a>
			</div>
		</div>
		<div class="column_content">
			<div class="column_item date">20-09-24</div>
			<div class="column_item project">신비아파트 할로윈 앨범 </div>
			<div class="column_item track_number">2</div>
			<div class="column_item song_title">할로윈이야</div>
			 
			<div class="column_item create_ai_song">  -  </div>
			<div class="column_item result_song">
				<a href="https://youtu.be/x7LZ_0-KzkA" target='_blank'>Link</a>
			</div>
		</div>
		<div class="column_content">
			<div class="column_item date">20-09-24</div>
			<div class="column_item project">신비아파트 할로윈 앨범 </div>
			<div class="column_item track_number">3</div>
			<div class="column_item song_title">할로윈 목장</div>
			 
			<div class="column_item create_ai_song">  -  </div>
			<div class="column_item result_song">
				<a href="https://youtu.be/bBPItwyXTn8" target='_blank'>Link</a>
			</div>
		</div>
		<div class="column_content">
			<div class="column_item date">20-09-24</div>
			<div class="column_item project">신비아파트 할로윈 앨범 </div>
			<div class="column_item track_number">4</div>
			<div class="column_item song_title">층간소음 송</div>
			 
			<div class="column_item create_ai_song">  -  </div>
			<div class="column_item result_song">
				<a href="https://youtu.be/dJ8Rx9BpcU0" target='_blank'>Link</a>
			</div>
		</div>
		<div class="column_content">
			<div class="column_item date">20-09-24</div>
			<div class="column_item project">신비아파트 할로윈 앨범 </div>
			<div class="column_item track_number">5</div>
			<div class="column_item song_title">할로윈 파티</div>
			 
			<div class="column_item create_ai_song">  -  </div>
			<div class="column_item result_song">
				<a href="https://youtu.be/tr_55bfhS94" target='_blank'>Link</a>
			</div>
		</div>
		
		<div class="column_content">
			<div class="column_item date">20-09-24</div>
			<div class="column_item project">신비아파트 할로윈 앨범 (Eng) </div>
			<div class="column_item track_number">1</div>
			<div class="column_item song_title">To the Halloween Castle (Eng)</div>
			 
			<div class="column_item create_ai_song">  -  </div>
			<div class="column_item result_song">
				<a href="https://youtu.be/lYESaWBDmsQ" target='_blank'>Link</a>
			</div>
		</div>
		<div class="column_content">
			<div class="column_item date">20-09-24</div>
			<div class="column_item project">신비아파트 할로윈 앨범 (Eng) </div>
			<div class="column_item track_number">2</div>
			<div class="column_item song_title">Halloween (Eng)</div>
			 
			<div class="column_item create_ai_song">  -  </div>
			<div class="column_item result_song">
				<a href="https://youtu.be/6-zRG4iCpqw" target='_blank'>Link</a>
			</div>
		</div>
		<div class="column_content">
			<div class="column_item date">20-09-24</div>
			<div class="column_item project">신비아파트 할로윈 앨범 (Eng)</div>
			<div class="column_item track_number">3</div>
			<div class="column_item song_title">Halloween Pasture (Eng)</div>
			 
			<div class="column_item create_ai_song">  -  </div>
			<div class="column_item result_song">
				<a href="https://youtu.be/6-zRG4iCpqw" target='_blank'>Link</a>
			</div>
		</div>
		<div class="column_content">
			<div class="column_item date">20-09-24</div>
			<div class="column_item project">신비아파트 할로윈 앨범 (Eng) </div>
			<div class="column_item track_number">4</div>
			<div class="column_item song_title">Floor Noise Song (Eng)</div>
			 
			<div class="column_item create_ai_song">  -  </div>
			<div class="column_item result_song">
				<a href="https://youtu.be/j-pSZLIVlHM" target='_blank'>Link</a>
			</div>
		</div>
		<div class="column_content">
			<div class="column_item date">20-09-24</div>
			<div class="column_item project">신비아파트 할로윈 앨범 (Eng)</div>
			<div class="column_item track_number">5</div>
			<div class="column_item song_title">Halloween Party (Eng)</div>
			 
			<div class="column_item create_ai_song">  -  </div>
			<div class="column_item result_song">
				<a href="https://youtu.be/XkfUa9mNt2A" target='_blank'>Link</a>
			</div>
		</div>
		
		<div class="column_content">
			<div class="column_item date">20-09-24</div>
			<div class="column_item project">신비아파트 할로윈 앨범 (Jap) </div>
			<div class="column_item track_number">1</div>
			<div class="column_item song_title">To the Halloween Castle (Jap)</div>
			 
			<div class="column_item create_ai_song">  -  </div>
			<div class="column_item result_song">
				<a href="https://youtu.be/98EPknFGXz0" target='_blank'>Link</a>
			</div>
		</div>
		<div class="column_content">
			<div class="column_item date">20-09-24</div>
			<div class="column_item project">신비아파트 할로윈 앨범 (Jap) </div>
			<div class="column_item track_number">2</div>
			<div class="column_item song_title">Halloween (Jap)</div>
			 
			<div class="column_item create_ai_song">  -  </div>
			<div class="column_item result_song">
				<a href="https://youtu.be/qVO2xG8ti18" target='_blank'>Link</a>
			</div>
		</div>
		<div class="column_content">
			<div class="column_item date">20-09-24</div>
			<div class="column_item project">신비아파트 할로윈 앨범 (Jap)</div>
			<div class="column_item track_number">3</div>
			<div class="column_item song_title">Halloween Pasture (Jap)</div>
			 
			<div class="column_item create_ai_song">  -  </div>
			<div class="column_item result_song">
				<a href="https://youtu.be/nBEs110egpc" target='_blank'>Link</a>
			</div>
		</div>
		<div class="column_content">
			<div class="column_item date">20-09-24</div>
			<div class="column_item project">신비아파트 할로윈 앨범 (Jap) </div>
			<div class="column_item track_number">4</div>
			<div class="column_item song_title">Floor Noise Song (Jap)</div>
			 
			<div class="column_item create_ai_song">  -  </div>
			<div class="column_item result_song">
				<a href="https://youtu.be/sztJATq0hFc" target='_blank'>Link</a>
			</div>
		</div>
		<div class="column_content">
			<div class="column_item date">20-09-24</div>
			<div class="column_item project">신비아파트 할로윈 앨범 (Jap)</div>
			<div class="column_item track_number">5</div>
			<div class="column_item song_title">Halloween Party (Jap)</div>
			 
			<div class="column_item create_ai_song">  -  </div>
			<div class="column_item result_song">
				<a href="https://youtu.be/ijyanB9IMR0" target='_blank'>Link</a>
			</div>
		</div>
		
		<div class="column_content">
			<div class="column_item date">20-09-24</div>
			<div class="column_item project">신비아파트 할로윈 앨범 (Chn) </div>
			<div class="column_item track_number">1</div>
			<div class="column_item song_title">To the Halloween Castle (Chn)</div>
			 
			<div class="column_item create_ai_song">  -  </div>
			<div class="column_item result_song">
				<a href="https://youtu.be/JExr9cdfbiQ" target='_blank'>Link</a>
			</div>
		</div>
		<div class="column_content">
			<div class="column_item date">20-09-24</div>
			<div class="column_item project">신비아파트 할로윈 앨범 (Chn) </div>
			<div class="column_item track_number">2</div>
			<div class="column_item song_title">Halloween (Chn)</div>
			 
			<div class="column_item create_ai_song">  -  </div>
			<div class="column_item result_song">
				<a href="https://youtu.be/-WWCsj4kW9s" target='_blank'>Link</a>
			</div>
		</div>
		<div class="column_content">
			<div class="column_item date">20-09-24</div>
			<div class="column_item project">신비아파트 할로윈 앨범 (Chn)</div>
			<div class="column_item track_number">3</div>
			<div class="column_item song_title">Halloween Pasture (Chn)</div>
			 
			<div class="column_item create_ai_song">  -  </div>
			<div class="column_item result_song">
				<a href="https://youtu.be/yyvjDNjpO28" target='_blank'>Link</a>
			</div>
		</div>
		<div class="column_content">
			<div class="column_item date">20-09-24</div>
			<div class="column_item project">신비아파트 할로윈 앨범 (Chn) </div>
			<div class="column_item track_number">4</div>
			<div class="column_item song_title">Floor Noise Song (Chn)</div>
			 
			<div class="column_item create_ai_song">  -  </div>
			<div class="column_item result_song">
				<a href="https://youtu.be/2GFyNzhc5wo" target='_blank'>Link</a>
			</div>
		</div>
		<div class="column_content">
			<div class="column_item date">20-09-24</div>
			<div class="column_item project">신비아파트 할로윈 앨범 (Chn)</div>
			<div class="column_item track_number">5</div>
			<div class="column_item song_title">Halloween Party (Chn)</div>
			 
			<div class="column_item create_ai_song">  -  </div>
			<div class="column_item result_song">
				<a href="https://youtu.be/Wt7hrcvuD6w" target='_blank'>Link</a>
			</div>
		</div>
		
		<div class="column_content">
			<div class="column_item date">20-11-01</div>
			<div class="column_item project">지니뮤직 창작 동요제 </div>
			<div class="column_item track_number">1</div>
			<div class="column_item song_title">도토리 도리</div>
			 
			<div class="column_item create_ai_song">  -  </div>
			<div class="column_item result_song">
				-
			</div>
		</div>
		<div class="column_content">
			<div class="column_item date">20-11-01</div>
			<div class="column_item project">지니뮤직 창작 동요제 </div>
			<div class="column_item track_number">2</div>
			<div class="column_item song_title">호호 호빵</div>
			 
			<div class="column_item create_ai_song">  -  </div>
			<div class="column_item result_song">
				-
			</div>
		</div>
		
		<div class="column_content">
			<div class="column_item date">20-12-10</div>
			<div class="column_item project">드래곤디 크리스마스 캐롤송</div>
			<div class="column_item track_number">1</div>
			<div class="column_item song_title">We wish you a merry christmas (AI Ver.)</div>
			 
			<div class="column_item create_ai_song">  -  </div>
			<div class="column_item result_song">
				<a href="https://youtu.be/jbjEE06dSJE" target='_blank'>Link</a>
			</div>
		</div>
		
		<div class="column_content">
			<div class="column_item date">20-12-11</div>
			<div class="column_item project">＜뚜아뚜지와 메리 크리스마스＞ AI 캐롤 동요</div>
			<div class="column_item track_number">1</div>
			<div class="column_item song_title">뚜아뚜지 Intro</div>
			 
			<div class="column_item create_ai_song">  -  </div>
			<div class="column_item result_song">
				<a href="https://youtu.be/83ZrwHv_nO0?t=126" target='_blank'>Link</a>
			</div>
		</div>
		<div class="column_content">
			<div class="column_item date">20-12-11</div>
			<div class="column_item project">＜뚜아뚜지와 메리 크리스마스＞ AI 캐롤 동요</div>
			<div class="column_item track_number">2</div>
			<div class="column_item song_title">눈사람 친구</div>
			 
			<div class="column_item create_ai_song">  -  </div>
			<div class="column_item result_song">
				<a href="https://www.youtube.com/watch?v=83ZrwHv_nO0" target='_blank'>Link</a>
			</div>
		</div>
		<div class="column_content">
			<div class="column_item date">20-12-11</div>
			<div class="column_item project">＜뚜아뚜지와 메리 크리스마스＞ AI 캐롤 동요</div>
			<div class="column_item track_number">3</div>
			<div class="column_item song_title">즐거운 크리스마스</div>
			 
			<div class="column_item create_ai_song">  -  </div>
			<div class="column_item result_song">
				<a href="https://youtu.be/83ZrwHv_nO0?t=209" target='_blank'>Link</a>
			</div>
		</div>
		
		<div class="column_content">
			<div class="column_item date">20-12-21</div>
			<div class="column_item project">웰벤져스 캐롤</div>
			<div class="column_item track_number">1</div>
			<div class="column_item song_title">윌벤져스의 크리스마스 소원</div>
			 
			<div class="column_item create_ai_song">
			  <a href="https://drive.google.com/file/d/1T7nBKP6A3L1AS72NBFnuemUy9hViieEe/view?usp=sharing" target='_blank'>Link</a>  
			 </div>
			<div class="column_item result_song">
				<a href="https://www.youtube.com/watch?v=k3bwzvU_dus&t=21s" target='_blank'>Link</a>
			</div>
		</div>
		
		<div class="column_content">
			<div class="column_item date">21-02-09</div>
			<div class="column_item project">＜뚜아뚜지와 생활습관 익혀요＞ AI 동요</div>
			<div class="column_item track_number">1</div>
			<div class="column_item song_title">마스크송</div>
			 
			<div class="column_item create_ai_song">
				 <a href="https://drive.google.com/file/d/13CsY6stTF_DzWYn9wtcCpITjU1gdD01y/view?usp=sharing" target='_blank'>Link</a>  
			</div>
			<div class="column_item result_song">
				<a href="https://youtu.be/0R1eY0JyKIY" target='_blank'>Link</a>
			</div>
		</div>
		<div class="column_content">
			<div class="column_item date">21-02-09</div>
			<div class="column_item project">＜뚜아뚜지와 생활습관 익혀요＞ AI 동요</div>
			<div class="column_item track_number">2</div>
			<div class="column_item song_title">손씻기송</div>
			 
			<div class="column_item create_ai_song">
				<a href="https://drive.google.com/file/d/13CsY6stTF_DzWYn9wtcCpITjU1gdD01y/view?usp=sharing" target='_blank'>Link</a>  
			</div>
			<div class="column_item result_song">
				<a href="https://youtu.be/0R1eY0JyKIY?t=71" target='_blank'>Link</a>
			</div>
		</div>
		
		<div class="column_content">
			<div class="column_item date">21-02-16</div>
			<div class="column_item project">＜뚜아뚜지와 학교가요＞ AI 동요</div>
			<div class="column_item track_number">1</div>
			<div class="column_item song_title">새학기송</div>
			 
			<div class="column_item create_ai_song">  -  </div>
			<div class="column_item result_song">
				-
			</div>
		</div>
		<div class="column_content">
			<div class="column_item date">21-02-16</div>
			<div class="column_item project">＜뚜아뚜지와 학교가요＞ AI 동요</div>
			<div class="column_item track_number">2</div>
			<div class="column_item song_title">책가방송</div>
			 
			<div class="column_item create_ai_song">  -  </div>
			<div class="column_item result_song">
				-
			</div>
		</div>
		
		<div class="column_content">
			<div class="column_item date">21-04-08</div>
			<div class="column_item project">＜드래곤디X지니뮤직＞ 아기 동물 자장가 모음집</div>
			<div class="column_item track_number">4</div>
			<div class="column_item song_title">아기 사자의 반짝 반짝 작은 별</div>
			 
			<div class="column_item create_ai_song">
				<a href="https://drive.google.com/file/d/1yf936ijrPAq75cpdtp8gER5eU6oIJrGn/view?usp=sharing" target='_blank'>Link</a>  
			</div>
			<div class="column_item result_song">
				<a href="https://www.youtube.com/watch?v=5lYU6d3yYo4" target='_blank'>Link</a>
			</div>
		</div>
		<div class="column_content">
			<div class="column_item date">21-04-08</div>
			<div class="column_item project">＜드래곤디X지니뮤직＞ 아기 동물 자장가 모음집</div>
			<div class="column_item track_number">5</div>
			<div class="column_item song_title">아기 양의 Hush Little Baby</div>
			 
			<div class="column_item create_ai_song"> 
				<a href="https://drive.google.com/file/d/13oX1Cz2y0yd_pMJsSfz_yGQLRwcjZiY3/view?usp=sharing" target='_blank'>Link</a>  
			</div>
			<div class="column_item result_song">
				<a href="https://www.youtube.com/watch?v=zQUNkOzKiUc" target='_blank'>Link</a>
			</div>
		</div>
		
		<div class="column_content">
			<div class="column_item date">21-04-08</div>
			<div class="column_item project">＜Dragon Dee x Genie＞ Relaxing Animal Lullabies for Babies</div>
			<div class="column_item track_number">4</div>
			<div class="column_item song_title">Lion Cub Twinkle Twinkle Little Star</div>
			 
			<div class="column_item create_ai_song">
				<a href="https://drive.google.com/file/d/1yf936ijrPAq75cpdtp8gER5eU6oIJrGn/view?usp=sharing" target='_blank'>Link</a>
			</div>
			<div class="column_item result_song">
				<a href="https://www.youtube.com/watch?v=l0b_yWKCMl0" target='_blank'>Link</a>
			</div>
		</div>
		<div class="column_content">
			<div class="column_item date">21-04-08</div>
			<div class="column_item project">＜Dragon Dee x Genie＞ Relaxing Animal Lullabies for Babies</div>
			<div class="column_item track_number">5</div>
			<div class="column_item song_title">Baby Sheep Hush Little Baby</div>
			 
			<div class="column_item create_ai_song">
				<a href="https://drive.google.com/file/d/13oX1Cz2y0yd_pMJsSfz_yGQLRwcjZiY3/view?usp=sharing" target='_blank'>Link</a>  
			</div>
			<div class="column_item result_song">
				<a href="https://www.youtube.com/watch?v=796c1BwwO2g" target='_blank'>Link</a>
			</div>
		</div>
		
		<div class="column_content">
			<div class="column_item date">21-05-05</div>
			<div class="column_item project">채널A 강철부대 </div>
			<div class="column_item track_number">1</div>
			<div class="column_item song_title">OST 가이드 포함 샘플</div>
			 
			<div class="column_item create_ai_song"> 
				<a href="https://drive.google.com/file/d/1A6178AHU8qkEnzxZls076w35Tz5Z2nFi/view?usp=sharing" target='_blank'>Link</a> 
		    </div>
			<div class="column_item result_song">
				-
			</div>
		</div>
		<div class="column_content">
			<div class="column_item date">21-05-05</div>
			<div class="column_item project">채널A 강철부대 </div>
			<div class="column_item track_number">2</div>
			<div class="column_item song_title">BGM 샘플</div>
			 
			<div class="column_item create_ai_song">
				<a href="https://drive.google.com/file/d/1n48ibuDKl44HnDluG7Bu7rdSnpMl7V9r/view?usp=sharing" target='_blank'>Link</a>  
			</div>
			<div class="column_item result_song">
				<a href="https://www.youtube.com/watch?v=tWkPIyKLYoA" target='_blank'>YouTube</a>
			</div>
		</div>
		<!-- 여기서부터 가상악기 -->
		<div class="column_content upgrade_version">
			<div class="column_item date">21-05-30</div>
			<div class="column_item project">GS 칼텍스 키워드 작곡 프로젝트 </div>
			<div class="column_item track_number">-</div>
			<div class="column_item song_title">-</div>
			 
			<div class="column_item create_ai_song">  -  </div>
			<div class="column_item result_song">
				-
			</div>
		</div>
		
		<div class="column_content upgrade_version">
			<div class="column_item date">21-06-01</div>
			<div class="column_item project">LG전자 김래아 프로젝트 </div>
			<div class="column_item track_number">1</div>
			<div class="column_item song_title">김래아 프로젝트 샘플_01</div>
			 
			<div class="column_item create_ai_song">
				<a href="https://drive.google.com/file/d/1v8eyMATdT7NM6NLWzzt7aC0gXZPvpr2C/view?usp=sharing" target='_blank'>Link</a>
			</div>
			<div class="column_item result_song">
				<a href="https://drive.google.com/file/d/1dLY-Td-sozYS4NzdQ5dVl2EGllLtN5YJ/view?usp=sharing" target='_blank'>Link</a>
			</div>
		</div>
		<div class="column_content upgrade_version">
			<div class="column_item date">21-06-22</div>
			<div class="column_item project">비패밀리 헬로카봇 프로젝트 </div>
			<div class="column_item track_number">1</div>
			<div class="column_item song_title">  -  </div>
			 
			<div class="column_item create_ai_song">
				<a href="https://drive.google.com/file/d/1nXm90CVFNaH4lO9PurO7_eTc3micQVMt/view?usp=sharing" target='_blank'>Link</a>
			</div>
			<div class="column_item result_song">
				<a href="https://drive.google.com/file/d/177Evbo2eHI4OS1f1kBaqRcq8gReuKmBx/view?usp=sharing" target='_blank'>Link</a>
			</div>
		</div>
		<div class="column_content upgrade_version">
			<div class="column_item date">21-06-22</div>
			<div class="column_item project">비패밀리 헬로카봇 프로젝트 </div>
			<div class="column_item track_number">2</div>
			<div class="column_item song_title">  -  </div>
			 
			<div class="column_item create_ai_song">
				<a href="https://drive.google.com/file/d/1nXm90CVFNaH4lO9PurO7_eTc3micQVMt/view?usp=sharing" target='_blank'>Link</a>
			</div>
			<div class="column_item result_song">
				<a href="https://drive.google.com/file/d/1eRWfAsifYriW64HtIBLFJKoCQTq_75eV/view?usp=sharing" target='_blank'>Link</a>
			</div>
		</div>
		
		<div class="column_content upgrade_version">
			<div class="column_item date">21-06-14</div>
			<div class="column_item project">양준혁 응원가 프로젝트 </div>
			<div class="column_item track_number">1</div>
			<div class="column_item song_title">양준혁 응원가 샘플</div>
			 
			<div class="column_item create_ai_song">
				<a href="https://drive.google.com/file/d/138_efdsF0ruesvvk0IawRTscXj0Aqulq/view?usp=sharing" target='_blank'>Link</a>
			</div>
			<div class="column_item result_song">
				<a href="https://drive.google.com/file/d/1fDxWTFk5AqplIPISsD_b48KRO5jdk3cB/view?usp=sharing" target='_blank'>Link</a>
			</div>
		</div>
		
		<div class="column_content upgrade_version">
			<div class="column_item date">21-06-19</div>
			<div class="column_item project">조아영 앨범 </div>
			<div class="column_item track_number">1</div>
			<div class="column_item song_title">Play,Play,Play</div>
			 
			<div class="column_item create_ai_song">
				<a href="https://drive.google.com/file/d/1S8RgYRIvsKNRcaajHahBdG5C_PJWqqce/view?usp=sharing" target='_blank'>Link</a>
			</div>
			<div class="column_item result_song">
				<a href="https://drive.google.com/file/d/1czXdAgxp8zfU7BvPhPtI5tK8JKWBI5Io/view?usp=sharing" target='_blank'>Link</a>
			</div>
		</div>
		<div class="column_content upgrade_version">
			<div class="column_item date">21-06-19</div>
			<div class="column_item project">조아영 앨범 </div>
			<div class="column_item track_number">2</div>
			<div class="column_item song_title">Moonlight</div>
			 
			<div class="column_item create_ai_song">
				<a href="https://drive.google.com/file/d/1ksaqIPnSR1h_ZqxL3YEjRik3vPOHsgZk/view?usp=sharing" target='_blank'>Link</a>
			</div>
			<div class="column_item result_song">
				<a href="https://drive.google.com/file/d/15eTrnGTYPD0lkeQi7BoUWPnOc21TaLxn/view?usp=sharing" target='_blank'>Link</a>
			</div>
		</div>
		<div class="column_content upgrade_version">
			<div class="column_item date">21-06-19</div>
			<div class="column_item project">조아영 앨범 </div>
			<div class="column_item track_number">3</div>
			<div class="column_item song_title">In The Water</div>
			 
			<div class="column_item create_ai_song">
				<a href="https://drive.google.com/file/d/1MfGosXP_9wen9K3M-N6mdrYbph4pyU9b/view?usp=sharing" target='_blank'>Link</a>
			</div>
			<div class="column_item result_song">
				<a href="https://drive.google.com/file/d/1lAJocfQCeC91DYrWNvZ9LAJM6K0JiKG6/view?usp=sharing" target='_blank'>Link</a>
			</div>
		</div>
		
		<div class="column_content working">
			<div class="column_item date">21-07-07</div>
			<div class="column_item project">스튜디오 게일 티시태시 프로젝트  </div>
			<div class="column_item track_number">1</div>
			<div class="column_item song_title"> 작업중 </div>
			 
			<div class="column_item create_ai_song">  작업중  </div>
			<div class="column_item result_song">
				작업중
			</div>
		</div>
		<div class="column_content working">
			<div class="column_item date">21-07-07</div>
			<div class="column_item project">스튜디오 게일 티시태시 프로젝트  </div>
			<div class="column_item track_number">2</div>
			<div class="column_item song_title"> 작업중 </div>
			 
			<div class="column_item create_ai_song">  작업중  </div>
			<div class="column_item result_song">
				작업중
			</div>
		</div>
		<div class="column_content working">
			<div class="column_item date">21-07-07</div>
			<div class="column_item project">스튜디오 게일 티시태시 프로젝트  </div>
			<div class="column_item track_number">3</div>
			<div class="column_item song_title"> 작업중 </div>
			 
			<div class="column_item create_ai_song">  작업중  </div>
			<div class="column_item result_song">
				작업중
			</div>
		</div>
		<div class="column_content working">
			<div class="column_item date">21-07-07</div>
			<div class="column_item project">스튜디오 게일 티시태시 프로젝트  </div>
			<div class="column_item track_number">4</div>
			<div class="column_item song_title"> 작업중 </div>
			 
			<div class="column_item create_ai_song">  작업중  </div>
			<div class="column_item result_song">
				작업중
			</div>
		</div>
		<div class="column_content working">
			<div class="column_item date">21-07-07</div>
			<div class="column_item project">스튜디오 게일 티시태시 프로젝트  </div>
			<div class="column_item track_number">5</div>
			<div class="column_item song_title"> 작업중 </div>
			 
			<div class="column_item create_ai_song">  작업중  </div>
			<div class="column_item result_song">
				작업중
			</div>
		</div>
		<div class="column_content working">
			<div class="column_item date">21-07-07</div>
			<div class="column_item project">스튜디오 게일 티시태시 프로젝트  </div>
			<div class="column_item track_number">6</div>
			<div class="column_item song_title"> 작업중 </div>
			 
			<div class="column_item create_ai_song">  작업중  </div>
			<div class="column_item result_song">
				작업중
			</div>
		</div>
		<div class="column_content working">
			<div class="column_item date">21-07-07</div>
			<div class="column_item project">스튜디오 게일 티시태시 프로젝트  </div>
			<div class="column_item track_number">7</div>
			<div class="column_item song_title"> 작업중 </div>
			 
			<div class="column_item create_ai_song">  작업중  </div>
			<div class="column_item result_song">
				작업중
			</div>
		</div>
		<div class="column_content working">
			<div class="column_item date">21-07-07</div>
			<div class="column_item project">스튜디오 게일 티시태시 프로젝트  </div>
			<div class="column_item track_number">8</div>
			<div class="column_item song_title"> 작업중 </div>
			 
			<div class="column_item create_ai_song">  작업중  </div>
			<div class="column_item result_song">
				작업중
			</div>
		</div>
		<div class="column_content working">
			<div class="column_item date">21-07-07</div>
			<div class="column_item project">스튜디오 게일 티시태시 프로젝트  </div>
			<div class="column_item track_number">9</div>
			<div class="column_item song_title"> 작업중 </div>
			 
			<div class="column_item create_ai_song">  작업중  </div>
			<div class="column_item result_song">
				작업중
			</div>
		</div>
		<div class="column_content working">
			<div class="column_item date">21-07-07</div>
			<div class="column_item project">스튜디오 게일 티시태시 프로젝트  </div>
			<div class="column_item track_number">10</div>
			<div class="column_item song_title"> 작업중 </div>
			 
			<div class="column_item create_ai_song">  작업중  </div>
			<div class="column_item result_song">
				작업중
			</div>
		</div>
		<div class="column_content working">
			<div class="column_item date">21-07-07</div>
			<div class="column_item project">스튜디오 게일 티시태시 프로젝트  </div>
			<div class="column_item track_number">11</div>
			<div class="column_item song_title"> 작업중 </div>
			 
			<div class="column_item create_ai_song">  작업중  </div>
			<div class="column_item result_song">
				작업중
			</div>
		</div>
		<div class="column_content working">
			<div class="column_item date">21-07-07</div>
			<div class="column_item project">스튜디오 게일 티시태시 프로젝트  </div>
			<div class="column_item track_number">12</div>
			<div class="column_item song_title"> 작업중 </div>
			 
			<div class="column_item create_ai_song">  작업중  </div>
			<div class="column_item result_song">
				작업중
			</div>
		</div>
		<div class="column_content working">
			<div class="column_item date">21-07-07</div>
			<div class="column_item project">스튜디오 게일 티시태시 프로젝트  </div>
			<div class="column_item track_number">13</div>
			<div class="column_item song_title"> 작업중 </div>
			 
			<div class="column_item create_ai_song">  작업중  </div>
			<div class="column_item result_song">
				작업중
			</div>
		</div>
		<div class="column_content working">
			<div class="column_item date">21-07-07</div>
			<div class="column_item project">스튜디오 게일 티시태시 프로젝트  </div>
			<div class="column_item track_number">14</div>
			<div class="column_item song_title"> 작업중 </div>
			 
			<div class="column_item create_ai_song">  작업중  </div>
			<div class="column_item result_song">
				작업중
			</div>
		</div>
		<div class="column_content working">
			<div class="column_item date">21-07-07</div>
			<div class="column_item project">스튜디오 게일 티시태시 프로젝트  </div>
			<div class="column_item track_number">15</div>
			<div class="column_item song_title"> 작업중 </div>
			 
			<div class="column_item create_ai_song">  작업중  </div>
			<div class="column_item result_song">
				작업중
			</div>
		</div>
		<div class="column_content working">
			<div class="column_item date">21-07-07</div>
			<div class="column_item project">스튜디오 게일 티시태시 프로젝트  </div>
			<div class="column_item track_number">16</div>
			<div class="column_item song_title"> 작업중 </div>
			 
			<div class="column_item create_ai_song">  작업중  </div>
			<div class="column_item result_song">
				작업중
			</div>
		</div>
		<div class="column_content working">
			<div class="column_item date">21-07-07</div>
			<div class="column_item project">스튜디오 게일 티시태시 프로젝트  </div>
			<div class="column_item track_number">17</div>
			<div class="column_item song_title"> 작업중 </div>
			 
			<div class="column_item create_ai_song">  작업중  </div>
			<div class="column_item result_song">
				작업중
			</div>
		</div>
		<div class="column_content working">
			<div class="column_item date">21-07-07</div>
			<div class="column_item project">스튜디오 게일 티시태시 프로젝트  </div>
			<div class="column_item track_number">18</div>
			<div class="column_item song_title"> 작업중 </div>
			 
			<div class="column_item create_ai_song">  작업중  </div>
			<div class="column_item result_song">
				작업중
			</div>
		</div>
		<div class="column_content working">
			<div class="column_item date">21-07-07</div>
			<div class="column_item project">스튜디오 게일 티시태시 프로젝트  </div>
			<div class="column_item track_number">19</div>
			<div class="column_item song_title"> 작업중 </div>
			 
			<div class="column_item create_ai_song">  작업중  </div>
			<div class="column_item result_song">
				작업중
			</div>
		</div>
		<div class="column_content working">
			<div class="column_item date">21-07-07</div>
			<div class="column_item project">스튜디오 게일 티시태시 프로젝트  </div>
			<div class="column_item track_number">20</div>
			<div class="column_item song_title"> 작업중 </div>
			 
			<div class="column_item create_ai_song">  작업중  </div>
			<div class="column_item result_song">
				작업중
			</div>
		</div>
		<div class="column_content working">
			<div class="column_item date">21-07-07</div>
			<div class="column_item project">스튜디오 게일 티시태시 프로젝트  </div>
			<div class="column_item track_number">21</div>
			<div class="column_item song_title"> 작업중 </div>
			 
			<div class="column_item create_ai_song">  작업중  </div>
			<div class="column_item result_song">
				작업중
			</div>
		</div>
		<div class="column_content working">
			<div class="column_item date">21-07-07</div>
			<div class="column_item project">스튜디오 게일 티시태시 프로젝트  </div>
			<div class="column_item track_number">22</div>
			<div class="column_item song_title"> 작업중 </div>
			 
			<div class="column_item create_ai_song">  작업중  </div>
			<div class="column_item result_song">
				작업중
			</div>
		</div>
		<div class="column_content working">
			<div class="column_item date">21-07-07</div>
			<div class="column_item project">스튜디오 게일 티시태시 프로젝트  </div>
			<div class="column_item track_number">23</div>
			<div class="column_item song_title"> 작업중 </div>
			 
			<div class="column_item create_ai_song">  작업중  </div>
			<div class="column_item result_song">
				작업중
			</div>
		</div>
		<div class="column_content working">
			<div class="column_item date">21-07-07</div>
			<div class="column_item project">스튜디오 게일 티시태시 프로젝트  </div>
			<div class="column_item track_number">24</div>
			<div class="column_item song_title"> 작업중 </div>
			 
			<div class="column_item create_ai_song">  작업중  </div>
			<div class="column_item result_song">
				작업중
			</div>
		</div>
		<div class="column_content working">
			<div class="column_item date">21-07-07</div>
			<div class="column_item project">스튜디오 게일 티시태시 프로젝트  </div>
			<div class="column_item track_number">25</div>
			<div class="column_item song_title"> 작업중 </div>
			 
			<div class="column_item create_ai_song">  작업중  </div>
			<div class="column_item result_song">
				작업중
			</div>
		</div>
		<div class="column_content working">
			<div class="column_item date">21-07-07</div>
			<div class="column_item project">스튜디오 게일 티시태시 프로젝트  </div>
			<div class="column_item track_number">26</div>
			<div class="column_item song_title"> 작업중 </div>
			 
			<div class="column_item create_ai_song">  작업중  </div>
			<div class="column_item result_song">
				작업중
			</div>
		</div>
		
		<div class="column_content working">
			<div class="column_item date">21-07-08</div>
			<div class="column_item project">지니뮤직 옥토넛 프로젝트   </div>
			<div class="column_item track_number">1</div>
			<div class="column_item song_title"> 작업중 </div>
			 
			<div class="column_item create_ai_song">  작업중  </div>
			<div class="column_item result_song">
				작업중
			</div>
		</div>
		<div class="column_content working">
			<div class="column_item date">21-07-08</div>
			<div class="column_item project">지니뮤직 옥토넛 프로젝트   </div>
			<div class="column_item track_number">2</div>
			<div class="column_item song_title"> 작업중 </div>
			 
			<div class="column_item create_ai_song">  작업중  </div>
			<div class="column_item result_song">
				작업중
			</div>
		</div>
		<div class="column_content working">
			<div class="column_item date">21-07-08</div>
			<div class="column_item project">지니뮤직 옥토넛 프로젝트   </div>
			<div class="column_item track_number">3</div>
			<div class="column_item song_title"> 작업중 </div>
			 
			<div class="column_item create_ai_song">  작업중  </div>
			<div class="column_item result_song">
				작업중
			</div>
		</div>
		<div class="column_content working">
			<div class="column_item date">21-07-08</div>
			<div class="column_item project">지니뮤직 옥토넛 프로젝트   </div>
			<div class="column_item track_number">4</div>
			<div class="column_item song_title"> 작업중 </div>
			 
			<div class="column_item create_ai_song">  작업중  </div>
			<div class="column_item result_song">
				작업중
			</div>
		</div>
		<div class="column_content working">
			<div class="column_item date">21-07-08</div>
			<div class="column_item project">지니뮤직 옥토넛 프로젝트   </div>
			<div class="column_item track_number">5</div>
			<div class="column_item song_title"> 작업중 </div>
			 
			<div class="column_item create_ai_song">  작업중  </div>
			<div class="column_item result_song">
				작업중
			</div>
		</div>
		
		<div class="column_content working">
			<div class="column_item date">21-07-12</div>
			<div class="column_item project">정동하 프로젝트   </div>
			<div class="column_item track_number">1</div>
			<div class="column_item song_title"> 작업중 </div>
			 
			<div class="column_item create_ai_song">  작업중  </div>
			<div class="column_item result_song">
				작업중
			</div>
		</div>
		
		<div class="column_content working">
			<div class="column_item date">21-07-12</div>
			<div class="column_item project">경남 fc 프로젝트</div>
			<div class="column_item track_number">1</div>
			<div class="column_item song_title"> A01 </div>
			 
			<div class="column_item create_ai_song">  작업중  </div>
			<div class="column_item result_song">
				작업중
			</div>
		</div>
		<div class="column_content working">
			<div class="column_item date">21-07-12</div>
			<div class="column_item project">경남 fc 프로젝트</div>
			<div class="column_item track_number">2</div>
			<div class="column_item song_title"> A02 </div>
			 
			<div class="column_item create_ai_song">  작업중  </div>
			<div class="column_item result_song">
				작업중
			</div>
		</div>
		<div class="column_content working">
			<div class="column_item date">21-07-12</div>
			<div class="column_item project">경남 fc 프로젝트</div>
			<div class="column_item track_number">3</div>
			<div class="column_item song_title"> A03 </div>
			 
			<div class="column_item create_ai_song">  작업중  </div>
			<div class="column_item result_song">
				작업중
			</div>
		</div>
		<div class="column_content working">
			<div class="column_item date">21-07-12</div>
			<div class="column_item project">경남 fc 프로젝트</div>
			<div class="column_item track_number">4</div>
			<div class="column_item song_title"> A04 </div>
			 
			<div class="column_item create_ai_song">  작업중  </div>
			<div class="column_item result_song">
				작업중
			</div>
		</div>
		<div class="column_content working">
			<div class="column_item date">21-07-12</div>
			<div class="column_item project">경남 fc 프로젝트</div>
			<div class="column_item track_number">5</div>
			<div class="column_item song_title"> A05 </div>
			 
			<div class="column_item create_ai_song">  작업중  </div>
			<div class="column_item result_song">
				작업중
			</div>
		</div>
		<div class="column_content working">
			<div class="column_item date">21-07-12</div>
			<div class="column_item project">경남 fc 프로젝트</div>
			<div class="column_item track_number">6</div>
			<div class="column_item song_title"> A06 </div>
			 
			<div class="column_item create_ai_song">  작업중  </div>
			<div class="column_item result_song">
				작업중
			</div>
		</div>
		<div class="column_content working">
			<div class="column_item date">21-07-12</div>
			<div class="column_item project">경남 fc 프로젝트</div>
			<div class="column_item track_number">7</div>
			<div class="column_item song_title"> A07 </div>
			 
			<div class="column_item create_ai_song">  작업중  </div>
			<div class="column_item result_song">
				작업중
			</div>
		</div>
		<div class="column_content working">
			<div class="column_item date">21-07-12</div>
			<div class="column_item project">경남 fc 프로젝트</div>
			<div class="column_item track_number">8</div>
			<div class="column_item song_title"> A08 </div>
			 
			<div class="column_item create_ai_song">  작업중  </div>
			<div class="column_item result_song">
				작업중
			</div>
		</div>
		<div class="column_content working">
			<div class="column_item date">21-07-12</div>
			<div class="column_item project">경남 fc 프로젝트</div>
			<div class="column_item track_number">9</div>
			<div class="column_item song_title"> A09 </div>
			 
			<div class="column_item create_ai_song">  작업중  </div>
			<div class="column_item result_song">
				작업중
			</div>
		</div>
		<div class="column_content working">
			<div class="column_item date">21-07-12</div>
			<div class="column_item project">경남 fc 프로젝트</div>
			<div class="column_item track_number">10</div>
			<div class="column_item song_title"> A010 </div>
			 
			<div class="column_item create_ai_song">  작업중  </div>
			<div class="column_item result_song">
				작업중
			</div>
		</div>
		<div class="column_content working">
			<div class="column_item date">21-07-12</div>
			<div class="column_item project">경남 fc 프로젝트</div>
			<div class="column_item track_number">11</div>
			<div class="column_item song_title"> B01 </div>
			 
			<div class="column_item create_ai_song">  작업중  </div>
			<div class="column_item result_song">
				작업중
			</div>
		</div>
		<div class="column_content working">
			<div class="column_item date">21-07-12</div>
			<div class="column_item project">경남 fc 프로젝트</div>
			<div class="column_item track_number">12</div>
			<div class="column_item song_title"> B02 </div>
			 
			<div class="column_item create_ai_song">  작업중  </div>
			<div class="column_item result_song">
				작업중
			</div>
		</div>
		<div class="column_content working">
			<div class="column_item date">21-07-12</div>
			<div class="column_item project">경남 fc 프로젝트</div>
			<div class="column_item track_number">3</div>
			<div class="column_item song_title"> B03</div>
			 
			<div class="column_item create_ai_song">  작업중  </div>
			<div class="column_item result_song">
				작업중
			</div>
		</div>
	</div>
	<div class="history_container" style="display: none;">
		<div class="history_box">
			<div class="company-contentTitle"> History </div>
			<div class="history_list">
				<h3>2020 - 12</h3>
				<p>인공지능 음원생성 [ 윌벤져스 캐롤 ]  AI 캐롤 동요앨범 제작  (with 스튜디오게일)​</p>
				<p>​스튜디오더블유바바(주)와 AI 음원 및 사업화 제품 구매 협약체결</p>
				<p>비패밀리문화전문회사(유)와 지분교환</p>
				<p>비패밀리문화전문회사(유)와 인공지능 음원 제작 100곡 계약 체결</p>
				<p>인공지능 음원생성  [ 뚜아뚜지와 메리 크리스마스 ] AI 캐롤 동요앨범 제작  (with 지니뮤직)​</p>
				
			</div>
			<div class="history_list">
				<h3>2020 - 11</h3>
				<p>인공지능과 사람의 작곡대결 [창작동요제] 인공지능 동요(with 지니뮤직)제작 참여​</p>
			</div>
			<div class="history_list">
				<h3>2020 - 09</h3>
				<p>인공지능 음원생성으로 〈신비와 노래해요〉 신나는 AI 할로윈 노래 앨범 제작(with 지니뮤직&CJENM)​</p>
			</div>
			<div class="history_list">
				<h3>2020 - 06</h3>
				<p>(주) 곰앤컴퍼니와 AI 소프트웨어 개발 MOU 체결​</p>
			</div>
			<div class="history_list">
				<h3>2020 - 03</h3>
				<p>㈜ 머니투데이(콘텐츠 제작사업부)와 AI 음원 및 사업화 제품 구매 의향 협약체결</p>
				<p>㈜ 기업가 정신과 AI 음원 및 사업화 제품 구매 의향 협약체결</p>
				<p>㈜ 재담미디어(국내 최대 웹툰 제작사)와 AI 음원 및 사업화 제품 구매 협약체결</p>
				<p>㈜ 지니뮤직(국내 2위 음원플랫폼)과 AI 음원 및 사업화 제품 구매 협약체결 </p>
				<p>㈜ 뮤직원컴퍼니(부활 출신 보컬 정동하 소속사)와 AI 음원 및 사업화 제품 구매 협약체결</p>
				<p>뮤직레시피(별에서온그대,닥터김사부1,2 OST제작사)와 AI 음원 및 사업화 제품 구매 협약체결</p>
				<p>이화여대 융합콘텐츠학과와 인공지능 핵심기술 및 응용 연구에 관한 MOU 체결​</p>
			</div>
			<div class="history_list">
				<h3>2020 - 02</h3>
				<p>14가지 메인 악기로 구성된 반주 트랙 프로토 타입 개발 성공</p>
			</div>
			<div class="history_list">
				<h3>2020 - 01</h3>
				<p>동요 장르 인공지능 음원 생성</p>
			</div>
			<div class="history_list">
				<h3>2019 - 12</h3>
				<p>생성된 음원에 다양한 악기 사운드 지정</p>
			</div>
			<div class="history_list">
				<h3>2019 - 08</h3>
				<p>AISM(아이즘) 프로토타입 음원 2차 생성성공</p>
			</div>
			<div class="history_list">
				<h3>2019 - 03</h3>
				<p>AISM(아이즘) 프로토타입 음원 1차 생성 성공</p>
			</div>
			<div class="history_list">
				<h3>2018 - 11</h3>
				<p>인공지능 개발시작 - 음악이론과  알고리즘 기획 및 제작</p>
			</div>
		</div>
	</div>
<!-- 	<div class="company-container"> -->
<!-- 		<ul class="company-titleBox"> -->
<!-- 			<li class="company-title aboutAISM">What AISM can make</li> -->
<!-- 			<li class="company-title history">History</li> -->
<!-- 			<li class="company-title co-operation">Co-operation</li> -->
<!-- 			<li class="company-title contact">Contact</li> -->
<!-- 		</ul> -->
<!-- 		<div class="company-content"> -->
<!-- 			<div class="company-contentTitle"> What AISM can make </div> -->
<!-- 			<div class="aboutAISMPage"> -->
<!-- 				<p>AISM(아이즘)은 인공지능 기술과 음악이론을 융합한 새로운 작곡 플랫폼 입니다</p> -->
<!-- 				<p>AISM에서는 “좋은 음악”이라는 주관적인 기준을 사용자 빅데이터를 기반으로 빠르게 만족 시킬수 있습니다.</p> -->
<!-- 				<p>AISM은 음악을 좋아하는 모든 사람들의 새로운 “창작의 공간” 입니다.</p> -->
<!-- 				<p>AISM에서는 누구나 본인의 감성을 익숙하면서도 색다른 “멋진 음악으로 탄생” 시킬수 있습니다.</p> -->
<!-- 			</div> -->
<!-- 			<div class="historyPage"></div> -->
<!-- 			<div class="co-operationPage"></div> -->
<!-- 			<div class="contactPage"></div> -->
<!-- 		</div> -->
<!-- 	</div> -->
	<%@ include file="../../component/footer.jsp" %>
	<script src="../../js/company/company.js"></script>
</body>
</html>
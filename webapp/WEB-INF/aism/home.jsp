<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
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
<title>AISM</title>
</head>
<body style="background-color: #000; color: #f2f2f3">
<!-- #26282b -->
<!-- 	<div class="container-fluid" style="padding: 0;"> -->
		<!--top부분 -->
<!-- 		<div class="col-xs-12 col-md-12 col-lg-12" style="padding: 0;"> -->
		<div class="main-container">
		<%@ include file="component/top.jsp" %>
<!-- 		</div> -->
		<!--content 부분 -->
<!-- 	 	<div class="col-xs-12 col-md-12 col-lg-12 composePage" style="padding: 0;"> -->
		<%@ include file="main/defaultPage.jsp" %>
		</div>
<!-- 		</div> -->
		<!--footer 부분 -->
<!-- 		<div class="col-xs-12 col-md-12 col-lg-12" style="padding: 0;"> -->
		<%@ include file="component/footer.jsp" %>
<!-- 		</div> -->
<!-- 	</div> -->
</body>
</html>



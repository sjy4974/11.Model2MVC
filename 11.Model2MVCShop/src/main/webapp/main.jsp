<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--   jQuery , Bootstrap CDN  -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
    <link href="/css/animate.min.css" rel="stylesheet">
    <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   	<!-- Latest compiled and minified CSS -->
   	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">

	<!-- Optional theme -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css" integrity="sha384-6pzBo3FDv/PJ8r2KRkGHifhEocL+1X2rVCTTkUfGk7/0pbek5mMa1upzvWbrUbOZ" crossorigin="anonymous">
   
    <!-- Bootstrap Dropdown Hover JS -->
    		<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js" integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous"></script>
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
	
	<!--  CSS 추가 : 툴바에 화면 가리는 현상 해결 :  주석처리 전, 후 확인-->
	<style>
        body {
            padding-top : 70px;
        }
   	</style>
   	
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	 	
	
</head>
	
<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
		
	<div class="container ">
      <!-- Main jumbotron for a primary marketing message or call to action -->
        <h3>Model2MVCShop </h3>
        <p>J2SE , DBMS ,JDBC , Servlet & JSP, Java Framework , HTML5 , UI Framework 학습 후 Mini-Project 진행</p>
    </div>
	<br>
		
		<div class="container">
			
			  <div id="myCarousel" class="carousel slide" data-ride="carousel">
			      <!-- Indicators -->
			      <ol class="carousel-indicators">
			        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			        <li data-target="#myCarousel" data-slide-to="1"></li>
			        <li data-target="#myCarousel" data-slide-to="2"></li>
			      </ol>
			      <div class="carousel-inner" role="listbox">
			        <div class="item active">
			          <img class="first-slide" src="/images/unnamed1.jpg" alt="First slide">
			          <div class="container">
			            <div class="carousel-caption">
			              <h2>나폴레옹은 이렇게 말했다.</h2>
			              <p>"오늘 나의 불행은 언젠가 내가 잘못 보낸 시간의 보복이다."</p>
			            </div>
			          </div>
			        </div>
			        <div class="item">
			          <img class="second-slide" src="/images/unname2.jpg" alt="Second slide">
			          <div class="container">
			            <div class="carousel-caption">
			              <h2>랜디 포쉬</h2>
			              <p> "... 장벽은 절실하게 원하지 않는 사람들을 걸러내려고 존재합니다. 장벽은. 당신이 아니라 '다른' 사람들을 멈추게 하려고 거기 있는 것이지요."
			              </p>
			            </div>
			          </div>
			        </div>
			        <div class="item">
			          <img class="third-slide" src="http://placehold.it/1440X360" alt="Third slide">
			          <div class="container">
			            <div class="carousel-caption">
			              <h2>혜광스님</h2>
			              <p>"행복한 삶의 비결은. 좋아하는 일을 하는 것이 아니라, 지금 하는 일을 좋아하는 것입니다."</p>
			            </div>
			          </div>
			        </div>
			      </div>
			      <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
			        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
			        <span class="sr-only">Previous</span>
			      </a>
			      <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
			        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			        <span class="sr-only">Next</span>
			      </a>
			    </div>
		</div>

</body>

</html>
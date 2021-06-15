<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<title>상품구매</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   <script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
   <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
       body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
            padding-top : 50px;
        }
    </style>

<script type="text/javascript" src="../javascript/calendar.js"></script>

<script type="text/javascript">

	function fncAddPurchase() {
		$("form").attr("method","POST").attr("action","/purchase/addPurchase").submit();
	}
	
	$(function(){
		$ ( "button:contains('구매')").on("click", function(){
			fncAddPurchase();
		});
	});
	
	$(function(){
		$ ( "button:contains('취소')").on("click", function(){
			history.go(-1);
		});
	});
	
	$( function() {
	    $( "#divyDate" ).datepicker();
	});
	
	$.datepicker.setDefaults({
        dateFormat: 'yymmdd',
    });

</script>
</head>

<body>

	<jsp:include page="/layout/toolbar.jsp" />
   	
   <div class="container">
	
		<h2 class="bg-danger text-center">상품구매</h2>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal" enctype="multipart/form-data">

		  <div class="form-group">
		   <input type="hidden" name="prodNo" value="${product.prodNo}"/>
		    <label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">상 품 명</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="prodName" name="prodName" value="${product.prodName}" readonly>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="price" class="col-sm-offset-1 col-sm-3 control-label">상품 이미지</label>
		    <div class="col-sm-4">
		    <img src = "/images/uploadFiles/${product.fileName} " width="150px" height="150px"/>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">상품상세정보</label>
		    <div class="col-sm-4">
		    <textarea style="height:100px; resize:none;" class="form-control" id="prodDetail" name="prodDetail" readonly>${product.prodDetail}</textarea>
<!-- 		      <input type="text" style="height:50px;" class="form-control" id="prod_detail" name="prod_detail" placeholder="상품상세정보"> -->
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="price" class="col-sm-offset-1 col-sm-3 control-label">가 격</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="price" name="price" value="${product.price}"  readonly>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">제조일자</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="manuDate" name="manuDate" value="${product.manuDate}" readonly>
		    </div>
		  </div>
		  
		  
		   <div class="form-group">
		    <label for="userId" class="col-sm-offset-1 col-sm-3 control-label">구매자아이디 </label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="userId" name="userId" value="${user.userId}" readonly>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="paymentOption" class="col-sm-offset-1 col-sm-3 control-label">구매방법 </label>
		    <div class="col-sm-4">
		      <select 	name="paymentOption"		class="ct_input_g" 
							style="width: 100px; height: 19px" maxLength="20">
				<option value="1" selected="selected">현금구매</option>
				<option value="2">신용구매</option>
			</select>
		    </div>
		  </div>
		  
		   <div class="form-group">
		    <label for="receiverName" class="col-sm-offset-1 col-sm-3 control-label">구매자이름 </label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="receiverName" name="receiverName" >
		    </div>
		  </div>
		  
		   <div class="form-group">
		    <label for="receiverPhone" class="col-sm-offset-1 col-sm-3 control-label">구매자연락처 </label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="receiverPhone" name="receiverPhone" >
		    </div>
		  </div>
		  
		   <div class="form-group">
		    <label for="divyAddr" class="col-sm-offset-1 col-sm-3 control-label">구매자주소 </label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="divyAddr" name="divyAddr" >
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="divyRequest" class="col-sm-offset-1 col-sm-3 control-label">구매요청사항 </label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="divyRequest" name="divyRequest" >
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="divyRequest" class="col-sm-offset-1 col-sm-3 control-label">구매요청사항 </label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="divyRequest" name="divyRequest" >
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="divyDate" class="col-sm-offset-1 col-sm-3 control-label">배송희망일자</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="divyDate" name="divyDate" placeholder="클릭해주세요.">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-danger"  >구매</button>
			  <button type="button" class="btn btn-danger">취소</button>
		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
		
 	</div>
</body>
</html>
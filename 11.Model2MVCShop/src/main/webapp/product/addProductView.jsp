<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

    <html>
<head>
<title>상품등록</title>

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

	$(function(){
		$("button.btn.btn-danger").on("click", function(){
			fncAddProduct();
		});
	});
	
	$(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("a[href='#' ]").on("click" , function() {
			$("form")[0].reset();
		});
	});	
	
	$( function() {
	    $( "#manuDate" ).datepicker();
	});
	
	$.datepicker.setDefaults({
        dateFormat: 'yymmdd',
    });

	function fncAddProduct(){
	
		var name = $("input[name='prodName']").val();
		var detail = $("textarea[name='prodDetail']").val();
		var manuDate = $("input[name='manuDate']").val();
		var price = $("input[name='price']").val();
		
		if(name == null || name.length<1){
			alert("상품명은 반드시 입력하여야 합니다.");
			return;
		}
		if(detail == null || detail.length<1){
			alert("상품상세정보는 반드시 입력하여야 합니다.");
			return;
		}
		if(manuDate == null || manuDate.length<1){
			alert("제조일자는 반드시 입력하셔야 합니다.");
			return;
		}
		if(price == null || price.length<1){
			alert("가격은 반드시 입력하셔야 합니다.");
			return;
		}
		
		$("form").attr("method" , "POST").attr("action" , "/product/addProduct").submit();
	}
	
// 	function previewImage(targetObj, View_area) {
// 		var preview = document.getElementById(View_area); //div id
// 		var ua = window.navigator.userAgent;
// 		var files = targetObj.files;
// 		for ( var i = 0; i < files.length; i++) {
// 			var file = files[i];
// 			var imageType = /image.*/; //이미지 파일일경우만.. 뿌려준다.
// 			if (!file.type.match(imageType))
// 				continue;
// 			var prevImg = document.getElementById("prev_" + View_area); //이전에 미리보기가 있다면 삭제
// 			if (prevImg) {
// 				preview.removeChild(prevImg);
// 			}
// 			var img = document.createElement("img"); 
// 			img.id = "prev_" + View_area;
// 			img.classList.add("obj");
// 			img.file = file;
// 			img.style.width = '100px'; 
// 			img.style.height = '100px';
// 			preview.appendChild(img);
// 			if (window.FileReader) { // FireFox, Chrome, Opera 확인.
// 				var reader = new FileReader();
// 				reader.onloadend = (function(aImg) {
// 					return function(e) {
// 						aImg.src = e.target.result;
// 					};
// 				})(img);
// 				reader.readAsDataURL(file);
// 			}
// 		}
// 	}
//	
	



</script>
</head>

<body>

	<jsp:include page="/layout/toolbar.jsp" />
   	
   <div class="container">
	
		<h1 class="bg-danger text-center">상 품 등 록</h1>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal" enctype="multipart/form-data">
		  <div class="form-group">
		    <label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">상 품 명</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="prodName" name="prodName" placeholder="상 품 명">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="fileName1" class="col-sm-offset-1 col-sm-3 control-label">상품이미지</label>
		    <div class="col-xs-3">
		      <input type="file" id="fileName1" name="fileName1">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">상품상세정보</label>
		    <div class="col-sm-4">
		    <textarea style="height:100px; resize:none;" class="form-control" id="prodDetail" name="prodDetail" placeholder="상품상세정보"></textarea>
<!-- 		      <input type="text" style="height:50px;" class="form-control" id="prod_detail" name="prod_detail" placeholder="상품상세정보"> -->
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">제조일자</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="manuDate" name="manuDate" placeholder="제조일자">
		    </div>
		  </div>
		  
		 <div class="form-group">
		    <label for="price" class="col-sm-offset-1 col-sm-3 control-label">가 격</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="price" name="price" placeholder="가격">
		    </div>
		  </div>
		  
		  
		   <div class="form-group">
		    <label for="price" class="col-sm-offset-1 col-sm-3 control-label">이미지 업로드</label>
		  	<input type="file" name="profile_pt" id="profile_pt" onchange="previewImage(this,'View_area')">
				<div align="center">
				<div id='View_area' style='position:relative; width: 100px; height: 100px; color: black; border: 0px solid black; dispaly: flex; '>
				</div>
				</div>
			</div>
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-danger"  >등 &nbsp;록</button>
			  <a class="btn btn-danger btn" href="#" role="button">취&nbsp;소</a>
		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
		
 	</div>
</body>
</html>
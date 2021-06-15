<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

    <html>
<head>
<title>��ǰ���</title>

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
		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
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
			alert("��ǰ���� �ݵ�� �Է��Ͽ��� �մϴ�.");
			return;
		}
		if(detail == null || detail.length<1){
			alert("��ǰ�������� �ݵ�� �Է��Ͽ��� �մϴ�.");
			return;
		}
		if(manuDate == null || manuDate.length<1){
			alert("�������ڴ� �ݵ�� �Է��ϼž� �մϴ�.");
			return;
		}
		if(price == null || price.length<1){
			alert("������ �ݵ�� �Է��ϼž� �մϴ�.");
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
// 			var imageType = /image.*/; //�̹��� �����ϰ�츸.. �ѷ��ش�.
// 			if (!file.type.match(imageType))
// 				continue;
// 			var prevImg = document.getElementById("prev_" + View_area); //������ �̸����Ⱑ �ִٸ� ����
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
// 			if (window.FileReader) { // FireFox, Chrome, Opera Ȯ��.
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
	
		<h1 class="bg-danger text-center">�� ǰ �� ��</h1>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal" enctype="multipart/form-data">
		  <div class="form-group">
		    <label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">�� ǰ ��</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="prodName" name="prodName" placeholder="�� ǰ ��">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="fileName1" class="col-sm-offset-1 col-sm-3 control-label">��ǰ�̹���</label>
		    <div class="col-xs-3">
		      <input type="file" id="fileName1" name="fileName1">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">��ǰ������</label>
		    <div class="col-sm-4">
		    <textarea style="height:100px; resize:none;" class="form-control" id="prodDetail" name="prodDetail" placeholder="��ǰ������"></textarea>
<!-- 		      <input type="text" style="height:50px;" class="form-control" id="prod_detail" name="prod_detail" placeholder="��ǰ������"> -->
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">��������</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="manuDate" name="manuDate" placeholder="��������">
		    </div>
		  </div>
		  
		 <div class="form-group">
		    <label for="price" class="col-sm-offset-1 col-sm-3 control-label">�� ��</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="price" name="price" placeholder="����">
		    </div>
		  </div>
		  
		  
		   <div class="form-group">
		    <label for="price" class="col-sm-offset-1 col-sm-3 control-label">�̹��� ���ε�</label>
		  	<input type="file" name="profile_pt" id="profile_pt" onchange="previewImage(this,'View_area')">
				<div align="center">
				<div id='View_area' style='position:relative; width: 100px; height: 100px; color: black; border: 0px solid black; dispaly: flex; '>
				</div>
				</div>
			</div>
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-danger"  >�� &nbsp;��</button>
			  <a class="btn btn-danger btn" href="#" role="button">��&nbsp;��</a>
		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
		
 	</div>
</body>
</html>
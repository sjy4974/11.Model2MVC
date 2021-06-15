<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>

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
   
   
   <!-- jQuery UI toolTip 사용 CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip 사용 JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	  body {
            padding-top : 50px;
        }
    </style>
    
<script type="text/javascript">
	// 검색 / page 두가지 경우 모두 Form 전송을 위해 JavaScrpt 이용 
	
	function fncGetList(currentPage) {
		
		$("#currentPage").val(currentPage)
	   	$("form").attr("method", "POST").attr("action","/product/listProduct?menu=${menu}").submit();	
	}
	
	$(function() {
		
		$( "button.btn.btn-default" ).on("click" , function() {
			fncGetList(1);
		});
		 
	});
	
	$( function(){
		
		$( "td:nth-child(2)").on("click", function(){
			
			var menu = location.search.substring(6);
			var prodNo = $(this).find('input').val();
			
			self.location = "/product/getProduct?prodNo="+prodNo+"&menu="+menu;
		});
		
		$( "td:nth-child(2)" ).css("color" , "blue");
	});
			
				
	$( function(){	
		$( "td:nth-child(6) > i").on("mouseover", function(){
				
			var prodNo = $(this).next().val();
			
			$.ajax(
					{
						url : "/product/json/getProduct/"+prodNo ,
						method : "GET" ,
						dataType : "json" ,
						headers : {
							"Accept" : "application/json" ,
							"Content-Type" : "application/json" ,
						},
						success : function(JSONData , status) {
							
							var displayValue = "<h6>"
									+"상품명 : "+JSONData.prodName+"<br/>"
									+"상품이미지 : <img src = /images/uploadFiles/"+JSONData.fileName+"/ height=50' width='50'><br>"
									+"가격 : "+JSONData.price+"<br/>"
							
							$("h6").remove();
							$("#"+prodNo+"").html(displayValue);		
						}
			});
			
		});
		
	
	});


	
	
</script>
</head>

<body >

<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-info">
	       	<c:if test= "${menu == 'manage'}"> 
				<h3>상품 관리</h3>
			</c:if>
			<c:if test= "${menu == 'search'}"> 
				<h3>상품 목록조회</h3>
			</c:if>
	    </div>
	    
	    <!-- table 위쪽 검색 Start /////////////////////////////////////-->
	    <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
		    	</p>
		    </div>
		    
		    <div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
			    
				  <div class="form-group">
				    <select class="form-control" name="searchCondition" >
						<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>상품번호</option>
						<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>상품명</option>
						<option value="2"  ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>상품가격</option>
					</select>
				  </div>
				  
				  <div class="form-group">
				    <label class="sr-only" for="searchKeyword">검색어</label>
				    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="검색어"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"
				    			 onkeypress="javascript:if(window.event.keyCode==13){fncGetList('1')}"  >
				  </div>
				  
				  <button type="button" class="btn btn-default">검색</button>
				  
				  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				</form>
	    	</div>
	    	
		</div>
		<!-- table 위쪽 검색 Start /////////////////////////////////////-->
		
		
      <!--  table Start /////////////////////////////////////-->
      <table class="table table-hover table-striped" >
      
        <thead>
          <tr>
            <th align="center">No</th>
            <th align="left" >상품명</th>
            <th align="left">가격</th>
            <th align="left">등록일</th>
            <th align="left">현재상태</th>
            <th align="left">간략정보</th>
          </tr>
        </thead>
       
		<tbody>
		
		  <c:set var="i" value="0" />
		  <c:forEach var="product" items="${list}">
			<c:set var="i" value="${ i+1 }" />
			<tr>
			  <td align="center">${ i }</td>
			  <td align="left"  title="Click : 상품정보 확인">
			  	${product.prodName}<input type ="hidden" value="${product.prodNo}">
			  </td>
			  <td align="left">${product.price}</td>
			  <td align="left">${product.regDate}</td>
			  <c:if test="${menu == 'manage'}">
				<td align="left">
				<c:choose>
					<c:when test= "${product.proTranCode == '1  ' }">
						구매완료 
						<!-- <a href="/product/updateTranCodeByProd?prodNo=${product.prodNo}&tranCode=2&page=${search.currentPage}">배송하기</a> -->
						&nbsp;배송하기<input type="hidden" value="${product.prodNo}">
					</c:when>
					<c:when test= "${product.proTranCode == '2  ' }">
						배송중
					</c:when>
					<c:when test= "${product.proTranCode == '3  ' }">
						배송완료
					</c:when>
					<c:otherwise>
						판매중
					</c:otherwise>
				</c:choose>
				</td>
			</c:if>
			
			<c:if test="${menu == 'search'}">
				<td align="left">
				<c:choose>
					<c:when test= "${product.proTranCode == null }">
						판매중
					</c:when>
					<c:otherwise>
						재고없음
					</c:otherwise>
				</c:choose>
				</td>
			</c:if>
			  <td align="left">
			  	<i class="glyphicon glyphicon-ok" id= "${product.prodNo}"></i>
			  	<input type="hidden" value="${product.prodNo}">
			  </td>
			</tr>
          </c:forEach>
        
        </tbody>
      
      </table>
	  <!--  table End /////////////////////////////////////-->
	  
 	</div>
 	<!--  화면구성 div End /////////////////////////////////////-->
 	
 	
 	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	<!-- PageNavigation End... -->
	
</body>
</html>

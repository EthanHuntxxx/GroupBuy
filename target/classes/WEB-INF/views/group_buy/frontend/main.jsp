<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>團購網首頁</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/purecss@3.0.0/build/pure-min.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<!-- menu -->
	<%@include file="../menu.jspf"%>
	<div class="w-100 h-50 d-flex justify-content-center">

		<form action="${pageContext.request.contextPath}/mvc/group_buy/frontend/search" method="get" class="my-4">
		    <label for="search">搜尋商品:</label> 
		    <input type="text" id="search" name="search" placeholder="輸入商品名稱">
		    <button type="submit">搜尋</button>
		    <p />
		    <div class="d-grid gap-2 col-6 mx-auto">
		        <button class="btn btn-primary" type="button">銷售排行</button>
		    </div>
		</form>

	</div>
	<div class="w-100 h-50 d-flex flex-wrap align-content-start ms-5">
		<c:forEach items="${ products }" var="product">
			<div class="card mx-2 m-1" style="width: 18rem;">
				<a
					href="/GroupBuy/mvc/group_buy/frontend/product/detail/${ product.productId }"
					class="mx-auto"> <img
					src="/GroupBuy/images/${ product.productId }.jpg"
					class="card-img-top mt-1" alt=""
					style="width: 150px; height: 150px">
				</a>
				<div class="card-body">
					<h5 class="card-title">${ product.productName }</h5>
					<p class="card-text">${ product.price }元</p>
					<div class="card-text mb-1">已售出數量：${totalQuantities[product.productId]}</div>
					
					<form method="post" action="./addToCart" class="pure-form">
						<div class="d-flex justify-content-center px-1">
							數量: <input type="number" id="quantity" name="quantity" value="1"
								style="width: 90px;" /> ${ product.unit }
							<button type="submit" ${ (empty products)?'disabled':'' }
								class="pure-button pure-button-primary ms-1">新增</button>
						</div>
						<input type="hidden" id="productId" name="productId"
							value="${ product.productId}" />
						<p />
							
					</form>
				</div>
			</div>
		</c:forEach>

	</div>

	<!-- <div style="padding: 15px">
			<form method="post" action="./addToCart" class="pure-form">
				<fieldset>
					<legend>團購網首頁</legend>
					商品: <select id="productId" name="productId">
							<c:forEach items="${ products }" var="product" >
								<option value="${ product.productId }">
									${ product.productName }
									( ${ product.price } 元 / ${ product.unit } )
								</option>
							</c:forEach>
						 </select><p />
					數量: <input type="number" id="quantity" name="quantity" value="5" /><p />
					<button type="submit"
							${ (empty products)?'disabled':'' }		 
							class="pure-button pure-button-primary">新增</button>	 
				</fieldset>
			</form>
		</div>-->
</body>
</html>
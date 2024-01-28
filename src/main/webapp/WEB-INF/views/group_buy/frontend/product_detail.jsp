<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>產品頁</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/purecss@3.0.0/build/pure-min.css">
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet">
	    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
	    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
	  
	    
</head>
<body>
<%@include file="../menu.jspf" %>

<div class="mx-auto" style="width: 70%; margin-left: 15%; margin-right: 15%; margin-bottom: 5%;">
  <img src="/GroupBuy/images/${productId}.jpg" class="rounded mx-auto d-block" alt="" style="width:300px; height:300px; object-fit: contain;">
</div>


<!-- <div class="mx-auto" style="width: 600px; background-color: green;"> 
  Centered element0000000000000000000037533753737535
  
  
  45
</div> -->

<!-- > <section class="mx-auto" style="width: 70%; margin-left: 15%; margin-right: 15%;">
  <p class="mt-2">產品資訊 ${productId}</p>
</section>  -->




 <section class ="mx-auto" style="width: 60%; margin-left: 15%; margin-right: 15%; background-color: #f0f0f0;">

<dl class="row">
  <dt class="col-sm-3">商品名稱</dt>
  
   <dd class="col-sm-9">${ product.productName }</dd>




  <dt class="col-sm-3">商品價錢</dt>
  <dd class="col-sm-9">
    <p>${ product.price } 元</p>
    <p></p>
  </dd>

  <dt class="col-sm-3"></dt>
  <dd class="col-sm-9"></dd>

  <dt class="col-sm-3 text-truncate">介紹</dt>
  <dd class="col-sm-3">${ product.productDetail }</dd>
  
  
  </dd>
</dl>

<p class="">
</p> 

</section>  


<!--<div class ="w-100 h-100 d-flex justify-content-center">
<img src="/GroupBuy/images/${ productId }.jpg" class="card-img-top mt-1" alt="" style="width:150px;height:150px">
產品資訊 ${ productId }
</div>-->
</body>
</html>
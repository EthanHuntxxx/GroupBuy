<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
  
   <dd class="col-sm-9">${ productId }</dd>




  <dt class="col-sm-3">商品價錢</dt>
  <dd class="col-sm-9">
    <p>${ product.price }</p>
    <p>And some more placeholder definition text.</p>
  </dd>

  <dt class="col-sm-3">產地</dt>
  <dd class="col-sm-9">This definition is short, so no extra paragraphs or anything.</dd>

  <dt class="col-sm-3 text-truncate">介紹</dt>
  <dd class="col-sm-9">This can be useful when space is tight. Adds an ellipsis at the end.</dd>

  <dt class="col-sm-3">Nesting</dt>
  <dd class="col-sm-9">
    <dl class="row">
      <dt class="col-sm-4">Nested definition list</dt>
      <dd class="col-sm-8">I heard you like definition lists. Let me put a definition list inside your definition list.</dd>
    </dl>
  </dd>
</dl>

<p class="">66666 666666  66666666666 666666666666666  6666666666
44
44645656666666666666666666666666666666666666666666666666666666666  666666666666666666666fghfghfghfghfghfghfghjfjjthgh
</p> 
${ product.price }
${ productId }

</section>  


<!--<div class ="w-100 h-100 d-flex justify-content-center">
<img src="/GroupBuy/images/${ productId }.jpg" class="card-img-top mt-1" alt="" style="width:150px;height:150px">
產品資訊 ${ productId }
</div>-->
</body>
</html>
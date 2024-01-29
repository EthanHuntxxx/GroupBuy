<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
	<head>
		
		<meta charset="UTF-8">
		<title>團購網-購物車</title>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/purecss@3.0.0/build/pure-min.css">
		<link rel="stylesheet" href="/GroupBuy/css/group_buy.css">
		 <link href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.3/dist/sweetalert2.min.css" rel="stylesheet">
		 
		<script type="text/javascript">
		
			function updateItem(itemId) {
				var quantity = document.getElementById('item_' + itemId + '_quantity').value;
				window.location.href='./cart/update?itemId=' + itemId + '&quantity=' + quantity;
			}
			
			function deleteItem(itemId) {
				window.location.href='./cart/delete?itemId=' + itemId;
			}
			
		</script>
		
	</head>
	<body>
		<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.3/dist/sweetalert2.all.min.js"></script>
	
		<!-- menu -->
		<%@include file="../menu.jspf" %>
		
		<div style="padding: 15px">
			<form class="pure-form">
				<fieldset>
					<legend>團購網-購物車</legend>
					<table class="pure-table pure-table-bordered">
						<thead>
							<tr><th>序號</th><th>品名</th><th>價格</th><th>單位</th><th>數量</th><th>小計</th><th>修改數量</th><th>刪除</th></tr>
						</thead>
						<tbody>
							<c:forEach items="${ cart.cartItems }" var="item">
								<tr>
									<td>${ item.itemId }</td>
									<td>${ item.product.productName }</td>
									<td>${ item.product.price }</td>
									<td>${ item.product.unit }</td>
									<td>
										<input type="number"
											   min="0"
											   onChange="updateItem(${ item.itemId })"	 
											   id="item_${ item.itemId }_quantity" value="${ item.quantity }" />
									</td>
									<td>${ item.product.price * item.quantity }</td>
									<td>
										<a href="javascript:void(0);" onClick="updateItem(${ item.itemId })" class="pure-button button-success">修改</a>
									</td>	
									<td>
										<!--
										<button onClick="event.preventDefault();deleteItem(${ item.itemId });"
                                                class="button-error pure-button">刪除</button>
                                        -->         
										<a href="javascript:void(0);" onClick="deleteItem(${ item.itemId })" class="pure-button button-error">刪除</a>
										
									</td>
								</tr>
							</c:forEach>
							<tr>
								<td colspan="5" align="right">總計</td>
								<td>${ total }</td>
								<td colspan="2"></td>
							</tr>
						</tbody>
					</table>
					<p />
					<a href="javascript:void(0);" ${ cart.cartItems == '[]' ? 'disabled' : '' } class="pure-button pure-button-primary" onclick="showCheckoutConfirmation();">結帳</a>
					<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.3/dist/sweetalert2.all.min.js"></script>
					<script>
					    function showCheckoutConfirmation() {
					        Swal.fire({
					            title: '確認結帳',
					            text: '您確定要進行結帳嗎？',
					            icon: 'question',
					            showCancelButton: true,
					            confirmButtonText: '確定',
					            cancelButtonText: '取消'
					        }).then((result) => {
					            if (result.isConfirmed) {
					                // 使用者按下確定，執行結帳相關的操作
					                location.href = './checkout';
					            }
					        });
					    }
					</script>				
						</fieldset>
			</form>
		</div>
		
	</body>
</html>
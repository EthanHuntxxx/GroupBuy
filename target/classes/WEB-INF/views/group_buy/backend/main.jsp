<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sp" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>團購網-後臺商品維護</title>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/purecss@3.0.0/build/pure-min.css">
		<link rel="stylesheet" href="/GroupBuy/css/group_buy.css">
		<script type="text/javascript">
			function changeLaunch(productId, isLaunch) {
				//console.log(productId, isLaunch);
				location.href = './update_product_launch?productId=' + productId + '&isLaunch=' + isLaunch;
			}
		</script>
	</head>
	<body>
		<!-- menu -->
		<%@include file="../menu.jspf" %>
		
		<div style="padding: 15px"> 
			<table>
				<tr>
					<td valign="top">
						<sp:form modelAttribute="product" method="post" action="./addProduct" class="pure-form">
							<fieldset>
								<legend>團購網-商品新增</legend>
								品名: <sp:input path="productName" name="productName" value="水果茶" /><p />
								價格: <sp:input type="number" path="price" value="40" /><p />
								單位: 
								<!-- <sp:select path="unit" items="${ units }" /> -->
								<input list="unitList" name="unit" id="unitInput" class="form-control d-inline-block" style="width: auto;">
								<datalist id="unitList">
								    <option value="杯">
								    <option value="瓶">
								    <option value="包">
								    <option value="箱">
								    <option value="組">
								</datalist>
								&nbsp;&nbsp;&nbsp;&nbsp;	 
								上架: <sp:checkbox path="isLaunch" /> 
								<p />
								<label class="btn btn-outline-primary ">上傳圖片:
								  <input type="file" name="upfile[]" id="upfile" multiple 
								         class="upfile d-none" accept=".jpg, .jpeg, .png, .gif">
								</label>
								<p />
								<label>
								商品資訊: <sp:textarea path="productDetail" name="productDetail" style="width: 300px; height:300px;" /><p />
								<button type="submit" class="pure-button pure-button-primary">新增</button>
								</label>
							</fieldset>
						</sp:form>
					</td>
					<td valign="top" style="padding-left: 15px">
						<form class="pure-form">
							<fieldset>
								<legend>團購網-後臺商品維護</legend>
								<table class="pure-table pure-table-bordered">
									<thead>
										<tr><th>序號</th><th>ID</th><th>品名</th><th>價格</th><th>單位</th><th>上架</th></tr>
									</thead>
									<tbody>
										<c:forEach items="${ products }" var="product" varStatus="status">
										<tr>
											<td>${ status.count+1 }</td>
											<td>${ product.productId }</td>
											<td>${ product.productName }</td>
											<td>${ product.price }</td>
											<td>${ product.unit }</td>
											<td><input 
													onClick="changeLaunch(${ product.productId }, this.checked)"
													type="checkbox" ${ (product.isLaunch) ? 'checked' : '' } 
													value="true"> 上架</td>
										</tr>
										</c:forEach>
									</tbody>
								</table>
								<p />
							</fieldset>
						</form>
					</td>
				</tr>
			</table>
		</div>
	</body>
</html>
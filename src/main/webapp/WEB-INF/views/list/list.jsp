<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품목록 페이지</title>
</head>
<body>
	<button type="button" id="show_all">전체보기</button>
	<button type="button" id="show_kitchen">주방용품</button>
	<button type="button" id="show_food">음식</button>
	<button type="button" id="by_food">가격순</button>
	<button type="button" id="by_orderCount">주문순</button>

	<table border="1">
		<tr id="title">
			<th>id</th>
			<th>name</th>
			<th>price</th>
			<th>orderCount</th>
			<th>type</th>
		</tr>
		<c:forEach var="product" items="${products}">
			<tr class="item">
				<td>${product.id}</td>
				<td>${product.name}</td>
				<td>${product.price}</td>
				<td>${product.orderCount}</td>
				<td>${product.type}</td>
			</tr>
		</c:forEach>
	</table>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script>
		var btnStatus = 1;
		var new_product='';
		$('#show_all').on(
				'click',
				function() {

					$.ajax({
						type : 'GET',
						url : '/list/api/listAll',
						dataType : 'json'
					}).done(
							function(result) {
								$('.item').remove();
								result.forEach(function(product) {
									
									new_product += "<tr class='item'><td>"
											+ product.id + "</td><td>"
											+ product.name + "</td><td>"
											+ product.price + "</td><td>"
											+ product.orderCount + "</td><td>"
											+ product.type + "</td></tr>";
									
								});
								console.log(new_product);
								$('#title').after(new_product);
								new_product='';
								
								btnStatus = 1;
							}).fail(function(result) {
						alert('서버오류');
					});
				});
		$('#show_kitchen').on(
				'click',
				function() {

					$.ajax({
						type : 'GET',
						url : '/list/api/listKitchen',
						contentType : 'application/json; charset=utf-8',
						dataType : 'json'
					}).done(
							function(result) {
								$('.item').remove();
								result.forEach(function(product) {
									
									new_product += "<tr class='item'><td>"
											+ product.id + "</td><td>"
											+ product.name + "</td><td>"
											+ product.price + "</td><td>"
											+ product.orderCount + "</td><td>"
											+ product.type + "</td></tr>";
									
								});
								console.log(new_product);
								$('#title').after(new_product);
								new_product='';
							
								btnStatus = 2;
							}).fail(function(result) {
						alert('서버오류');
					});
				});

		$('#show_food').on(
				'click',
				function() {

					$.ajax({
						type : 'GET',
						url : '/list/api/listFood',
						contentType : 'application/json; charset=utf-8',
						dataType : 'json'
					}).done(
							function(result) {
								$('.item').remove();
								result.forEach(function(product) {
									
									new_product += "<tr class='item'><td>"
											+ product.id + "</td><td>"
											+ product.name + "</td><td>"
											+ product.price + "</td><td>"
											+ product.orderCount + "</td><td>"
											+ product.type + "</td></tr>";
									
								});
								console.log(new_product);
								$('#title').after(new_product);
								new_product='';
								btnStatus = 3;
							}).fail(function(result) {
						alert('서버오류');
					});
				});

		$('#by_food').on(
				'click',
				function() {

					$.ajax({
						type : 'GET',
						url : '/list/api/orderbyPrice/' + btnStatus,
						contentType : 'application/json; charset=utf-8',
						dataType : 'json'
					}).done(
							function(result) {
								$('.item').remove();
								result.forEach(function(product) {
									
									new_product += "<tr class='item'><td>"
											+ product.id + "</td><td>"
											+ product.name + "</td><td>"
											+ product.price + "</td><td>"
											+ product.orderCount + "</td><td>"
											+ product.type + "</td></tr>";
									
								});
								console.log(new_product);
								$('#title').after(new_product);
								new_product='';
							}).fail(function(result) {
						alert('서버오류');
					});
				});
		
		$('#by_orderCount').on(
				'click',
				function() {

					$.ajax({
						type : 'GET',
						url : '/list/api/orderbyOrderCount/' + btnStatus,
						contentType : 'application/json; charset=utf-8',
						dataType : 'json'
					}).done(
							function(result) {
								$('.item').remove();
								result.forEach(function(product) {
									
									new_product += "<tr class='item'><td>"
											+ product.id + "</td><td>"
											+ product.name + "</td><td>"
											+ product.price + "</td><td>"
											+ product.orderCount + "</td><td>"
											+ product.type + "</td></tr>";
									
								});
								console.log(new_product);
								$('#title').after(new_product);
								new_product='';
							}).fail(function(result) {
						alert('서버오류');
					});
				});
	</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<!-- 샘플jsp -->
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<%@include file="/WEB-INF/views/basicView/resourceH.jsp" %>
</head>
<body>
<div class="super_container">
<%@include file="/WEB-INF/views/basicView/header.jsp" %>
<div class="home">
		<div class="parallax_background parallax-window" data-parallax="scroll" data-image-src="${pageContext.request.contextPath}/resources/images/home.jpg" data-speed="0.8"></div>
		<div class="home_container d-flex flex-column align-items-center justify-content-center">
			<div class="home_title"><h1>Book Your Stay</h1></div>
			<div class="home_text text-center">Fusce erat dui, venenatis et erat in, vulputate dignissim lacus. Donec vitae tempus dolor, sit amet elementum lorem. Ut cursus tempor turpis.</div>
			<div class="button home_button"><a href="#">book now</a></div>
		</div>
</div>
<script>
$(function(){
	$("#btnList").click(function(){
		location.href="${pageContext.request.contextPath}/product/list";
	});
	$("#btnDelete").click(function(){
		if(confirm("장바구니를 비우시겠습니까?")){
			location.href="${pageContext.request.contextPath}/cart/deleteAll.do";
		}
	});
});
</script>
<h2>장바구니</h2>
<c:choose>
	<c:when test="${map.count == 0 }">
	장바구니가 비었습니다.
	</c:when>
	<c:otherwise>
		<form id="form1" name="form1" method="post"
		action="${pageContext.request.contextPath}/cart/update.do">
			<table border="1" width="400px;">
				<tr>
					<th>상품명</th>
					<th>단가</th>
					<th>수량</th>
					<th>금액</th>
					<th>&nbsp;</th>
				</tr>
<!--  forEach var="개별변수" items="집합변수" -->
<c:forEach var="row" items="${map.list}">
	<tr align="center">
		<td>${row.product_name}</td>
		<td><fmt:formatNumber value="${row.price}"
				pattern="#,###,###" /></td>
		<td><input type="number" name="amount"
			style="width:30px;"
			value="<fmt:formatNumber value="${row.amount}"
				pattern="#,###,###" />">
			<input type="hidden" name="amount"
			value="${row.amount}">
			<input type="hidden" name="cart_id"
				value="${row.cart_id}">
		</td>
		<td><fmt:formatNumber value="${row.money}"
			pattern="#,###,###"/></td>
		<td><a href=
		"${pageContext.request.contextPath}/cart/delete.do?cart_id=${row.cart_id}">[삭제]</a>
		</td>
	</tr>
</c:forEach>
	<tr>
		<td colspan="5" align="right">
			장바구니 금액 합계 :
			<fmt:formatNumber value="${map.sumMoney}"
				pattern="#,###,###" /><br>
				배송료 : ${map.fee}<br>
				총합계 : <fmt:formatNumber value="${map.sum}"
					pattern="#,###,###" />
			</td>
		</tr>
	</table>
	<button id="btnUpdate">수정</button>
	<button type="button" id="btnDelete">장바구니 비우기</button>
	</form>
</c:otherwise>
</c:choose>
<button type="button" id="btnList">상품목록</button>






<!-- 바로위 home class에 data-image-src에 원하는 사진넣으시고 -->
<!--요기다 내용  집어넣으세요-->



<%@include file="/WEB-INF/views/basicView/footer.jsp" %>
</div>
<%@include file="/WEB-INF/views/basicView/resourceF.jsp" %>
</body>
</html>
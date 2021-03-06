<%@ page language="java" 
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<!-- 샘플jsp -->
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<%@include file="/WEB-INF/views/basicView/resourceH.jsp" %>
</head>
<script>
function product_update(){
	document.form1.action="${pageContext.request.contextPath}/product/update.do";
	document.form1.submit();
}
function product_delete() {
	if(confirm("삭제하시겠습니까?")){
		document.form1.action="${pageContext.request.contextPath}/product/delete.do";
		document.form1.submit();
	}
}
</script>
<body>
<div class="super_container">
<%@include file="/WEB-INF/views/basicView/header2.jsp" %>
<div class="home">
		<div class="parallax_background parallax-window" data-parallax="scroll" data-image-src="${pageContext.request.contextPath}/resources/images/room21.jpg" data-speed="0.8"></div>
		<div class="home_container d-flex flex-column align-items-center justify-content-center">
			<div class="home_title"><h1>Hotel & Resort</h1></div>
			<div class="home_text text-center">Fusce erat dui, venenatis et erat in, vulputate dignissim lacus. Donec vitae tempus dolor, sit amet elementum lorem. Ut cursus tempor turpis.</div>
			
		</div>
</div>

<div class="rooms_right_content">
	<div class="section_title text-center">
		<div style="margin-top: 100px;">Edit product information</div>
		<h1>Amazing Hotel in front of the Sea</h1>
</div>
<div class="row intro_row">
				<div class="col-xl-8 col-lg-10 offset-xl-2 offset-lg-1">
					<div class="intro_text text-center">
						<p>Maecenas sollicitudin tincidunt maximus. Morbi tempus malesuada erat sed pellentesque. Donec pharetra mattis nulla, id laoreet neque scelerisque at. Quisque eget sem non ligula consectetur ultrices in quis augue. Donec imperd iet leo eget tortor dictum, eget varius eros sagittis. Curabitur tempor dignissim massa ut faucibus sollicitudin tinci dunt maximus. Morbi tempus malesuada erat sed pellentesque. Donec pharetra mattis nulla, id laoreet neque scele risque at. Quisque eget sem non ligula consectetur ultrices in quis augue. Donec imperdiet leo eget tortor dictum, eget varius eros sagittis. Curabitur tempor dignissim massa ut faucibus.</p>
					</div>
				</div>
			</div>




<h2 style="display: table; margin-left: auto; margin-right: auto; margin-top: 5%;">상품 정보 편집</h2>
<form id="form1" name="form1" method="post"
	enctype="multipart/form-data">
	<table style="display: table; margin-right: auto; margin-left: auto;">
		<tr>
			<td>상품명</td>
			<td><input name="product_name" value="${dto.product_name}"></td>
		</tr>
		<tr>
			<td>가격</td>
			<td><input name="price" type="number" value="${dto.price}"></td>
		</tr>
		<tr>
			<td>상품설명</td>
			<td><textarea rows="5" cols="60" name="description"
				id="description">${dto.description}</textarea></td>
		</tr>
		<tr>
			<td>상품 이미지</td>
			<td>
				<img src="${pageContext.request.contextPath}/resources/images/${dto.picture_url}"
					width="300px" height="300px">
				<br>
				<input type="file" name="file1">
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="hidden" name="product_id"
				value="${dto.product_id}">
				<input type="button" value="수정" onclick="product_update()">
				<input type="button" value="삭제" onclick="product_delete()">
				<input type="button" value="목록"
				 onclick="location.href='${pageContext.request.contextPath}/product/list'">
			</td>
		</tr>
	</table>
</form>
</div>



<!-- 바로위 home class에 data-image-src에 원하는 사진넣으시고 -->
<!--요기다 내용  집어넣으세요-->



<%@include file="/WEB-INF/views/basicView/footer.jsp" %>
</div>
<%@include file="/WEB-INF/views/basicView/resourceF.jsp" %>
</body>
</html>
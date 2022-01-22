<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html >
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<meta charset="utf-8">
<style>
* {
	margin: 0 auto;
	padding: 0 auto;
}

.list_view {
	width: 80%;
	color: rgb(51, 51, 51);
	font-size: 0.8em;
	margin-top: 20px;
	border-top-color: rgb(51, 51, 51);
	border-top-width: 2px;
	border-top-style: solid;
	border-collapse: collapse;
}

.list_view tr {
	margin: 0px;
	padding: 10px 0px;
	border-bottom-color: rgb(153, 153, 153);
	border-bottom-width: 1px;
	border-bottom-style: dotted;
}

.list_view td {
	margin: 0px;
	padding: 10px 0px;
	border-bottom-color: rgb(153, 153, 153);
	border-bottom-width: 1px;
	border-bottom-style: dotted;
	border: 1px solid #444444;
}

#search {
	width: 100px;
	margin: auto;
	display: block;
}

.list_view td a:hover {
	text-decoration-line: underline;
}

#search a:hover {
	text-decoration-line: underline;
}

a {
	text-decoration-line: none;
}

a:hover {
	color: silver;
}
</style>
</head>
<body>
	<h1></h1>
	<DIV class="clear"></DIV>
	<TABLE class="list_view">
		<TBODY align=center>
			<tr>
				<td>제목</td>
				<td>등록번호</td>
				<td>작가</td>
				<td>제작년도</td>
				<td>재료 및 기법</td>
				<td>작품규격</td>
				<td style=" background-color:#D6E6F0;">내용</td>
				<td></td>
			</tr>
			<c:choose>
				<c:when test="${empty newGoodsList }">
					<TR>
						<TD colspan=8 class="fixed"><strong>조회된 상품이 없습니다.</strong></TD>
					</TR>
				</c:when>
				<c:otherwise>
					<c:forEach var="item" items="${newGoodsList }">
						<TR>
							<TD><strong>${item.goods_title}</strong></TD>
							<TD><strong>${item.goods_no} </strong></TD>
							<TD><strong>${item.goods_author} </strong></TD>
							<TD><strong>${item.goods_year}</strong></TD>
							<TD><strong>${item.goods_stuff}</strong></TD>
							<TD><strong>${item.goods_standard}</strong></TD>
							<TD><a
								href="${contextPath}/collectible/collectibleDetail.do?goods_id=${item.goods_id}"
								style='cursor: pointer; font-size: 1em; font-weight: 700; color:#A3CCA3;'>
									<strong>${item.goods_note}</strong>
							</a></TD>
							<td>
							<input type=button value="삭제" style='cursor: pointer; border:none;'
								onClick="fn_remove_goods('${contextPath}/admin/goods/removeGoods.do', ${item.goods_id})">
								&#9;
							<input type=button value="수정" style='cursor: pointer; border:none;'
								onClick="location.href='${contextPath}/admin/goods/modifyGoodsForm.do?goods_id=${item.goods_id}'">
							</td>
						</TR>
					</c:forEach>
				</c:otherwise>
			</c:choose>
			<tr>
				<td colspan=8 class="fixed">
				<c:forEach var="page" begin="1" end="10" step="1">
						<c:if test="${section >1 && page==1 }">
							<a
								href="${contextPath}/admin/goods/adminGoodsMain.do?chapter=${section-1}&pageNum=${(section-1)*10 +1 }">&nbsp;
								&nbsp;</a>
						</c:if>
						<a
							href="${contextPath}/admin/goods/adminGoodsMain.do?chapter=${section}&pageNum=${page}">${(section-1)*10 +page }
						</a>
						<c:if test="${page ==10 }">
							<a
								href="${contextPath}/admin/goods/adminGooodsMain.do?chapter=${section+1}&pageNum=${section*10+1}">&nbsp;
								next</a>
						</c:if>
					</c:forEach>
		</TBODY>

	</TABLE>

	<DIV id="search">
		<a href="${contextPath}/admin/goods/addNewGoodsForm.do"
			style='cursor: pointer; font-size: 1.5em; font-weight: 700; color: #000;'>등록하기</a>
	</DIV>

	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script>
function fn_remove_goods(url,goods_id){
	 var form = document.createElement("form");
	 form.setAttribute("method", "post");
	 form.setAttribute("action", url);
    var GoodsInput = document.createElement("input");
    GoodsInput.setAttribute("type","hidden");
    GoodsInput.setAttribute("name","goods_id");
    GoodsInput.setAttribute("value", goods_id);
	 
    form.appendChild(GoodsInput);
    document.body.appendChild(form);
    form.submit();

}
</script>

</body>
</html>
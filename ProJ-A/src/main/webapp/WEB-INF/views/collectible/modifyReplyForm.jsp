<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<% request.setCharacterEncoding("UTF-8"); %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
*{
margin:0 auto;
}
table td {
  padding: 10px;
  vertical-align: top;
  border-bottom: 1px solid #ccc;
  background: #fff;
  }
table tr td input{
	border:none;
}
#myImg {
  border-radius: 5px;
  cursor: pointer;
  transition: 0.3s;
}

#myImg:hover {opacity: 0.7;}

/* The Modal (background) */
.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  padding-top: 100px; /* Location of the box */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.9); /* Black w/ opacity */
}

/* Modal Content (image) */
.modal-content {
  margin: auto;
  display: block;
  width: 80%;
  max-width: 700px;
}

/* Caption of Modal Image */
#caption {
  margin: auto;
  display: block;
  width: 80%;
  max-width: 700px;
  text-align: center;
  color: #ccc;
  padding: 10px 0;
  height: 150px;
}

/* Add Animation */
.modal-content, #caption {  
  -webkit-animation-name: zoom;
  -webkit-animation-duration: 0.6s;
  animation-name: zoom;
  animation-duration: 0.6s;
}

@-webkit-keyframes zoom {
  from {-webkit-transform:scale(0)} 
  to {-webkit-transform:scale(1)}
}

@keyframes zoom {
  from {transform:scale(0)} 
  to {transform:scale(1)}
}

/* The Close Button */
.close {
  position: absolute;
  top: 15px;
  right: 35px;
  color: #f1f1f1;
  font-size: 40px;
  font-weight: bold;
  transition: 0.3s;
}

.close:hover,
.close:focus {
  color: #bbb;
  text-decoration: none;
  cursor: pointer;
}

/* 100% Image Width on Smaller Screens */
@media only screen and (max-width: 700px){
  .modal-content {
    width: 100%;
  }
}
.addreply{
	text-align:center;
}
</style>
</head>
<body>
<form method="get"  action="${contextPath}/collectible/collectibleDetail.do">
<h1>???</h1>
	<div style="text-align:center">
			<img width="180" height="154" id="myImg"
				  src="${contextPath}/thumbnails.do?goods_id=${collectible.goods_id}&fileName=${collectible.goods_fileName}">
				 <p style="color:silver;">????????? ?????? ??? ?????? ???????????? ?????? ??? ????????????.</p>
	</div>
		<!-- The Modal -->
		<div id="myModal" class="modal">
			<span class="close">&times;</span> 
			<img class="modal-content" id="img01">
			<div id="caption"></div>
		</div>
		<table>
			<tbody>								
				<tr>
					<td>??????</td>
					<td>${collectible.goods_title}</td>
				</tr>
				<tr>
					<td>????????????</td>
					<td>${collectible.goods_no}</td>
				</tr>
				<tr>
					<td>??????</td>
					<td>${collectible.goods_author}</td>
				</tr>
				<tr>
					<td>????????????</td>
					<td>${collectible.goods_year}</td>
				</tr>
				<tr>
					<td>??????   ??? ??????</td>
					<td>${collectible.goods_stuff}</td>
				</tr>
				<tr>
					<td>????????????</td>
					<td>${collectible.goods_standard}</td>
				</tr>
				<tr>
					<td>??????</td>
					<td>${collectible.goods_note}</td>
				</tr>
		</table>
		<br><br>

</form>
<br/><br/>
<form name="updateForm" method="post" action="${contextPath}/collectible/modifyReply.do?goods_id=${reply.goods_id}&rno=${reply.rno}">
		<table>
			<tbody>
			<tr>  	
			<td><input type="hidden" name="goods_id" value="${reply.goods_id}" readonly="readonly"/>
				<input type="hidden" id="rno" name="rno" value="${reply.rno}" />	
				?????????  &#124; <input type=text value="${memberInfo.member_name}" disabled />
			</td>
        	<tr>
			<td>?????? &#124; <input type=text value="${reply.content }"  id="content"  name="content"/>
			<button type="submit" class="replyUpdateBtn2">??????</button>
			</td>
			</tr>	
			</tbody>
		</table>
</form>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
// Get the modal
var modal = document.getElementById("myModal");

// Get the image and insert it inside the modal - use its "alt" text as a caption
var img = document.getElementById("myImg");
var modalImg = document.getElementById("img01");
var captionText = document.getElementById("caption");
img.onclick = function(){
  modal.style.display = "block";
  modalImg.src = this.src;
  captionText.innerHTML = this.alt;
}

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks on <span> (x), close the modal
span.onclick = function() { 
  modal.style.display = "none";
}


function fn_enable(obj){
	 document.getElementById("content").disabled=false;

	 obj.submit();
}
$(document).ready(function(){
	var formObj = $("form[name='updateForm']");
	
$(".replyUpdateBtn2").on("click", function(){
	location.href = "${contextPath}/collectible/collectibleDetail.do?goods_id=${collectible.goods_id}"
});
</script>
</body>
</html>
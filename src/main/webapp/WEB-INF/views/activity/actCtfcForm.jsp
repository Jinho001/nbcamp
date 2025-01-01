<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="https://kit.fontawesome.com/d547fb2b9c.js"
	crossorigin="anonymous"></script>
<script src="/resources/js/activity.js"></script>

<style>
body {
	margin: 0;
	padding: 0;
	background-color: #f9f9f9;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
}

#header, #footer {
	display: none;
}

.form-container {
	width: 80%;
	max-width: 500px;
	margin: auto;
	padding: 20px;
	background-color: #fff;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	border-radius: 8px;
	text-align: center;
	font-family: "KoPubWorldBatang";
}

.form-container h2 {
	margin-bottom: 20px;
	color: #333;
}

.form-container form {
	display: flex;
	flex-direction: column;
	align-items: center;
	font-family: "KoPubWorldBatang"
}

.form-container input[type="file"] {
	margin: 20px 0;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 4px;
	font-family: "KoPubWorldBatang"
}

.form-container button {
	padding: 10px 20px;
	border: none;
	border-radius: 4px;
	background-color: #2E5A3C;
	color: white;
	font-size: 16px;
	cursor: pointer;
	transition: background-color 0.3s ease;
	font-family: "KoPubWorldBatang"
}

.form-container button:hover {
	background-color: #D4AF37;
}

.form-container p {
	color: #666;
	margin-top: 20px;
}
</style>

<script>
$(document).ready(function () {
	document.getElementById("Ctfc_Form").addEventListener("submit", function (event) {

		event.preventDefault();
	
		var formData = new FormData(this);
		
		fetch("/activity/actCtfc", {
            method: "POST",
            body: formData
        })
        .then(function(response) {
            return response.text();
            
        })
        .then(function(data){
        alert(data);
        window.opener.location.reload();
        window.close();
        })
        .catch(function(error) {
            console.error("Error:", error);
        });
	});
});
</script>

<div class="form-container">
	<h2>활동 인증</h2>
	<form id="Ctfc_Form" action="" method="post" enctype="multipart/form-data">
		<input type="hidden" id="actNo" name="actNo" value="${param.actno}">
		<input type="file" id="imgFile" name="imgFile" accept=".jpg, .png"
			required>
		<button type="submit">인증하기</button>
	</form>
	<p>JPG 또는 PNG 형식의 이미지를 업로드하세요.</p>
</div>
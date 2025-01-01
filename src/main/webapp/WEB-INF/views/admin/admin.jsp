<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<title>관리자 페이지</title>
<style>
body {
    padding: 0;
    margin: 0;
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
}

.admin-container {
    width: 80%;
    margin: 50px auto;
    background-color: #fff;
    border-radius: 10px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

nav {
    padding: 20px 0;
    text-align: center;
    border-bottom: 1px solid #ccc;
}

nav ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
}

nav ul li {
    display: inline;
    margin-right: 20px;
}

nav ul li:last-child {
    margin-right: 0;
}

nav ul li a {
    color: #333;
    text-decoration: none;
    font-size: 18px;
}

nav ul li a:hover {
    color: #007bff;
}

.content {
    padding: 20px;
}

/* 추가된 내용 */
.content h2 {
    margin-bottom: 20px;
    color: #333;
}

.content p {
    color: #666;
    line-height: 1.6;
}
</style>
</head>
<body>

<div class="admin-container">
    <nav>
        <ul>
            <li><a href="/board/list">지도 내용 수정</a></li>
            <li><a href="/admin/reportform">신고 내역 확인</a></li>
        </ul>
    </nav>

</div>

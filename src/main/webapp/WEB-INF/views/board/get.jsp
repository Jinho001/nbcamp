<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<style>
    html, body {
        font-family: 'KoPubWorldBatang', serif !important;
        font-weight: 900!important;
        font-size: 1em!important;
    }
</style>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <<style>
/* styles.css */
body {
            font-family: 'KoPub World Batang', serif; /* KoPub World Batang 폰트를 기본 폰트로 설정 */
        }

.container {
    width: 80%;
    margin: 0 auto;
    padding: 20px;
}

.panel {
    border: 1px solid #ddd;
    border-radius: 4px;
    box-shadow: 0 2px 3px rgba(0, 0, 0, 0.1);
    margin-bottom: 20px;
}

.panel-heading {
    background-color: #f5f5f5;
    padding: 10px 15px;
    border-bottom: 1px solid #ddd;
    border-top-left-radius: 3px;
    border-top-right-radius: 3px;
    font-weight: bold;
}

.panel-body {
    padding: 15px;
}

.table {
    width: 100%;
    margin-bottom: 20px;
    border-collapse: collapse;
}

.table-bordered {
    border: 1px solid #ddd;
}

.table-bordered td, .table-bordered th {
    border: 1px solid #ddd;
    padding: 8px;
}

.form-control {
    width: 100%;
    padding: 6px 12px;
    margin-bottom: 10px;
    box-sizing: border-box;
}

textarea.form-control {
    resize: vertical;
}

.btn {
    display: inline-block;
    padding: 6px 12px;
    margin-bottom: 0;
    font-size: 14px;
    font-weight: 400;
    text-align: center;
    white-space: nowrap;
    vertical-align: middle;
    cursor: pointer;
    border: 1px solid transparent;
    border-radius: 4px;
    text-decoration: none;
}

.btn-primary {
    color: #fff;
    background-color: #337ab7;
    border-color: #2e6da4;
}

.btn-success {
    color: #fff;
    background-color: #5cb85c;
    border-color: #4cae4c;
}

.btn-info {
    color: #fff;
    background-color: #5bc0de;
    border-color: #46b8da;
}

.btn-danger {
    color: #fff;
    background-color: #d9534f;
    border-color: #d43f3a;
}

.alert {
    padding: 15px;
    margin-bottom: 20px;
    border: 1px solid transparent;
    border-radius: 4px;
}

.alert-warning {
    background-color: #fcf8e3;
    border-color: #faebcc;
    color: #8a6d3b;
}

.alert-link {
    color: #66512c;
    font-weight: bold;
}

.row {
    display: flex;
    flex-wrap: wrap;
    margin-right: -15px;
    margin-left: -15px;
}

.col-md-6 {
    width: 50%;
    padding: 0 15px;
}

.col-md-12 {
    width: 100%;
    padding: 0 15px;
}

</style>
    <link rel="stylesheet" href="/resources/css/get.css">
    <script type="text/javascript">
        $(document).ready(function(){
            $("button").on("click", function(e){
                var formData=$("#frm");
                var btn=$(this).data("btn"); // data-btn="list"
                if(btn=='modify'){
                    formData.attr("action", "/board/modify");
                }else if(btn=='list'){
                    formData.find("#boardId").remove();
                    formData.attr("action", "/board/list");
                }
                formData.submit();
            });
        });
    </script>
<div class="container">
    <div class="panel panel-default">
        <div class="panel-heading">뉴스게시판</div>
        <div class="panel-body">
            <table class="table table-bordered">
                <tr>
                    <td>번호</td>
                    <td><input type="text" class="form-control" name="boardId" value="${vo.boardId}" disabled/></td>
                </tr>
                <tr>
                    <td>제목</td>
                    <td><input type="text" class="form-control" name="boardTitle" value="${vo.boardTitle}" disabled/></td>
                </tr>
                <tr>
                    <td>링크</td>
                    <td>
                        <a href="${vo.boardLink}" style="text-decoration: none; color: black;">Google 제로웨이스트 RSS 피드</a>
                        <%--https://aisi1004.tistory.com/468--%>
                    </td>
                </tr>
                <tr>
                    <td>작성자</td>
                    <td><input type="text" class="form-control" name="boardAuthor" value="${vo.boardAuthor}" disabled/></td>
                </tr>
                <sec:authorize access="hasRole('ROLE_ADMIN')">
                    <tr>
                        <td colspan="2" style="text-align: center;">
                            <button data-btn="modify" class="btn btn-sm btn-success">수정</button>
                            <button data-btn="list" class="btn btn-sm btn-info">목록</button>
                        </td>
                    </tr>
                </sec:authorize>
                <sec:authorize access="!hasRole('ROLE_ADMIN')">
                    <tr>
                        <td colspan="2" style="text-align: center;">
                            <button data-btn="list" class="btn btn-sm btn-info">목록</button>
                        </td>
                    </tr>
                </sec:authorize>
            </table>
        </div>
    </div>
</div>
        <form id="frm" method="get">
            <input type="hidden" id="boardId" name="boardId" value="${vo.boardId}"/>
            <input type="hidden" name="page" value="${cri.page}"/>
            <input type="hidden" name="perPageNum" value="${cri.perPageNum}"/>
            <input type="hidden" name="type" value="${cri.type}"/>
            <input type="hidden" name="keyword" value="${cri.keyword}"/>
        </form>

<script>
    const commentWrite = () => {
        const contents = document.getElementById("commentContents").value;
        const board = '${vo.boardId}';

        $.ajax({
            type: "post",
            url: "/comment",
            data: {
                commentContent: contents,
                boardId: board
            },
            dataType: "json",
            success: function(commentList) {
                let output = "<table>";
                output += "<tr><th>댓글 번호</th>";
                output += "<th>작성자</th>";
                output += "<th>내용</th>";
                output += "<th>작성 시간</th></tr>";
                for(let i in commentList){
                    output += "<tr>";
                    output += "<td>"+commentList[i].commentId+"</td>";
                    output += "<td>"+commentList[i].userid+"</td>";
                    output += "<td>"+commentList[i].commentContent+"</td>";
                    output += "<td>"+commentList[i].commentCreatedDate+"</td>";
                    output += "</tr>";
                }
                output += "</table>";
                document.getElementById('comment-list').innerHTML = output;
                document.getElementById('commentWriter').value='';
                document.getElementById('commentContents').value='';
                location.reload(true);
            },
            error: function() {
                var errorMessage = xhr.status + ': ' + xhr.statusText;
                alert("error");
                console.log('AJAX Error - ' + errorMessage);
                console.log('Error Details - ' + error);
            }
        });
    }

    function deleteComment(commentId) {
        if (confirm('정말로 삭제하시겠습니까?')) {
            $.ajax({
                type: 'DELETE',
                url: '/comment/'+commentId,
                success: function(response) {
                    // 삭제 성공 시 해당 댓글 행을 테이블에서 제거합니다.
                    if (response === "success") {
                        alert("댓글이 삭제되었습니다.");
                        $('#comment-' + commentId).remove();
                        location.reload(true);
                    } else {
                        alert("댓글 삭제에 실패했습니다.");
                    }
                },
                error: function(xhr, status, error) {
                    alert("서버와의 통신 중 오류가 발생했습니다.");
                }
            });
        }
    }
</script>

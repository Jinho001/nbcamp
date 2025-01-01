<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
div > h3 {
	color: #2E5A3C;
}
#todayDate{
	font-size: 25px;
	color: #2E5A3C;
	margin-bottom: 5px;
}
#dailymissionList {
	text-align: center;
    padding: 10px;
    padding-left: 50px;
    padding-right: 50px;
    border-radius: 20px; 
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); 
}
#dailyList {
	width: 100%;
    border-collapse: separate;
    border-spacing: 15px 6px;
    }
#dailyList tr td {
    padding: 10px 15px;
}

#dailyList tr {
    border-bottom: 1px solid #ddd;
}
#dailyList tr:last-child {
    border-bottom: none;
}
#dailyList td a {
    text-decoration: none;
    color: #2E5A3C;
}
#dailyList td a:hover {
    color: #5F5F5F;
}
#missionName:hover{
    font-weight: bold;
}

</style>



    <div id="dailymissionList">
		<p id="todayDate">오늘의 일일 랜덤 미션<p>
		<p style="color: #C2D2B8">미션 수행 시 포인트 두 배 지급</p>
		<table id="dailyList">
			<tr>
				<!-- <th width="10%">순번</th> -->
				<!-- <th width="80%">이름</th>
				<th width="20%">포인트</th> -->
			</tr>
			<c:choose>
				<c:when test="${missions eq null or empty missions}">
					<tr>
						<td colspan="3"><b>데이터가 없습니다</b></td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="mission" items="${missions}" varStatus="loop">
						<tr>
							<%-- <td><c:out value="${loop.index + 1}" /></td> --%>
							<td id="missionName"><a href="/actDetail/${mission.actId}"><c:out value="${mission.actName}" /></a></td>
							<%-- <td id="point"><c:out value="${2 * mission.point}" /></td> --%>
						</tr>
						<!-- --------------------------- -->
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
	</div>

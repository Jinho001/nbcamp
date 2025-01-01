function actStart() {
	actno = parseInt($('#actno').val());
	location.href = '/activity/actStart?actno=' + actno;
}

function actCtfc() {
	actno = parseInt($('#actno').val());
	var url = '/activity/actCtfcForm?actno=' + actno;
	win = open(url, "Activity Certification", "width=500, height=500, left=100, top=100");
}

function addBookmark(username) {
	if (username == "") {
		alert('로그인이 필요합니다.');
	}

	else {
		actNo = parseInt($('#actno').val());
		$.ajax({
			type: 'GET',
			url: '/activity/addBookmark',
			data: {
				actNo: actNo
			},
			success: function (response) {
				// 성공적으로 북마크가 추가되면 여기에 처리할 코드 작성
				location.reload(true)
			},
			error: function (xhr, status, error) {
				// 오류가 발생했을 때 여기에 처리할 코드 작성
				alert("북마크 추가에 실패했습니다."); // 실패 메시지 출력 예시
			}
		});
	}
}

function removeBookmark(username) {
	actNo = parseInt($('#actno').val());
	$.ajax({
		type: 'GET',
		url: '/activity/removeBookmark',
		data: {
			actNo: actNo
		},
		success: function (response) {
			// 성공적으로 북마크가 삭제될 경우
			alert(response); // 성공 메시지 출력 예시
			location.reload(true)
		},
		error: function (xhr, status, error) {
			// 오류 발생
			alert("즐겨찾기 삭제를 실패했습니다."); // 실패 메시지 출력 예시
		}
	});

}

function actSts() {
	actNo = parseInt($('#actno').val());
	// 카운터 변수 초기화
	var countInProgress = 0;
	var countCompleted = 0;
	$.ajax({
		url: '/actSts/' + actNo,
		success: function (map) {
			// 기존 요소 제거
			$('#stsListContainer').empty();
			$.each(map.stsList, function (index, item) {
				let username = item.userid;
				if(username.length > 15){
					username = username.substring(0,16);
				}
				const listItem = $(`
				<div class="stateContainer">
					<div class = "stsInfo">
	                    아이디:`+username+`<br>
	                    상태:${item.stateName}<br>
	                    시작일:${item.startDate}<br>
	                    인증일:${item.endDate}<br>
	                    <button class="report-btn" data-stsno="${item.stateId}">신고하기</button>
	                </div>
	                <div class="image-container">
	                	<img src="/resources/upload/${item.ctfcFilename}" height="120px">
	                </div>	               	
                </div>
                `);

				$('#stsListContainer').append(listItem);
			});

			// 카운터 출력
			$("#statusCounts").text(`진행중: ${map.ing} / 진행완료: ${map.end}`);
		}
	});
}

function goActList(){
	window.location.href="/actList";
}

$(document).ready(function () {
	$('#stsListContainer').on('click', '.report-btn', function () {
		var stsNo = $(this).data('stsno');
		goReportForm(stsNo);
	});

	function goReportForm(stsId){
		var url = '/activity/actReportForm?stsId='+stsId;
		win = open(url, "Activity Report", "width=500, height=600, left=100, top=100");
	}
});


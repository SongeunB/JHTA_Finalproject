<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/header.jsp"%>
<%@ include file="/WEB-INF/views/top.jsp"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>
<script src="${cp}/resources/js/jspdf.min.js"></script>
<script src="${cp}/resources/js/bluebird.min.js"></script>
<style>
#table_container {
	margin-bottom: 300px;
}

#mytable {
	text-align: center;
}

#mytable th {
	background-color: #f2f2f2;
}

#mytable td {
	height: 55px;
	vertical-align: middle;
}

.tableTime {
	font-size: 13px;
}

#subList_wrapper {
	display: none;
	position: fixed;
	z-index: 998;
	width: 90%;
	height: 300px;
	bottom: 0;
	background-color: white;
	height: 300px;
	overflow-y: auto;
}

.tableSubBack {
	position: absolute;
	margin-top: -27px;
	margin-left: -12px;
	width: 218.33px;
	background-color: white;
}

.tableSubBox {
	position: absolute;
	width: 218.33px;
	padding-top: 50px;
}

.tableSubBox p {
	color: black;
}

.s_height1 {
	height: 110px;
}

.s_height2 {
	height: 165px;
}

.s_height3 {
	height: 220px;
}
</style>

<!-- Main Content 이건 지우지 마세요-->
<div id="content">
	<div id="subList_wrapper">
		<table class="table table-hover">
			<thead>
				<tr>
					<th>과목번호</th>
					<th>과목명</th>
					<th>교수명</th>
					<th>구분</th>
					<th>학점</th>
					<th>요일/시간</th>
					<th>강의실</th>
					<th>강의평점</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="vo" items="${list }">
					<tr>
						<td>${vo.s_num }</td>
						<td style="cursor: pointer;"
							onclick="javascript:ontable(${vo.s_num})">${vo.s_name }</td>
						<td>${vo.s_prof }</td>
						<td>${vo.s_category }</td>
						<td>${vo.s_score }점</td>
						<td>${vo.s_day }/${vo.s_starttime }~${vo.s_endtime }시</td>
						<td>${vo.s_class }</td>
						<c:choose>
							<c:when test="${vo.sr_recommend==0 }">
								<td data-toggle="tooltip" data-placement="right"
									title="클릭시 강의평가로 이동"><a
									href="${cp}/timetable/subjectList?keyword=${vo.s_name }">강의평가
										없음</a></td>
							</c:when>
							<c:otherwise>
								<td data-toggle="tooltip" data-placement="right"
									title="클릭시 강의평가로 이동"><a
									href="${cp}/timetable/subjectList?keyword=${vo.s_name }">${vo.sr_recommend }</a></td>
							</c:otherwise>
						</c:choose>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<!-- Begin Page Content 이건 지우지마세요 -->
	<div class="container-fluid" id="table_container">
		<!-- Page Heading -->
		<div id="mytable_wrapper1">
			<div
				class="d-sm-flex align-items-center justify-content-between mb-4">
				<h1 class="h3 mb-0 text-gray-800">내 시간표</h1>
				<div class="btn-group" role="group"
					aria-label="Basic outlined example">
					<button type="button" class="btn btn-outline-primary"
						onclick="subjectlist();">강의목록</button>
					<button type="button" class="btn btn-outline-primary"
						id="captureBtn">캡쳐</button>
					<button type="button" class="btn btn-outline-primary"
						data-toggle="modal" data-target="#tableSaveModal"
						data-whatever="tableSave">저장</button>
					<button type="button"
						class="btn btn-outline-primary dropdown-toggle" type="button"
						id="dropdownMenuButton1" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false">불러오기</button>
					<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
					<c:choose>
						<c:when test="${!empty tablelist }">
							<c:forEach var="tvo" items="${tablelist }">
								<li><a class="dropdown-item" onclick="tableLoad(${tvo.tt_name })">${tvo.tt_name }</a></li>
							</c:forEach>
						</c:when>
						<c:otherwise>
								<li>저장된 시간표 없음</li>
						</c:otherwise>
					</c:choose>
					</ul>
				</div>
			</div>
			<div id="mytable_wrapper2">
				<table id="mytable" class="table table-bordered" width="100%">
					<tr>
						<th scope="col">시간</th>
						<th scope="col" class="col-2">월</th>
						<th scope="col" class="col-2">화</th>
						<th scope="col" class="col-2">수</th>
						<th scope="col" class="col-2">목</th>
						<th scope="col" class="col-2">금</th>
						<th scope="col">시간</th>
					</tr>
					<tr>
						<td class="tableTime">오전 9시</td>
						<td id="mon9"></td>
						<td id="tue9"></td>
						<td id="wed9"></td>
						<td id="thu9"></td>
						<td id="fri9"></td>
						<td class="tableTime">오전 9시</td>
					</tr>
					<tr>
						<td class="tableTime">오전 10시</td>
						<td id="mon10"></td>
						<td id="tue10"></td>
						<td id="wed10"></td>
						<td id="thu10"></td>
						<td id="fri10"></td>
						<td class="tableTime">오전 10시</td>
					</tr>
					<tr>
						<td class="tableTime">오전 11시</td>
						<td id="mon11"></td>
						<td id="tue11"></td>
						<td id="wed11"></td>
						<td id="thu11"></td>
						<td id="fri11"></td>
						<td class="tableTime">오전 11시</td>
					</tr>
					<tr>
						<td class="tableTime">오후 12시</td>
						<td id="mon12"></td>
						<td id="tue12"></td>
						<td id="wed12"></td>
						<td id="thu12"></td>
						<td id="fri12"></td>
						<td class="tableTime">오후 12시</td>
					</tr>
					<tr>
						<td class="tableTime">오후 1시</td>
						<td id="mon13"></td>
						<td id="tue13"></td>
						<td id="wed13"></td>
						<td id="thu13"></td>
						<td id="fri13"></td>
						<td class="tableTime">오후 1시</td>
					</tr>
					<tr>
						<td class="tableTime">오후 2시</td>
						<td id="mon14"></td>
						<td id="tue14"></td>
						<td id="wed14"></td>
						<td id="thu14"></td>
						<td id="fri14"></td>
						<td class="tableTime">오후 2시</td>
					</tr>
					<tr>
						<td class="tableTime">오후 3시</td>
						<td id="mon15"></td>
						<td id="tue15"></td>
						<td id="wed15"></td>
						<td id="thu15"></td>
						<td id="fri15"></td>
						<td class="tableTime">오후 3시</td>
					</tr>
					<tr>
						<td class="tableTime">오후 4시</td>
						<td id="mon16"></td>
						<td id="tue16"></td>
						<td id="wed16"></td>
						<td id="thu16"></td>
						<td id="fri16"></td>
						<td class="tableTime">오후 4시</td>
					</tr>
					<tr>
						<td class="tableTime">오후 5시</td>
						<td id="mon17"></td>
						<td id="tue17"></td>
						<td id="wed17"></td>
						<td id="thu17"></td>
						<td id="fri17"></td>
						<td class="tableTime">오후 5시</td>
					</tr>
					<tr>
						<td class="tableTime">오후 6시</td>
						<td id="mon18"></td>
						<td id="tue18"></td>
						<td id="wed18"></td>
						<td id="thu18"></td>
						<td id="fri18"></td>
						<td class="tableTime">오후 6시</td>
					</tr>
				</table>
			</div>
		</div>
		<div id="modalmoya"></div>
		<!-- 이건 지우지마세요 -->
	</div>
</div>
<!-- 이건 지우지마세요 -->

<!-- 시간표저장하기 modal -->
<div class="modal fade" id="tableSaveModal" tabindex="-1" role="dialog"
	aria-labelledby="tableSaveModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" id="tableSaveModalLabel"
					style="margin: auto; text-align: center;">시간표저장하기</h4>
			</div>
			<div class="modal-body">
				<form>
					<div class="mb-3">
						<label for="table-name" class="col-form-label">시간표 이름</label> <input
							type="text" class="form-control" id="table-name">
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
				<a class="btn btn-primary" onclick="tableSave()">저장하기</a>
			</div>
		</div>
	</div>
</div>



<script type="text/javascript">
	function tooltip() {
	  $('[data-toggle="tooltip"]').tooltip();
	}
	
	const numList = [];

	/*강의목록 토글버튼*/
	function subjectlist() {
		$("#subList_wrapper").toggle();
	}

	/*강의클릭시 시간표 해당위치에 강의div 생성*/
	function ontable(s_num) {
		let divId = "";
		$.ajax({
			url : '${cp}/timetable/selectOne',
			data : {
				"s_num" : s_num
			},
			dataType : 'json',
			success : function(data) {
				let name = data.vo.s_name;
				let prof = data.vo.s_prof;
				let sclass = data.vo.s_class;
				let day = data.vo.s_day;
				let starttime = data.vo.s_starttime;
				let endtime = data.vo.s_endtime;
				let b_color = "#80"
						+ (parseInt(Math.random() * 0xfffff9)).toString(16);
				switch (day) {
				case '월':
					divId = "mon";
					break;
				case '화':
					divId = "tue";
					break;
				case '수':
					divId = "wed";
					break;
				case '목':
					divId = "thu";
					break;
				case '금':
					divId = "fri";
					break;
				}
				for (let i = 9; i <= 18; i++) {
					if (starttime == i) {
						divId += i;
					}
				}
				let s_height = parseInt(endtime) - parseInt(starttime);
				let html = "<div class='tableSubBack s_height" + s_height
				+ "'><div onclick='removeBox(this," + s_num
						+ ")' class='tableSubBox s_height" + s_height
						+ "' style='background-color:" + b_color + "'>";
				html += "<p>" + name + "<br>" + prof + "<br>" + sclass
						+ "<br></p>";
				html += "<input type='hidden' name='numList' value='"+ s_num + "'></div><div>";
				$("#" + divId).html(html);
			}
		});
	}

	/*강의div클릭시 시간표에서 제거*/
	function removeBox(e, s_num) {
		$(e).remove();
	}

	/*시간표 DB에 저장*/
	function tableSave() {
		var lengthN = $("input[name='numList']").length;
		for (let i = 0; i <= lengthN; i++) {
			if ($("input[name='numList']").eq(i).val() != null) {
				numList.push($("input[name='numList']").eq(i).val());
			}
		}
		let tt_name = $("#table-name").val();
		let numListParam = numList.join('&');
		$.ajax({
			url : '${cp}/timetable/tableInsert',
			data : {
				"tt_name" : tt_name,
				"numList" : numListParam
			},
			method : 'GET',
			dataType : 'json',
			success : function(data) {
				if (data.result == true) {
					alert("저장성공");
				} else {
					alert("저장실패");
				}
			}
		});
		$("#tableSaveModal").modal('hide');
	}
	
	/*시간표 캡쳐후 저장*/
	$('#captureBtn').click((e) => { 
		html2canvas(document.querySelector("#mytable_wrapper2")).then(canvas => {

                // 캔버스를 이미지로 변환
                var imgData = canvas.toDataURL('image/png');

                var imgWidth = 210; // 이미지 가로 길이(mm) A4 기준
                var pageHeight = imgWidth * 1.414;  // 출력 페이지 세로 길이 계산 A4 기준
                var imgHeight = canvas.height * imgWidth / canvas.width;
                var heightLeft = imgHeight;

                var doc = new jsPDF('p', 'mm');
                var position = 0;

                // 첫 페이지 출력
                doc.addImage(imgData, 'PNG', 0, position, imgWidth, imgHeight);
                heightLeft -= pageHeight;

                // 한 페이지 이상일 경우 루프 돌면서 출력
                while (heightLeft >= 20) {
                    position = heightLeft - imgHeight;
                    doc.addPage();
                    doc.addImage(imgData, 'PNG', 0, position, imgWidth, imgHeight);
                    heightLeft -= pageHeight;
                }
                // 파일 저장
                doc.save('sample.pdf');
            });
	});

	function tableLoad(tt_name) {
		$.ajax({
			url : '${cp}/timetable/tableDetailLoad',
			data : {"tt_name" : tt_name},
			method : 'GET',
			dataType : 'json',
			success : function(data) {
				if (data.result == false) {
					alert("불러올 정보가 없습니다.");
				} else {
					$(data.list).each(function(i,vo) {
						let s_num = vo.s_num;
						let name = vo.s_name;
						let prof = vo.s_prof;
						let sclass = vo.s_class;
						let day = vo.s_day;
						let starttime = vo.s_starttime;
						let endtime = vo.s_endtime;
						let b_color = "#80"
								+ (parseInt(Math.random() * 0xfffff9)).toString(16);
						switch (day) {
						case '월':
							divId = "mon";
							break;
						case '화':
							divId = "tue";
							break;
						case '수':
							divId = "wed";
							break;
						case '목':
							divId = "thu";
							break;
						case '금':
							divId = "fri";
							break;
						}
						for (let i = 9; i <= 18; i++) {
							if (starttime == i) {
								divId += i;
							}
						}
						let s_height = parseInt(endtime) - parseInt(starttime);
						let html = "<div class='tableSubBack s_height" + s_height
						+ "'><div onclick='removeBox(this," + s_num
								+ ")' class='tableSubBox s_height" + s_height
								+ "' style='background-color:" + b_color + "'>";
						html += "<p>" + name + "<br>" + prof + "<br>" + sclass
								+ "<br></p>";
						html += "<input type='hidden' name='numList' value='"+ s_num + "'></div><div>";
						$("#" + divId).html(html);
					});
				}
			}
		});
	}
</script>
<%@ include file="/WEB-INF/views/footer.jsp"%>
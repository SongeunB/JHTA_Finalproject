<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="/WEB-INF/views/header.jsp" %>
<%@ include file="/WEB-INF/views/top.jsp"%>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	
</script>
<!-- ---------------------------------------------------------------------------------------------------------------------- -->

<!-- Content Wrapper -->
	<div id="content-wrapper" class="d-flex flex-column">

<!-- Main Content -->
		<div id="content">

<!-- ---------------------------------------------------------------------------------------------------------------------- -->
<!-- Begin Page Content -->
<form method="post" action="${cp}/job/insert?${_csrf.parameterName }=${_csrf.token }" enctype="multipart/form-data" onsubmit="return checkNull()">
		<div class="container-fluid">


<!-- Approach -->
			
			<!-- 2. 채용공고 만들기 카드 -->
			<div class="row">
				<div class="col-8 offset-2">
			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<h5 class="m-0 font-weight-bold text-dark"> 채용공고 정보 작성</h5>
				</div>
				
				<div class="card-body">
						
					<!-- (1) 공고제목, 기업명, 채용기간, 채용형태	 -->
					<div class="card mb-3">
						<div class="col-md-8">
							<div class="card-body">
								
								<h6 class="card-title font-weight-bold text-dark">기업명</h6>
								<p class="card-text">
									<input type="text" id="j_company" name="j_company" maxlength="30" autocomplete="off" class="text"><br>
									<!-- 기업리스트 API 써야할듯! -->
									<div>
									</div>
								</p>
								<h6 class="card-title font-weight-bold text-dark">공고 제목</h6>
								<p class="card-text">
									<!-- 공고제목 입력 -->
									<input type="text" id="j_subject" name="j_subject" placeholder="" maxlength="30" autocomplete="off" class="text"><br>
								</p>
								<h6 class="card-title font-weight-bold text-dark">채용 기간</h6>
								<p class="card-text">
									<input type="date" id="j_startdate" name="j_startdate" autocomplete="off" class="text"> ~
									<input type="date" id="j_enddate" name="j_enddate" autocomplete="off" class="text">
								</p>
								<h6 class="card-title font-weight-bold text-dark">채용 형태</h6>
								<p class="card-text">
									<fieldset style="width:300px">
										<c:forEach items="${fn:split('신입|경력','|') }" var="career">
								    		<label><input type="checkbox" class="jc_career" name="jc_career" value="${career }">${career }</label>
								    	</c:forEach>
							    	</fieldset>
								</p>
							</div>
						</div>
					</div> <!-- (1) 공고제목, 기업명, 채용기간, 채용형태 끝 -->
					
						
					<!-- (2) 모집 부문 선택  -->
					<div class="card mb-3">
						<div class="col-md-8">
							
							<div class="card-body">
							
								<h6 class="card-title font-weight-bold text-dark">모집 부문</h6>
								<p class="card-text">
									<fieldset style="width:400px">
										<c:forEach items="${fn:split('영업·영업관리|전략·기획|마케팅·광고·홍보|회계·재무|인사·노무|유통·물류|IT·SW|연구개발·설계|생산·생산관리|건축·인테리어|토목·환경|의료·보건|교육|미디어|디자인|기타','|') }"
													var="duty">
									    	<label><input type="checkbox" class="jd_duty" name="jd_duty" value="${duty }" >${duty }</label>
									    </c:forEach><br>
									    <input type="reset" value="초기화">
								    </fieldset>
								</p>
								
							</div>
						</div>
					</div> <!-- (2) 모집 부문 끝 -->
						
					<!-- (3) 근무지역 -->
					<div class="card mb-3">
						<div class="col-md-8">
							
							<div class="card-body">
								<h6 class="card-title font-weight-bold text-dark">근무 지역입니다</h6>
								<p class="card-text">
									<fieldset style="width:300px">
										<c:forEach items="${fn:split('서울|경기|광주|대구|대전|부산|세종|울산|인천|강원|경남|경북|전남|전북|충남|충북|제주|해외|기타','|') }"
													var="zone">
									    	<label><input type="checkbox" class="jz_zone" name="jz_zone" value="${zone }">${zone }</label>
									    </c:forEach><br>
									    <input type="reset" value="초기화">
								    </fieldset>
								</p>
									
							</div>
								
						</div>
					</div> <!-- (3) 근무지역 끝 -->
						
					<!-- (4) 이미지 업로드 -->
					<div class="card mb-3">
						<div class="col-md-8">
							<div class="card-body">
								<h6 class="card-title font-weight-bold text-dark">기업 이미지 업로드</h6>
								<p class="card-text">
									<input type="file" id="file1" name="file1"> <br>
								</p>
								<h6 class="card-title font-weight-bold text-dark">공고 이미지 업로드</h6>
								<p class="card-text">
									<input type="file" id="file2" name="file2"> <br>
								</p>
							</div>
						</div>
					</div> <!-- (4) 이미지 업로드 끝 -->
					
					<!-- (5) 공고 URL -->
					<div class="card mb-3">
						<div class="col-md-8">
							
							<div class="card-body">
								<h6 class="card-title font-weight-bold text-dark">공고 URL</h6>
								<p class="card-text">
									<input type="text" id="j_url" name="j_url">
								</p>
							</div>
						</div>
					</div> <!-- (3) 근무지역 끝 -->
					<input type="submit" value="신청하기">
				</div> <!-- 채용카드의 body 끝 -->
			</div> <!-- 2. 채용카드 끝 -->
		</div>
		</div>
	</div>
</form>
<script>
	//유효성 검사
	function checkNull(){
		//기업명
		if($('#j_company').val()==""){
	        alert("기업명을 입력해 주시기 바랍니다.");
	        $('#j_company').focus();
	        return false;
	    }
	    //공고제목 
	    if($('#j_subject').val()==""){
	        alert("공고명을 입력해 주시기 바랍니다.");
	        $('#j_subject').focus();
	        return false;
	    }
	    //시작일
	    if($('#j_startdate').val()==""){
	        alert("시작일을 설정해 주시기 바랍니다.");
	        $('#j_startdate').focus();
	        return false;
	    }
	    //마감일
	    if($('#j_enddate').val()==""){
	        alert("마감일을 설정해 주시기 바랍니다.");
	        $('#j_enddate').focus();
	        return false;
	    }
	  	//채용형태
	    var length1 = $('input:checkbox[name=jc_career]:checked').length; //checkbox 카운트세기
	    if( length1 < 1 ){
	    	alert("채용 형태를 선택해주시기 바랍니다.");
	    	return false;
	    }
	    //모집부문
	    var length2 = $('input:checkbox[name=jd_duty]:checked').length;
	    if( length2 < 1 ){
	    	alert("모집 부문을 선택해주시기 바랍니다.");
	    	return false;
	    }
	    //근무지역
	    var length3 = $('input:checkbox[name=jz_zone]:checked').length;
	    if( length3 < 1 ){
	    	alert("근무 지역을 선택해주시기 바랍니다.");
	    	return false;
	    }
	    //기업이미지
	    if($('#file1').val()==""){
	        alert("기업이미지를 첨부해주시기바랍니다.");
	        $('#rphone').focus();
	        return false;
	    }
	    //공고이미지
	    if($('#file2').val()==""){
	        alert("공고이미지를 첨부해주시기 바랍니다.");
	        $('#rphone').focus();
	        return false;
	    }
	  	//채용사이트
	    if($('#j_url').val()==""){
	        alert("채용URL을 입력하여 주시기 바랍니다.");
	        $('#j_url').focus();
	        return false;
	    }
};
         
</script>      
<%@ include file="/WEB-INF/views/footer.jsp" %>
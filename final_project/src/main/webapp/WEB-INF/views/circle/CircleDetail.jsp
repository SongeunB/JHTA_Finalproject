<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 동아리 상세 보기 -->
<!-- Header -->
<%@ include file="/WEB-INF/views/header.jsp" %>
<!-- End of Header -->
<%@ include file="/WEB-INF/views/top.jsp"%>

<!-- ---------------------------------------------------------------------------------------------------------------------- -->
<style>
$breadcrumb-divider: quote(">");
</style>

<!-- Content Wrapper -->
	<div id="content-wrapper" class="d-flex flex-column">

<!-- Main Content -->
		<div id="content">

<!-- ---------------------------------------------------------------------------------------------------------------------- -->

<!-- Begin Page Content -->
		<div class="container-fluid">

<!-- Page Heading -->
			<!-- 
			<div class="d-sm-flex align-items-center justify-content-between mb-4">
				<h1 class="h3 mb-0 text-gray-800"> 동아리 상세보기 </h1>
					
			</div>
			 -->
			 
<!-- Approach -->
			<!-- 동아리 상세정보 카드 -->
			<div class="row">
			<div class="card shadow mb-4 col-6 offset-3">

				<div class="card-body">
					
					<nav style="--bs-breadcrumb-divider: '>'; background-color:primary;" aria-label="breadcrumb">
					  <ol class="breadcrumb">
					    <li class="breadcrumb-item"><a href="${ cp }/circle/CircleList">동아리</a></li>
					    <li class="breadcrumb-item active" aria-current="page">동아리 상세정보</li>
					  </ol>
					</nav>
					
					<!-- 1. 동아리 정보 -->
					<div class="card mb-3">
						<div class="row g-0">
							<div class="col-sm-9">
								<div class="card-body">
									<h5 class="card-title"> ${ sel.ci_title }</h5>
									<p class="card-text">
									
										<div class="row g-0">
											<div class="col-md-6">
												<ul id="dot">
													<li>
														<img src="${ cp }/resources/images/circle/${ sel.ci_logofile }" 
															 style="max-width: 50px;">
														<h6 class="m-0 font-weight-bold text-dark" style="display:inline;"> ${ sel.ci_name }</h6>
													</li>
													<li>카테고리 : ${ sel.ci_category }</li>
													<li>모집인원 : ${ sel.ci_person }</li> <!-- 2번 -->
												</ul>
											</div>
											<div class="col-md-6">
												<ul id="dot">
													<li>모집기간 : ${ sel.ci_startdate } 에서 ${ sel.ci_enddate } 까지</li>
													<li>조회수 : ${ sel.ci_view }</li> <!-- 3번 -->
													<li>좋아요수 : ${ sel.ci_recommend }</li> <!-- 4번 -->
												</ul>
											</div>
										</div>
												
									</p>
								</div>
									
							</div>
						</div>
					</div> <!-- 1. 동아리 정보 끝 -->
						
						
					<!-- 2. 동아리 게시글 상세 (포스터+글내용) -->
					<div class="card mb-3">
						<div class="col-md-8">
							<div class="card-body">
								<!-- (1) 포스터 -->
								<div class="col-md-8 offset-md-2 b">
									<img src="${ cp }/resources/images/circle/${ sel.ci_imgfile }"
										 style="max-width: 100%">
								</div>
								@@구분선@@d <br>
								<!-- (1) 포스터 끝 -->
								
								<!-- (2) 글내용 --> 
								${ sel.ci_content } <br>
								<!-- (2) 글내용 끝 --> 
							</div>
						</div>
					</div> <!-- 2. 동아리 게시글 상세 끝 -->
					
					<!-- 3. 동아리 신청하기 -->
					<div class="row g-0">
						<div class="col-md-7 offset-md-5">
							<input type="submit" value="신청하기">
						</div>
					</div>
					<!-- 3. 동아리 신청하기 끝 -->
						
				</div> <!-- 동아리 상세정보 카드 body 끝-->
			</div>
			</div> <!-- 동아리 상세정보 카드 끝 -->

		</div> <!-- container-fluid (Main Content의 메인부분) 끝-->
<!-- /.container-fluid -->
			
		</div> <!-- Main Content 끝-->
<!-- End of Main Content -->
			
	</div> <!-- ContentWrapper 끝 -->
<!-- End of Content Wrapper -->	


<!-- Footer -->
<%@ include file="/WEB-INF/views/footer.jsp" %>
<!-- End of Footer -->


	<!-- </div>  -->
<!-- End of Page Wrapper -->
		
<!-- ---------------------------------------------------------------------------------------------------------------------- -->
		
<!-- 스크롤 -->		
<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top">
		<i class="fas fa-angle-up"></i>
	</a>

<!-- 로그아웃 -->
<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		 aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">로그아웃 하시겠습니까?</h5>
					<button class="close" type="button" data-dismiss="modal"
							aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				
				<div class="modal-body">로그아웃하시려면 '로그아웃' 버튼을 눌러주세요.</div>
					
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
							data-dismiss="modal">취소
					</button>
					<a class="btn btn-primary" href="login.html">로그아웃</a>
				</div>
			</div>
		</div>
	</div>
	
<style>
#dot{
   list-style:none;
   padding-left:5px;
   }
</style>   
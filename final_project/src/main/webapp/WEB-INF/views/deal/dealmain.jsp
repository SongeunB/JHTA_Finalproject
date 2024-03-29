<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="/WEB-INF/views/header.jsp"%>
<%@ include file="/WEB-INF/views/top.jsp"%>
<div id="content-wrapper" class="d-flex flex-column">

	<!-- Main Content -->
	<div id="content">

		<div class="container-fluid">
			<div
				class="d-sm-flex align-items-center justify-content-between mb-4">
				<h1 class="h3 mb-0 text-gray-800">장터목록 목록</h1>
				<form action="${cp }/deal/deallist" method="get"
					class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
					<div class="input-group">
						<input type="hidden" name="${_csrf.parameterName }"
							value="${_csrf.token }"> <input type="text"
							class="form-control bg-white border-secondary small"
							placeholder="상품 검색" aria-label="Search"
							aria-describedby="basic-addon2" name="word">
						<div class="input-group-append">
							<button class="btn btn-secondary" type="submit">
								<i class="fas fa-search fa-sm"></i>
							</button>
						</div>
					</div>
				</form>
			</div>
			<div class="row">
				<!-- 상품 -->
				<c:forEach var="vo" items="${list}" varStatus="status">
					<div class="col-lg-4 mb-4">
						<div class="card shadow mb-4" style="">
							<div class="card-header py-3">
								<a
									href="${pageContext.request.contextPath }/deal/dealdetail?t_num=${vo.t_num}">
									<span>${vo.t_title }</span>
								</a>
							</div>
							<div class="card-body">
								<a
									href="${pageContext.request.contextPath }/deal/dealdetail?t_num=${vo.t_num}">
									<img
									src="${pageContext.request.contextPath }/resources/goodsimg/${imglist.get(status.index).gi_filename}"
									class="img-rounded" width="100%" height="450px">
								</a>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>

			<!-- 검색 -->
			<div>
				<c:forEach var="i" begin="${pu.startPageNum }"
					end="${pu.endPageNum }">
					<c:choose>
						<c:when test="${i==pageNum }">
							<a href="${cp}/deal/deallist?pageNum=${i}&word=${word}"> <span
								style='color: blue'>${i }</span></a>
						</c:when>
						<c:otherwise>
							<a href="${cp}/deal/deallist?pageNum=${i}&word=${word}"> <span
								style='color: gray'>${i }</span></a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</div>


		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/footer.jsp"%>

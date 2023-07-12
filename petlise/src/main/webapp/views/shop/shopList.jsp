<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv='X-UA-Compatible' content='IE=edge'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel="stylesheet" href="css/style.css" />
<link rel="stylesheet" href="css/shop/shopList.css" />
<link rel="stylesheet" href="css/shop/pagination_shop.css" />
<link rel="icon" href="/images/favicon.ico" />
<link rel="apple-touch-icon" href="/images/favicon.ico" />
<title>Pet LiSe</title>
<script src="/js/jquery-3.6.4.min.js"></script>
<script>
	$(document).ready(function() {
		//vs추가추가추가
	});
</script>
</head>
<body>
	<div id='layout'>
		<div id="titlediv">
			<div id="shopTitle">
				<div></div>
				<span style="font : var(--heading24);">라이스샵</span>
				<span style="font : var(--highlight14);">LiSe Shop</span>
			</div>
			
			<!--강아지 카테고리-->
			<div class="petTitle">
				<div class="title">
					<img src="/images/shop/shoplist/category_dog.svg" />
					<span>강아지</span>
				</div>
				<div class="category">
					<!--강아지 상품 카테고리-->
					<!-- 사료 -->
					<div class="product" id="D01">
						<img src="/images/shop/shoplist/food_dog.svg" alt="사료_강아지" />
						<p>사료</p>
					</div>
					<!-- 간식 -->
					<div class="product" id="D02">
						<img src="/images/shop/shoplist/snack_dog.svg" alt="간식_강아지" />
						<p>간식</p>
					</div>
					<!-- 영양제 -->
					<div class="product" id="D03">
						<img src="/images/shop/shoplist/tonic.svg" alt="영양제" />
						<p>영양제</p>
					</div>
					<!-- 장난감 -->
					<div class="product" id="D04">
						<img src="/images/shop/shoplist/toy_dog.svg" alt="장난감_강아지" />
						<p>장난감</p>
					</div>
				</div>
			</div>
			<!--고양이 카테고리-->
			<div class="petTitle">
				<div class="title">
					<img src="/images/shop/shoplist/category_cat.svg" />
					<span>고양이</span>
				</div>
				<div class="category">
					<!--고양이 상품 카테고리-->
					<!-- 사료 -->
					<div class="product" id="C01">
						<img src="/images/shop/shoplist/food_cat.svg" alt="사료_고양이" />
						<p>사료</p>
					</div>
					<!-- 간식 -->
					<div class="product" id="C02">
						<img src="/images/shop/shoplist/snack_cat.svg" alt="간식_고양이" />
						<p>간식</p>
					</div>
					<!-- 영양제 -->
					<div class="product" id="C03">
						<img src="/images/shop/shoplist/tonic.svg" alt="영양제" />
						<p>영양제</p>
					</div>
					<!-- 장난감 -->
					<div class="product" id="C04">
						<img src="/images/shop/shoplist/toy_cat.svg" alt="장난감_고양이" />
						<p>장난감</p>
					</div>
				</div>
			</div>
		</div>

		<div id="filterhead">
			<div id = "filterbtns">
				<button id="filterbtn_pop" class="filter_active">인기순</button>
				<button id="filterbtn_new">신상품순</button>
				<button id="filterbtn_high">고가순</button>
				<button id="filterbtn_low">저가순</button>
			</div>
			<div id="filtertail">
			<div style="margin-right: 10px">
				<input type="checkbox" id="issoldout" <c:if test="${param.searchType3 eq '판매중'}"> checked </c:if> />
				<label for="issoldout"><span></span>품절상품제외</label>
			</div><!-- checkboxdiv -->
			<div id="searchdiv">
				<c:choose>
					<c:when test="${param.keyword == '' || param.keyword eq null}">
						<input type="text" id="keyword" placeholder="상품명 검색" />
					</c:when>
					<c:otherwise>
						<input type="text" id="keyword" value="${param.keyword}" />
					</c:otherwise>
				</c:choose>
				<button id="searchbtn">
					<img src="/images/shop/shopList/search_main.svg">
				</button>
			</div><!-- searchdiv -->
			
			</div>
		</div>

		<div id="product_container">
			<c:forEach var="product" items="${response.list}">
				<div class="products">
					<div class="product_img"
						style="background-image: url(${product.image_main});">
						<div class="product_img_cover">
							<button>
								<img src="/images/shop/shoplist/cart_yellow.svg" alt="cart" />
							</button>
						</div>
					</div>
					<div id="product_info">
						<span> ${product.product_name} </span> <span> <img
							id="coinimg" src="/images/shop/shoplist/coin2.svg" alt="coin" />
							<fmt:formatNumber value="${product.price}" pattern="#,###" />
						</span>
					</div>
				</div>
			</c:forEach>
		</div>
		<!-- 상품목록 -->

		<div id="pagination">
			<c:if test="${fn:length(response.list) != 0}">
				<div class="pagefirst"
					<c:if test="${!response.pagination.existPrevPage}"> style="visibility: hidden;" </c:if>>
					<div class="prevArrow"></div>
					<div class="prevArrow" style="margin-left: -3px"></div>
				</div>
				<div class="prev" id="${response.pagination.startPage-1}"
					<c:if test="${!response.pagination.existPrevPage}"> style="visibility: hidden;" </c:if>>
					<div class="prevArrow"></div>
				</div>

				<c:choose>
					<c:when test="${param.page eq null}">
						<c:forEach begin="1" end="${response.pagination.endPage}"
							varStatus="vs">
							<c:if test="${vs.index == 1}">
								<div class="pageNumber active">${vs.index}</div>
							</c:if>
							<c:if test="${vs.index != 1}">
								<div class="pageNumber">${vs.index}</div>
							</c:if>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<c:forEach begin="${response.pagination.startPage}"
							end="${response.pagination.endPage}" varStatus="vs">
							<c:if test="${vs.index == param.page}">
								<div class="pageNumber active">${vs.index}</div>
							</c:if>
							<c:if test="${vs.index != param.page}">
								<div class="pageNumber">${vs.index}</div>
							</c:if>
						</c:forEach>
					</c:otherwise>
				</c:choose>

				<div class="next" id="${response.pagination.startPage+10}"
					<c:if test="${!response.pagination.existNextPage}"> style="visibility: hidden;" </c:if>>
					<div class="nextArrow"></div>
				</div>
				<div class="pagelast" id="${response.pagination.totalPageCount}"
					<c:if test="${!response.pagination.existNextPage}"> style="visibility: hidden;" </c:if>>
					<div class="nextArrow"></div>
					<div class="nextArrow" style="margin-left: -6px"></div>
				</div>
			</c:if>
		</div><!-- pagination -->
	</div><!-- layout -->
	
	<script src="/js/shop/shopList.js"></script>
</body>
</html>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BYEZ</title>
    <link rel="stylesheet" href="/css/nav.css">
    <link rel="stylesheet" href="/css/review_list.css?after">
    <link rel="stylesheet" href="/css/footer.css?after">
    <link rel="stylesheet" href="/css/aside.css?after">
    <link rel="stylesheet" href="/css/quick.css">
    <!-- 추가합니다 -->
    <!-- <link rel="stylesheet" href="css/tab_template.css"> -->
    <!--  -->
    <script src="https://kit.fontawesome.com/f0e73cfa04.js" crossorigin="anonymous"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
</head>

<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp"/>
<section>
    <div class="wrapper">
        <div class="title">
            <p>
                <a href="main.html"><span>home</span></a>
                <span>></span>
                <a href="mypage.html"><span>마이페이지</span></a>
                <span>></span>
                <a href="/review/list"><span>리뷰</span></a>

            </p>
            <p>나의 게시물 관리</p>
        </div>
        <jsp:include page="/WEB-INF/views/include/aside.jsp"/>

        <!-- 탭 메뉴 -->
        <ul class="tab_menu">
            <li><a href="#tab1-1">작성 가능한 리뷰</a></li>
            <li><a href="#tab1-2">작성 완료한 리뷰</a></li>
        </ul>
        <!-- 탭 콘텐츠 -->
        <div class="content">
            <!--작성 "가능한" 리뷰-->
            <div id="tab1-1" class="tab_content">
                <c:forEach var="offList" items="${reviewOffList}">
                    <!-- 1st -->
                    <div class="container">
                        <!-- 이미지 -->
                        <div class="box box1">
                            <img src="/img/1.jpeg" alt="Product Image">
                        </div>
                        <!-- 상품상세 -->
                        <div class="box box2">
                            <h4>${offList.item_name}</h4>
                            <h6>${offList.opt1},${offList.opt2}</h6>
                            <h6>${offList.reg_date}</h6>
                        </div>
                        <!-- 리뷰버튼 -->
                        <div class="box box3">
                            <a href="/review/write?ord_num=${offList.ord_num}&item_num=${offList.item_num}">
                                <button>작성하기</button>
                            </a>
                        </div>
                    </div>
                </c:forEach>
            </div>

            <!-- 작성 "완료한" 리뷰 -->
            <div id="tab1-2" class="tab_content">
                <div class="content">
                    <ul>
                        <c:forEach var="onList" items="${reviewOnList}">
                            <li class="reviewDone">
                                <div class="first">
                                    <div class="first_image"><img src="/img/1.jpeg"></div>
                                    <div class="first_info">
                                        <p>상품명 : ${onList.item_name}</p>
                                        <p>별점 : ${onList.score}</p>
                                        <p>한줄평 : ${onList.title}</p>
                                        <p>${onList.content}</p>
                                    </div>
                                </div>
                                <div class="second">
                                    <p>${onList.reg_date}</p>
                                    <a href="/review/delete?review_num=${onList.review_num}" onclick="return confirm('삭제하시겠습니까?')">
                                        <button>삭제하기</button>
                                    </a>
                                    <a href="/review/modify?review_num=${onList.review_num}&ord_num=${onList.ord_num}&item_num=${onList.item_num}" onclick="return confirm('수정하시겠습니까?')">
                                        <button>수정하기</button>
                                    </a>
                                </div>
                            </li>
                        </c:forEach>
                        <!--  -->
                        <li>
                            <div class="first">
                                <div class="first_image"><img src="/img/1.jpeg"></div>
                                <div class="first_info">
                                    <p>상품명 : 옵션명</p>
                                    <p>별점</p>
                                    <p>한줄평</p>
                                    <p>이것은천자가될것이야이것은천자가될것이야이것은천자가될것이야이것은천자가될것이야이것은천자가될것이야이것은천자가될것이야이것은천자가될것이야이것은천자가될것이야이것은천자가될것이야이것은천자가될것이야이것은천자가될것이야이것은천자가될것이야이것은천자가될것이야이것은천자가될것이야이것은천자가될것이야이것은천자가될것이야이것은천자가될것이야이것은천자가될것이야이것은천자가될것이야이것은천자가될것이야이것은천자가될것이야이것은천자가될것이야이것은천자가될것이야이것은천자가될것이야이것은천자가될것이야이것은천자가될것이야이것은천자가될것이야이것은천자가될것이야이것은천자가될것이야이것은천자가될것이야이것은천자가될것이야이것은천자가될것이야이것은천자가될것이야이것은천자가될것이야이것은천자가될것이야이것은천자가될것이야이것은천자가될것이야이것은천자가될것이야이것은천자가될것이야이것은천자가될것이야이것은천자가될것이야이것은천자가될것이야이것은천자가될것이야이것은천자가될것이야이것은천자가될것이야이것은천자가될것이야이것은천자가될것이야이것은천자가될것이야이것은천자가될것이야이것은천자가될것이야이것은천자가될것이야이것은천자가될것이야이것은천자가될것이야이것은천자가될것이야이것은천자가될것이야이것은천자가될것이야이것은천자가될것이야이것은천자가될것이야이것은천자가될것이야이것은천자가될것이야이것은천자가될것이야이것은천자가될것이야이것은천자가될것이야이것은천자가될것이야이것은천자가될것이야이것은천자가될것이야이것은천자가될것이야이것은천자가될것이야이것은천자가될것이야이것은천자가될것이야이것은천자가될것이야이것은천자가될것이야이것은천자가될것이야이것은천자가될것이야이것은천자가될것이야이것은천자가될것이야이것은천자가될것이야이것은천자가될것이야이것은천자가될것이야이것은천자가될것이야이것은천자가될것이야이것은천자가될것이야이것은천자가될것이야이것은천자가될것이야이것은천자가될것이야이것은천자가될것이야이것은천자가될것이야이것은천자가될것이야이것은천자가될것이야이것은천자가될것이야이것은천자가될것이야이것은천자가될것이야이것은천자가될것이야이것은천자가될것이야이것은천자가될것이야이것은천자가될것이야이것은천자가될것이야이것은천자가될것이야이것은천자가될것이야이것은천자가될것이야이것은천자가될것이야이것은천자가될것이야이것은천자가될것이야이것은천자가될것이야이것은천자가될것이야이것은천자가될것이야이것은천자가될것이야이것은천자가될것이야이것은천자가될것이야이것은천자가될것이야</p>
                                </div>
                            </div>
                            <div class="second">
                                <p>2024. 04. 17</p>
                                <button>삭제하기</button>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <script src="/js/jquery-3.6.4.min.js"></script>
        <script src="/js/tab.js"></script>
        <script src="/js/aside.js"></script>
    </div></section></body>
</div>
</div>
</section>
<footer>
    <div class="wrapper">
        <p>© 2024 spao-copymachine. All rights not reserved.</p>
    </div>
</footer>
<div class="quick">
    <a href="#none" onclick="jQuery('html,body').animate({scrollTop:0},'slow')">
        <img src="/img/quick_up.png" alt="">
    </a>
    <a href="#none" onclick="jQuery('html,body').animate({scrollTop:$(document).height()},'slow');">
        <img src="/img/quick_down.png" alt="">
    </a>
</div>
<script src="/js/jquery-3.6.4.min.js"></script>
<script src="/js/nav.js"></script>
</body>

</html>
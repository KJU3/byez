<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BYEZ</title>
    <link rel="stylesheet" href="/css/nav.css">
    <link rel="stylesheet" href="/css/orderHist.css">
    <link rel="stylesheet" href="/css/footer.css?after?after">
    <link rel="stylesheet" href="/css/quick.css">
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
                <a href="orderHist.html"><span>주문 상세 내역</span></a>
            </p>
            <p>주문 상세 내역</p>
        </div>
        <jsp:include page="/WEB-INF/views/include/aside.jsp"/>
        <div class="content">
            <p>주문번호 <span>${orderResultInfoDto.ord_num}</span></p>
            <p>주문일자 <span>${orderResultInfoDto.ord_date}</span></p>
            <table class="product">
                <tr>
                    <th scope="col">상품정보</th>
                    <th scope="col">수량</th>
                    <th scope="col">주문금액</th>
                    <th scope="col">배송비</th>
                    <th scope="col">배송정보</th>
                    <th scope="col">주문상태</th>
                </tr>
                <c:forEach var="orderedItem" items="${orderResultInfoDtoList}">
                    <tr>
                        <td class="productTitle">
                            <p>${orderedItem.item_name}</p>
                            <p>
                                [사이즈 : <span>${orderedItem.opt1}</span> / 컬러 : <span>${orderedItem.opt2}</span>]
                            </p>
                        </td>
                        <td>${orderedItem.item_qty}</td>
                        <td class="price"><fmt:formatNumber value="${orderedItem.item_price}" pattern="#,###"/></td>
                        <td>0</td>
                        <td class="delivery">
                            <p>${orderResultInfoDto.dlv_corp}</p>
                            <p>${orderResultInfoDto.waybill_num}</p>
                        </td>
                        <td class="orderState">
                            <p>${orderedItem.ord_state}</p>
                            <button>주문 취소</button>
                            <button>배송지 변경</button>
                        </td>
                    </tr>
                </c:forEach>
            </table>
            <p class="titleBold">배송지 정보</p>
            <table class="dlvInfo">
                <tr>
                    <td class="dlvTitle">이름</td>
                    <td>${orderResultInfoDto.rcpr}</td>
                </tr>
                <tr>
                    <td class="dlvTitle">연락처</td>
                    <td>${orderResultInfoDto.rcpr_mobile}</td>
                </tr>
                <tr>
                    <td class="dlvTitle">배송지 주소</td>
                    <td>${orderResultInfoDto.main_addr} ${orderResultInfoDto.detail_addr}</td>
                </tr>
                <tr>
                    <td class="dlvTitle">배송 메시지</td>
                    <td>${orderResultInfoDto.msg}</td>
                </tr>
            </table>
            <p class="titleBold">최종 결제 정보</p>
            <table class="dlvInfo">
                <tr>
                    <td class="dlvTitle">상품 합계</td>
                    <td><span><fmt:formatNumber value="${orderResultInfoDto.total_price}" pattern="#,###"/></span>원</td>
                </tr>
                <tr>
                    <td class="dlvTitle">배송비 합계</td>
                    <td><span><fmt:formatNumber value="${orderResultInfoDto.total_dlv_price}" pattern="#,###"/></span>원</td>
                </tr>
                <tr>
                    <td class="dlvTitle">할인 합계</td>
                    <td class="blue"><span><fmt:formatNumber value="${orderResultInfoDto.total_disc_price}" pattern="#,###"/></span>원</td>
                </tr>
                <tr>
                    <td class="dlvTitle">최종 결제 금액</td>
                    <td class="dlvTitleSize"><fmt:formatNumber value="${orderResultInfoDto.total_pay_price}" pattern="#,###"/>원</td>
                </tr>
                <tr>
                    <td class="dlvTitle">결제 수단</td>
                    <td>${orderResultInfoDto.mtd_code}</td>
                </tr>
            </table>
        </div>
    </div>
</section>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
<jsp:include page="/WEB-INF/views/include/quick.jsp"/>
<script src="/js/jquery-3.6.4.min.js"></script>
<script src="/js/nav.js"></script>
</body>
</html>
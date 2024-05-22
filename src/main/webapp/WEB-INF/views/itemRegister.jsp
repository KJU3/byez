<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="/css/nav.css">
  <link rel="stylesheet" href="/css/itemRegister.css">
  <link rel="stylesheet" href="/css/tab.css">
  <link rel="stylesheet" href="/css/footer.css">
  <link rel="stylesheet" href="/css/quick.css">
  <script src="https://kit.fontawesome.com/f0e73cfa04.js" crossorigin="anonymous"></script>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
</head>
<body>
<div class="wrapper">
  <p>상품 등록</p>
  <table class="itemRegister">
    <form method="post" action="/admin/add">
      <tr>
        <td>num</td>
        <td><input type="text" placeholder="num"></td>
      </tr>
      <tr>
        <td>name</td>
        <td><input type="text" placeholder="name"></td>
      </tr>
      <tr>
        <td>price</td>
        <td><input type="text" placeholder="price"></td>
      </tr>
      <tr>
        <td>disc_price</td>
        <td><input type="text" placeholder="disc_price"></td>
      </tr>
      <tr>
        <td>main_img</td>
        <td><input type="text" placeholder="main_img"></td>
      </tr>
      <tr>
        <td>item_type</td>
        <td><input type="text" placeholder="item_type"></td>
      </tr>
      <tr>
        <td>review_cnt</td>
        <td><input type="text" placeholder="review_cnt"></td>
      </tr>
      <tr>
        <td>like_cnt</td>
        <td><input type="text" placeholder="like_cnt"></td>
      </tr>
      <tr>

        <td>review_rate</td>
        <td><input type="text" placeholder="review_rate"></td>
      </tr>
      <tr>
        <td>cust_type</td>
        <td><input type="text" placeholder="cust_type"></td>
      </tr>
      <tr>
        <td>disc_rate</td>
        <td><input type="text" placeholder="disc_rate"></td>
      </tr>
      <tr>
        <td>period</td>
        <td><input type="text" placeholder="period"></td>
      </tr>
      <tr>
        <td>size</td>
        <td><input type="text" placeholder="size"></td>
      </tr>
      <tr>
        <td>col</td>
        <td><input type="text" placeholder="col"></td>
      </tr>
      <tr>
        <td>remark</td>
        <td><input type="text" placeholder="remark"></td>
      </tr>
      <tr>
        <td>detail_name</td>
        <td><input type="text" placeholder="detail_name"></td>
      </tr>
      <tr>
        <td>comt</td>
        <td><input type="text" placeholder="comt"></td>
      </tr>
      <tr>
        <td>detail_img</td>
        <td><input type="text" placeholder="detail_img"></td>
      </tr>
      <tr>
        <td>rel_date</td>
        <td><input type="text" placeholder="rel_date"></td>
      </tr>
      <tr>
        <td>gr_date</td>
        <td><input type="text" placeholder="gr_date"></td>
      </tr>
      <tr>
        <td>mfg_corp</td>
        <td><input type="text" placeholder="mfg_corp"></td>
      </tr>
      <tr>
        <td>mfg_name</td>
        <td><input type="text" placeholder="mfg_name"></td>
      </tr>
      <tr>
        <td>mfg_date</td>
        <td><input type="text" placeholder="mfg_date"></td>
      </tr>
      <tr>
        <td>view_cnt</td>
        <td><input type="text" placeholder="view_cnt"></td>
      </tr>
      <tr>
        <td>model</td>
        <td><input type="text" placeholder="model"></td>
      </tr>
      <tr>
        <td>stock_qty</td>
        <td><input type="text" placeholder="stock_qty"></td>
      </tr>
      <tr>
        <td>origin</td>
        <td><input type="text" placeholder="origin"></td>
      </tr>
      <tr>
        <td>state_code</td>
        <td><input type="text" placeholder="state_code"></td>
      </tr>
      <tr>
        <td>matr</td>
        <td><input type="text" placeholder="matr"></td>
      </tr>
      <tr>
        <td>code</td>
        <td><input type="text" placeholder="code"></td>
      </tr>
      <tr>
        <td>sales_qty</td>
        <td><input type="text" placeholder="sales_qty"></td>
      </tr>
      <tr>
        <td>caut</td>
        <td><input type="text" placeholder="caut"></td>
      </tr>
      <tr>
        <td>period</td>
        <td><input type="text" placeholder="caut"></td>
      </tr>
    </form>
  </table>

  <button class="add-button">
    등록
  </button>
</div>
<script src="/js/jquery-3.6.4.min.js"></script>
<script src="/js/nav.js?after"></script>
<script src="/js/tab.js"></script>
<script>
  $(document).ready(function () {

    // 등록 상품 정보 보내기
      // url : admin/add, method : post
      // 등록 상품 정보 조회
      // 필드 값 검증
      // 폼 보내기
    $('.add-button').on('click', function (event) {
      event.preventDefault(); // 폼의 기본 제출 동작을 막음
      alert($('.order-form'));
      $('.order-form').submit();

    })
  })
</script>
</body>
</html>
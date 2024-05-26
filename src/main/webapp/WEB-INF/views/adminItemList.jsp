<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Tables - SB Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
    <link href="/css/styles.css" rel="stylesheet" />
    <link rel="stylesheet" href="/css/table.css">
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">
<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
    <!-- Navbar Brand-->
    <a class="navbar-brand ps-3" href="index.html">BYEZ</a>
    <!-- Sidebar Toggle-->
    <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
    <!-- Navbar Search-->
    <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
        <div class="input-group">
            <input class="form-control" type="text" placeholder="Search for..." aria-label="Search for..." aria-describedby="btnNavbarSearch" />
            <button class="btn btn-primary" id="btnNavbarSearch" type="button"><i class="fas fa-search"></i></button>
        </div>
    </form>
    <!-- Navbar-->
    <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                <li><a class="dropdown-item" href="#!">Settings</a></li>
                <li><a class="dropdown-item" href="#!">Activity Log</a></li>
                <li><hr class="dropdown-divider" /></li>
                <li><a class="dropdown-item" href="#!">Logout</a></li>
            </ul>
        </li>
    </ul>
</nav>
<div id="layoutSidenav">
    <jsp:include page="/WEB-INF/views/include/adminNav.jsp"/>
    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid px-4">
                <h1 class="mt-4">상품 <span>목록</span></h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
                    <li class="breadcrumb-item active">상품 목록</li>
                </ol>
                <!-- <div class="card mb-4">
                    <div class="card-body">
                        DataTables is a third party plugin that is used to generate the demo table below. For more information about DataTables, please visit the
                        <a target="_blank" href="https://datatables.net/">official DataTables documentation</a>
                        .
                    </div>
                </div> -->
                <div class="card mb-4">
                    <div class="card-header">
                        <i class="fas fa-table me-1"></i>
                        상품 테이블
                    </div>
                    <div class="card-body">
                        <table id="datatablesSimple">
                            <thead>
                            <tr>
                                <th>
                                    삭제
                                    <!-- <input type="checkbox"> -->
                                </th>
                                <th>상품번호</th>
                                <th>상품명</th>
                                <th>상품유형</th>
                                <th>고객유형</th>
                                <th>판매상태</th>
                                <th>원가</th>
                                <th>할인가</th>
                                <th>할인율</th>
                                <th>제조사</th>
                                <th>상품출시일</th>
                                <th>최초등록일</th>
                                <th>최근수정일</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td><input type="checkbox"></td>
                                <td>
                                    111
                                </td>
                                <td>
                                    <a href="itemForm">
                                        티셔츠
                                    </a>
                                </td>
                                <td>
                                    010101
                                </td>
                                <td>
                                    남성용
                                </td>
                                <td>
                                    판매중
                                </td>
                                <td>
                                    10000
                                </td>
                                <td>
                                    8000
                                </td>
                                <td>
                                    0.2
                                </td>
                                <td>(주)111컴퍼니</td>
                                <td>2024.05.24</td>
                                <td>2024.05.24</td>
                                <td>2024.05.24</td>
                            </tr>
                            <tr>
                                <td><input type="checkbox"></td>
                                <td>
                                    112
                                </td>
                                <td>
                                    <a href="itemForm">
                                        티셔츠2
                                    </a>
                                </td>
                                <td>
                                    020101
                                </td>
                                <td>
                                    여성용
                                </td>
                                <td>
                                    품절
                                </td>
                                <td>
                                    10000
                                </td>
                                <td>
                                    7000
                                </td>
                                <td>
                                    0.3
                                </td>
                                <td>(주)112컴퍼니</td>
                                <td>2024.05.25</td>
                                <td>2024.05.22</td>
                                <td>2024.05.27</td>
                            </tr>
                            <tr>
                                <td><input type="checkbox"></td>
                                <td>
                                    113
                                </td>
                                <td>
                                    <a href="itemForm">
                                        셔츠
                                    </a>
                                </td>
                                <td>
                                    020101
                                </td>
                                <td>
                                    여성용
                                </td>
                                <td>
                                    판매중
                                </td>
                                <td>
                                    20000
                                </td>
                                <td>
                                    15000
                                </td>
                                <td>
                                    0.25
                                </td>
                                <td>(주)11컴퍼니</td>
                                <td>2024.04.25</td>
                                <td>2024.06.22</td>
                                <td>2023.05.27</td>
                            </tr>
                            </tbody>
                        </table>
                        <button class="register">선택 삭제</button>
                        <button class="register">전체 삭제</button>
                        <button class="register" onclick="location.href='/itemRegister' ">상품 등록</button>
                    </div>
                </div>
            </div>
        </main>
        <footer class="py-4 bg-light mt-auto">
            <div class="container-fluid px-4">
                <div class="d-flex align-items-center justify-content-between small">
                    <div class="text-muted">Copyright &copy; BYEZ 2024</div>
                    <div>
                        <a href="#">Privacy Policy</a>
                        &middot;
                        <a href="#">Terms &amp; Conditions</a>
                    </div>
                </div>
            </div>
        </footer>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="/js/scripts.js"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
<script src="/js/datatables-simple-demo.js"></script>
</body>
</html>


<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>得点管理システム</title>
    <style>
        /* Reset và style cơ bản */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: "Yu Gothic", "游ゴシック", sans-serif;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        /* Header */
        .header-container {
            background-color: #d9e9f8;
            height: 80px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 20px;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            z-index: 1000;
        }

        .header-title {
            font-size: 24px;
            font-weight: bold;
            color: #333;
        }

        .header-user {
            font-size: 14px;
            color: #333;
        }

        .header-user a {
            color: #3333cc;
            text-decoration: none;
            margin-left: 10px;
        }

        .header-user a:hover {
            text-decoration: underline;
        }

        /* Container chính */
        .container {
            display: flex;
            flex: 1;
            margin-top: 80px; /* Đảm bảo không bị che bởi header */
        }

        /* Side menu */
        .side-menu-container {
            width: 150px; /* Giảm từ 180px xuống 150px */
            background-color: rgba(0, 0, 0, 0.05);
            padding: 15px;
            position: fixed;
            top: 80px;
            bottom: 0;
            overflow-y: auto;
        }

        .side-menu ul {
            list-style: none;
            padding-left: 0;
        }

        .side-menu ul li {
            margin-bottom: 15px;
        }

        .side-menu ul li a {
            color: #0040a0;
            text-decoration: none;
            font-size: 14px;
        }

        .side-menu ul li a:hover {
            text-decoration: underline;
        }

        .side-menu ul.menu-main li a {
            font-weight: bold;
            font-size: 16px;
            color: #a00000;
        }

        .side-menu ul.menu-sub li a {
            font-weight: normal;
            color: #000080;
            font-size: 13px;
            padding-left: 10px;
        }

        /* Nội dung chính */
        .main-content {
            margin-left: 170px; /* Điều chỉnh thành 170px để phù hợp với width mới */
            padding: 20px;
            width: calc(100% - 170px); /* Điều chỉnh width để tăng không gian */
            min-width: 0;
            min-width: 800px;
        }
        .header-title a {
    color: #333;
    text-decoration: none;
    font-size: 2.5em;
}

.header-title a:hover {
    color: #0056b3;
    text-decoration: underline;
}
    </style>
</head>
<body>
    <!-- Header -->
    <div class="header-container">
        <a href="${pageContext.request.contextPath}/menu/menuaction">得点管理システム</a>
        <div class="header-user">
            <c:if test="${not empty user}">
                ${user.name}様
                <a href="/TeamE/logout/logoutaction">ログアウト</a>
            </c:if>
        </div>
    </div>

    <!-- Container chính -->
    <div class="container">
        <!-- Side menu -->
        <div class="side-menu-container">
            <div class="side-menu">
                <ul class="menu-main">
                    <li><a href="#">メニュー</a></li>
                    <li><a href="#">学生管理</a></li>
                    <li>
                        <a href="#">成績管理</a>
                        <ul class="menu-sub">
                            <li><a href="#">成績登録</a></li>
                            <li><a href="${pageContext.request.contextPath}/testmanagement/list">成績参照</a></li>
                        </ul>
                    </li>
                    <li><a href="#">科目管理</a></li>
                </ul>
            </div>
        </div>

        <!-- Nội dung chính (được chèn từ các JSP khác) -->
        <div class="main-content">
            <jsp:include page="${param.content}" />
        </div>
    </div>
</body>
</html>
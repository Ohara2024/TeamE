<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>登録完了 - 得点管理システム</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
<div class="header">
    <h1>得点管理システム</h1>
</div>

<div class="container">
    <div class="sidebar">
        <h2>メニュー</h2>
        <ul>
            <li><a href="#">メニュー</a></li>
            <li><a href="#">学生管理</a></li>
            <li><a href="#">成績管理</a></li>
            <li><a href="#">　成績登録</a></li>
            <li><a href="#">　成績参照</a></li>
            <li><a href="#">科目管理</a></li>
        </ul>
    </div>

    <div class="main">
        <h2>教員登録完了</h2>

        <div class="form-box">
            <div class="result">
                <c:if test="${not empty message}">
                    <p>${message}</p>
                    <p>ID: ${teacher.id}</p>
                    <p>名前: ${teacher.name}</p>
                    <p>学校ID: ${teacher.school.cd}</p>
                </c:if>
            </div>

            <div class="form-item">
                <a href="TestRegistAction" class="button-link">戻る</a>
            </div>
        </div>
    </div>
</div>
</body>
</html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>学生情報登録 - 得点管理システム</title>
    <style>



    </style>
</head>
<body>
<header>得点管理システム</header>
<div class="container">
    <nav>
        <ul>
            <li><a href="#">メニュー</a></li>
            <li><a href="#">学生管理</a></li>
            <li><a href="#">成績管理</a></li>
            <li><a href="#">　成績登録</a></li>
            <li><a href="#">　成績参照</a></li>
            <li><a href="#">科目管理</a></li>
        </ul>
    </nav>

    <main>
        <h2>学生情報登録</h2>

        <div class="form-box">
            <div class="result">
                <c:if test="${not empty message}">
                    <p>登録が完了しました</p>
                </c:if>
            </div>

            <div class="form-item">
                 <a href="<%= request.getContextPath() %>/subjectmanager/TestRegistAction" class="button-link">戻る</a>
                 <a href="<%= request.getContextPath() %>/subjectmanager/TestListAction" class="button-link">成績参照</a>
            </div>
        </div>
    </main>
</div>
</body>
</html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>得点管理システム</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
    <!-- ヘッダー -->
    <div class="header">
        <h1>得点管理システム</h1>
    </div>

    <!-- メイン画面 -->
    <div class="container">
        <!-- サイドバー -->
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

        <!-- メイン -->
        <div class="main">
            <h2>成績管理</h2>

            <!-- 角丸枠でフォームを囲む -->
            <div class="form-box">
                <form action="TestRegistAction" method="post" class="form-row">
                    <div class="form-item">
                        <label for="admissionYear">入学年度</label>
                        <select id="admissionYear" name="admissionYear">

                        </select>
                    </div>

                    <div class="form-item">
                        <label for="className">クラス</label>
                        <select id="className" name="className">
                        </select>
                    </div>

                    <div class="form-item">
                        <label for="subject">科目</label>
                        <select id="subject" name="subject">
                        </select>
                    </div>

                    <div class="form-item">
                        <label for="examCount">回数</label>
                        <select id="examCount" name="examCount">
                        </select>
                    </div>

                    <div class="form-item">
                        <label>&nbsp;</label>
                        <button type="submit">検索</button>
                    </div>
                </form>

                <!-- 結果表示領域 -->
                <div class="result">
                    <c:if test="${not empty message}">
                        ${message}
                    </c:if>
                </div>
            </div>
        </div>
    </div>
</body>
</html>

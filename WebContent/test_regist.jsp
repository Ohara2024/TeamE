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
                <li><a href="#">学生一覧</a></li>
                <li><a href="#">学生追加</a></li>
                <li><a href="#">学生更新</a></li>
                <li><a href="#">学生削除</a></li>
            </ul>
        </div>

        <!-- メイン -->
        <div class="main">
            <h2>得点登録</h2>

            <!-- 角丸枠でフォームを囲む -->
            <div class="form-box">
                <form action="TestRegistAction" method="post" class="form-row">
                    <div class="form-item">
                        <label for="admissionYear">入学年度</label>
                        <select id="admissionYear" name="admissionYear">
                            <option value="2023">2023</option>
                            <option value="2022">2022</option>
                            <option value="2021">2021</option>
                        </select>
                    </div>

                    <div class="form-item">
                        <label for="className">クラス</label>
                        <select id="className" name="className">
                            <option value="A">A</option>
                            <option value="B">B</option>
                        </select>
                    </div>

                    <div class="form-item">
                        <label for="subject">科目</label>
                        <select id="subject" name="subject">
                            <option value="数学">数学</option>
                            <option value="英語">英語</option>
                        </select>
                    </div>

                    <div class="form-item">
                        <label for="examCount">回数</label>
                        <select id="examCount" name="examCount">
                            <option value="1">第1回</option>
                            <option value="2">第2回</option>
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

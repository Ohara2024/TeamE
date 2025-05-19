<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>成績管理</title>
    <style>
        body {
            font-family: sans-serif;
            margin: 0;
            padding: 0;
            height: 100vh;
            display: flex;
            flex-direction: column;
        }
        header {
            background-color: #004080;
            color: white;
            padding: 1em;
            font-size: 1.5em;
            font-weight: bold;
            text-align: center;
        }
        .container {
            flex: 1;
            display: flex;
            height: calc(100vh - 60px);
        }
        nav {
            width: 200px;
            background-color: #f0f0f0;
            border-right: 1px solid #ccc;
            padding: 1em;
            box-sizing: border-box;
        }
        nav ul {
            list-style: none;
            padding: 0;
        }
        nav li {
            margin-bottom: 1em;
        }
        nav a {
            color: #004080;
            text-decoration: none;
            font-weight: bold;
        }
        nav a:hover {
            text-decoration: underline;
        }
        main {
            flex: 1;
            padding: 2em;
            box-sizing: border-box;
            background-color: #fff;
        }
        h2 {
            color: #004080;
            margin-top: 0;
        }
        .form-box {
            border: 1px solid #ccc;
            border-radius: 8px;
            padding: 1.5em;
            background-color: #f9f9f9;
        }
        .form-row {
            display: flex;
            flex-wrap: wrap;
            gap: 1.5em;
        }
        .form-item {
            display: flex;
            flex-direction: column;
            min-width: 200px;
        }
        .form-item label {
            margin-bottom: 0.5em;
            font-weight: bold;
        }
        .form-item select, .form-item button {
            padding: 0.5em;
            border-radius: 4px;
            border: 1px solid #ccc;
        }
        button {
            background-color: #004080;
            color: white;
            cursor: pointer;
            font-weight: bold;
        }
        button:hover {
            background-color: #003366;
        }
        .result {
            margin-top: 1.5em;
            color: green;
        }
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
            <h2>成績管理</h2>

            <div class="form-box">
                <form action="TestRegistAction" method="post" class="form-row">
                    <div class="form-item">
                        <label for="admissionYear">入学年度</label>
                        <select id="admissionYear" name="admissionYear">
                            <!-- 選択肢を追加 -->
                        </select>
                    </div>

                    <div class="form-item">
                        <label for="className">クラス</label>
                        <select id="className" name="className">
                            <!-- 選択肢を追加 -->
                        </select>
                    </div>

                    <div class="form-item">
                        <label for="subject">科目</label>
                        <select id="subject" name="subject">
                            <!-- 選択肢を追加 -->
                        </select>
                    </div>

                    <div class="form-item">
                        <label for="examCount">回数</label>
                        <select id="examCount" name="examCount">
                            <!-- 選択肢を追加 -->
                        </select>
                    </div>

                    <div class="form-item">
                        <label>&nbsp;</label>
                        <button type="submit">検索</button>
                    </div>
                </form>

                <div class="result">
                    <c:if test="${not empty message}">
                        ${message}
                    </c:if>
                </div>
            </div>
        </main>
    </div>
</body>
</html>

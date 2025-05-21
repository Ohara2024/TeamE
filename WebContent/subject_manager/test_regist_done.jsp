<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>学生情報登録 - 得点管理システム</title>
    <style>
        body {
            font-family: sans-serif;
            margin: 0;
            padding: 0;
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
            display: flex;
            height: 100vh;
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
            overflow-y: auto;
        }
        h2 {
            color: #004080;
        }

        .result p {
            font-size: 1.1em;
            margin: 0.3em 0;
        }
        .form-item a.button-link {
            display: inline-block;
            padding: 0.5em 1em;
            background-color: #004080;
            color: white;
            text-decoration: none;
            border-radius: 4px;　
            font-weight: bold;
            margin-top: 1em;
        }
        .form-item a.button-link:hover {
            background-color: #003366;
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
        <h2>学生情報登録</h2>

        <div class="form-box">
            <div class="result">
                <c:if test="${not empty message}">
                    <p>登録が完了しました</p>
                </c:if>
            </div>

            <div class="form-item">
                <a href="TestRegistAction" class="button-link">戻る</a>
            </div>
        </div>
    </main>
</div>
</body>
</html>

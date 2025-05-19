<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>科目削除完了</title>
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
        .info {
            margin: 1em 0;
            font-size: 1.1em;
        }
        .buttons {
            margin-top: 2em;
        }
        .buttons a {
            padding: 0.5em 1.5em;
            background-color: #004080;
            color: white;
            border-radius: 4px;
            text-decoration: none;
            font-weight: bold;
        }
        .buttons a:hover {
            background-color: #0066cc;
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
            <h2>科目情報削除</h2>

            <div class="info">
                <p>科目の削除が完了しました。</p>
            </div>


                <a href="subject_list.jsp">科目一覧</a>
            </div>
        </main>
    </div>
</body>
</html>

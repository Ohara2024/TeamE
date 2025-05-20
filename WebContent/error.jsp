<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>エラー - 得点管理システム</title>
    <style>
        body {
            font-family: sans-serif;
            background-color: #f2f2f2; /* 淡いグレー背景 */
            color: #333333; /* 濃いグレー文字 */
            margin: 0;
            padding: 0;
            text-align: center;
        }

        .container {
            margin-top: 150px;
        }

        .error-box {
            display: inline-block;
            background-color: #ffffff; /* 白背景 */
            padding: 30px 40px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            text-align: center;
            max-width: 500px;
            border: 1px solid #cccccc; /* 薄いグレーの枠線 */
        }

        h1 {
            font-size: 1.8em;
            margin-bottom: 20px;
            color: #222222;
        }

        p {
            font-size: 1em;
            color: #555555;
        }

        a {
            display: inline-block;
            margin-top: 20px;
            text-decoration: none;
            color: #007bff; /* ブルーリンク */
            font-weight: bold;
        }

        a:hover {
            text-decoration: underline;
        }

        footer {
            margin-top: 50px;
            font-size: 0.9em;
            color: #555555;
        }
    </style>
</head>
<body>

    <div class="container">
        <div class="error-box">
            <h1>エラーが発生しました</h1>
            <p><%= request.getAttribute("error") != null ? request.getAttribute("error") : "予期しないエラーが発生しました。" %></p>
            <a href="login.jsp">ログイン画面に戻る</a>
        </div>
    </div>

    <footer>
        &copy; 2025 TBC<br>高崎情報ITクリエイター専門学校
    </footer>

</body>
</html>

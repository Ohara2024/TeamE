<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>科目登録完了</title>
    <style>
        body {
            font-family: sans-serif;
            margin: 30px;
        }
        h2 {
            color: #2c3e50;
        }
        .message {
            margin-top: 20px;
            font-size: 16px;
            padding: 15px;
            background-color: #d4edda; /* 薄い緑 */
            color: #155724;             /* 濃い緑の文字 */
            border: 1px solid #c3e6cb;
            border-radius: 5px;
        }
        .links {
            margin-top: 30px;
        }
        .links a {
            display: inline-block;
            margin-right: 20px;
            text-decoration: none;
            color: #337ab7;
        }
    </style>
</head>
<body>

    <!-- 1. 画面タイトル -->
    <h2>科目登録完了</h2>

    <!-- 2. 完了メッセージ（背景付き） -->
    <p class="message">科目の登録が完了しました。</p>

    <!-- 3 & 4. 戻るリンク / 科目一覧リンク -->
    <div class="links">
<p><a href="${pageContext.request.contextPath}/subjectmanagement/create">科目登録画面に戻る</a></p>
<p><a href="${pageContext.request.contextPath}/subjectmanagement/list">科目一覧へ</a></p>
    </div>

</body>
</html>

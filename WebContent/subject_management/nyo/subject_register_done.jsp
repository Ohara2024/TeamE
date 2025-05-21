<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>科目登録完了</title>
    <style>
        body {
            font-family: sans-serif;
            padding: 20px;
        }
        h2 {
            margin-bottom: 20px;
        }
        p {
            font-size: 16px;
            color: green;
        }
        a {
            display: inline-block;
            margin-top: 20px;
            margin-right: 20px;
            text-decoration: none;
            color: blue;
        }
    </style>
</head>
<body>

    <!-- ① 画面タイトル -->
    <h2>科目登録完了</h2>

    <!-- ② 完了メッセージ -->
    <p>科目情報の登録が完了しました。</p>

    <!-- ③ 戻るリンク（登録画面へ） -->
    <a href="SubjectRegisterServlet" name="41">続けて登録する</a>

    <!-- ④ 一覧リンク -->
    <a href="SubjectListServlet" name="40">科目一覧へ戻る</a>

</body>
</html>

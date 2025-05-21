<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>学生情報変更完了</title>
    <style>
        body {
            font-family: sans-serif;
            padding: 20px;
        }
        h2 {
            margin-bottom: 20px;
        }
        p.message {
            background-color: #d4edda;
            color: #155724;
            padding: 12px;
            border-radius: 5px;
            width: fit-content;
            margin-bottom: 20px;
        }
        a {
            text-decoration: none;
            color: #007bff;
            font-weight: bold;
        }
    </style>
</head>
<body>

    <!-- ① 画面タイトル -->
    <h2>学生情報変更</h2>

    <!-- ② 完了メッセージ -->
    <p class="message">変更が完了しました。</p>

    <!-- ③ 学生一覧リンク -->
    <a href="StudentListServlet" name="10">学生一覧へ戻る</a>

</body>
</html>

<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>学生情報登録完了</title>
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
            display: inline-block;
            margin-right: 20px;
            text-decoration: none;
            color: #007bff;
        }
    </style>
</head>
<body>

    <!-- ① 画面タイトル -->
    <h2>学生情報登録</h2>

    <!-- ② 完了メッセージ -->
    <p class="message">登録が完了しました。</p>

    <!-- ③ 戻るリンク（登録画面に遷移） -->
    <a href="StudentRegisterServlet" name="12">戻る</a>

    <!-- ④ 学生番号一覧リンク（学生一覧画面に遷移） -->
    <a href="StudentListServlet" name="10">学生一覧</a>

</body>
</html>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>科目情報変更</title>
    <style>
        body {
            font-family: sans-serif;
            padding: 20px;
        }
        label {	jm
            display: block;
            margin-top: 15px;
        }
        input[type="text"] {
            width: 300px;
            padding: 8px;
        }
        .btn {
            margin-top: 20px;
        }
        .error {
            color: red;
            margin-top: 10px;
        }
    </style>
</head>
<body>

    <!-- ① 画面タイトル -->
    <h2>科目情報変更</h2>

    <!-- エラーがあれば表示 -->
    <c:if test="${not empty errorMessage}">
        <div class="error">${errorMessage}</div>
    </c:if>

    <!-- 変更フォーム -->
    <form action="SubjectEditServlet" method="post">

        <!-- ② 科目コード ラベル -->
        <label for="cd">科目コード</label>

        <!-- ③ 科目コード（readonly） -->
        <input type="text" id="cd" name="cd"
               value="${cd}" readonly>

        <!-- ④ 科目名 ラベル -->
        <label for="name">科目名</label>

        <!-- ⑤ 科目名入力欄 -->
        <input type="text" id="name" name="name"
               value="${name}"
               placeholder="科目名を入力してください"
               maxlength="20"
               required>

        <!-- ⑥ 変更ボタン -->
        <div class="btn">
            <input type="submit" value="変更" name="45">
        </div>
    </form>

    <!-- ⑦ 戻るリンク -->
    <a href="SubjectListServlet" name="40">戻る</a>

</body>
</html>

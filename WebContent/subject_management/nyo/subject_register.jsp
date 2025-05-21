<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>科目情報登録</title>
    <style>
        .error {
            color: red;
            margin-bottom: 10px;
        }
        label {
            display: block;
            margin-top: 10px;
        }
        input[type="text"] {
            width: 300px;
            padding: 8px;
        }
        .btn {
            margin-top: 15px;
        }
    </style>
</head>
<body>

    <h2>科目情報登録</h2>

    <!-- エラーメッセージ（①②） -->
    <c:if test="${not empty errorMessage}">
        <div class="error">${errorMessage}</div> <!-- No.1 -->
    </c:if>

    <!-- 登録フォーム -->
    <form action="SubjectRegisterServlet" method="post">
        <!-- 科目コード -->
        <label for="cd">科目コード</label>
        <input type="text" id="cd" name="cd"
               value="${cd}"
               placeholder="科目コードを入力してください"
               maxlength="3"
               required>

        <!-- 科目名 -->
        <label for="name">科目名</label>
        <input type="text" id="name" name="name"
               value="${name}"
               placeholder="科目名を入力してください"
               maxlength="20"
               required>

        <!-- 登録ボタン -->
        <div class="btn">
            <input type="submit" value="登録" name="44">
        </div>
    </form>

    <!-- 戻るリンク -->
    <a href="SubjectListServlet" name="40">戻る</a>

</body>
</html>


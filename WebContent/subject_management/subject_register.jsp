<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>科目登録</title>
    <style>
        label { display: inline-block; width: 100px; margin-bottom: 5px; }
        input[type="text"] { width: 300px; padding: 5px; }
        .form-group { margin-bottom: 15px; }
    </style>
</head>
<body>

    <!-- 1. 画面タイトル、分類見出し、種別 -->
    <h2>科目登録</h2>

    <!-- 登録フォーム -->
    <form action="${pageContext.request.contextPath}/registerSubject" method="post">

        <!-- 2 & 3. 科目コード -->
        <div class="form-group">
            <label for="cd">科目コード</label><br>
            <input type="text" id="cd" name="cd"
                   value="${cd}"
                   maxlength="3" required
                   placeholder="科目コードを入力してください">
        </div>

        <!-- 4 & 5. 科目名 -->
        <div class="form-group">
            <label for="name">科目名</label><br>
            <input type="text" id="name" name="name"
                   value="${name}"
                   maxlength="20" required
                   placeholder="科目名を入力してください">
        </div>

        <!-- 6. 登録ボタン -->
        <div class="form-group">
            <input type="submit" value="登録">
        </div>

    </form>

    <!-- 7. 戻るリンク -->
    <a href="subject_list.jsp">戻る</a>

</body>
</html>

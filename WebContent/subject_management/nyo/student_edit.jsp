<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>学生情報変更</title>
    <style>
        body {
            font-family: sans-serif;
            padding: 20px;
        }
        label {
            display: block;
            margin-top: 10px;
        }
        input[type="text"], select {
            width: 300px;
            padding: 8px;
            margin-bottom: 5px;
        }
        .btn {
            margin-top: 15px;
        }
        .error {
            color: red;
            margin-bottom: 10px;
        }
        a {
            display: inline-block;
            margin-top: 15px;
        }
    </style>
</head>
<body>

    <!-- ① タイトル -->
    <h2>学生情報変更</h2>

    <!-- 共通エラーメッセージ（例：必須未入力、重複など） -->
    <c:if test="${not empty errorMessage}">
        <div class="error">${errorMessage}</div>
    </c:if>

    <form action="StudentEditServlet" method="post">

        <!-- 入学年度 -->
        <label for="ent_year">入学年度</label>
        <input type="text" id="ent_year" name="ent_year"
               value="${ent_year}" readonly>

        <!-- 学生番号 -->
        <label for="no">学生番号</label>
        <input type="text" id="no" name="no"
               value="${no}" readonly>

        <!-- 氏名 -->
        <label for="name">氏名</label>
        <input type="text" id="name" name="name"
               value="${name}"
               placeholder="氏名を入力してください"
               maxlength="30"
               required>
        <!-- 氏名エラー -->
        <c:if test="${not empty nameError}">
            <div class="error">${nameError}</div>
        </c:if>

        <!-- クラス -->
        <label for="class_num">クラス</label>
        <select id="class_num" name="class_num" required>
            <c:forEach var="cls" items="${classList}">
                <option value="${cls}" <c:if test="${cls == class_num}">selected</c:if>>${cls}</option>
            </c:forEach>
        </select>

        <!-- 在学中 -->
        <label for="is_attend">在学中</label>
        <input type="checkbox" id="is_attend" name="is_attend" value="true"
               <c:if test="${is_attend}">checked</c:if> >

        <!-- 変更ボタン -->
        <div class="btn">
            <input type="submit" name="login" value="変更">
        </div>
    </form>

    <!-- 戻る -->
    <a href="StudentListServlet" name="10">戻る</a>

</body>
</html>

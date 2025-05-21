<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>学生情報登録</title>
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
            margin-bottom: 10px;
        }
        .btn {
            margin-top: 15px;
        }
        a {
            display: block;
            margin-top: 10px;
        }
    </style>
</head>
<body>

    <h2>学生情報登録</h2>

    <form action="StudentRegisterServlet" method="post">

        <label for="ent_year">入学年度</label>
        <select id="ent_year" name="ent_year" required>
            <c:forEach var="year" items="${entYearList}">
                <option value="${year}" <c:if test="${year == selectedYear}">selected</c:if>>${year}</option>
            </c:forEach>
        </select>

        <label for="no">学生番号</label>
        <input type="text" id="no" name="no"
               value="${no}"
               placeholder="学生番号を入力してください"
               maxlength="10"
               required>

        <label for="name">氏名</label>
        <input type="text" id="name" name="name"
               value="${name}"
               placeholder="氏名を入力してください"
               maxlength="30"
               required>

        <label for="class_num">クラス</label>
        <select id="class_num" name="class_num" required>
            <c:forEach var="cls" items="${classList}">
                <option value="${cls}" <c:if test="${cls == selectedClass}">selected</c:if>>${cls}</option>
            </c:forEach>
        </select>

        <div class="btn">
            <button type="submit" name="end" value="true">登録して終了</button>
        </div>

    </form>

    <a href="StudentListServlet" name="10">戻る</a>

</body>
</html>

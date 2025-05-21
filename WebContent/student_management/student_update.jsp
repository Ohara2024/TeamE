<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>学生情報変更</title>
    <style>
        body { font-family: sans-serif; padding: 20px; }
        label { display: block; margin-top: 10px; }
        input[type="text"], select { width: 300px; padding: 8px; margin-bottom: 10px; }
        .btn { margin-top: 15px; }
        a { display: block; margin-top: 10px; }
    </style>
</head>
<body>
    <h2>学生情報変更</h2>
    <form action="/student/update/execute" method="post">
        <label>入学年度</label>
        <input type="text" name="ent_year" value="${student.entYear}" readonly>

        <label>学生番号</label>
        <input type="text" name="no" value="${student.no}" readonly>

        <label>氏名</label>
        <input type="text" name="name" value="${student.name}" maxlength="30" required>

        <label>クラス</label>
        <select name="class_num">
            <c:forEach var="cls" items="${classNumList}">
                <option value="${cls}" <c:if test="${cls == student.classNum}">selected</c:if>>${cls}</option>
            </c:forEach>
        </select>

        <label>在学中</label>
        <input type="checkbox" name="is_attend" value="true" <c:if test="${student.attend}">checked</c:if>>

        <div class="btn">
            <button type="submit">変更</button>
        </div>
    </form>
    <a href="/student_list">戻る</a>
</body>
</html>

<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head><title>学生情報登録</title></head>
<body>
<h2>学生情報登録</h2>
<form action="/student/create/execute" method="post">
    学生番号: <input type="text" name="no" maxlength="10" required><br>
    氏名: <input type="text" name="name" maxlength="30" required><br>
    入学年度:
    <select name="ent_year">
        <c:forEach var="year" items="${entYearList}">
            <option value="${year}">${year}</option>
        </c:forEach>
    </select><br>
    クラス:
    <select name="class_num">
        <c:forEach var="cls" items="${classNumList}">
            <option value="${cls}">${cls}</option>
        </c:forEach>
    </select><br>
    在学中: <input type="checkbox" name="is_attend" value="true" checked><br>
    <input type="submit" value="登録して終了">
</form>
<a href="student_list">戻る</a>
</body>
</html>

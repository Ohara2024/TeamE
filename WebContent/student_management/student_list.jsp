<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head><title>学生管理</title></head>
<body>
<h2>学生管理</h2>
<form action="student_list" method="get">
    入学年度:
    <select name="ent_year">
        <c:forEach var="year" items="${entYearList}">
            <option value="${year}">${year}</option>
        </c:forEach>
    </select>
    クラス:
    <select name="class_num">
        <c:forEach var="cls" items="${classNumList}">
            <option value="${cls}">${cls}</option>
        </c:forEach>
    </select>
    在学中:<input type="checkbox" name="is_attend" value="true" checked>
    <input type="submit" value="絞り込み">
</form>

<c:if test="${empty list}">
    <p>該当する学生情報はありません。</p>
</c:if>

<c:if test="${not empty list}">
    <table border="1">
        <tr>
            <th>入学年度</th>
            <th>学生番号</th>
            <th>氏名</th>
            <th>クラス</th>
            <th>在学中</th>
            <th>操作</th>
        </tr>
        <c:forEach var="student" items="${list}">
            <tr>
                <td>${student.entYear}</td>
                <td>${student.no}</td>
                <td>${student.name}</td>
                <td>${student.classNum}</td>
                <td><c:choose><c:when test="${student.attend}">○</c:when><c:otherwise>×</c:otherwise></c:choose></td>
                <td><a href="student_edit?no=${student.no}">変更</a></td>
            </tr>
        </c:forEach>
    </table>
</c:if>

<a href="student/create">新規登録</a>
</body>
</html>
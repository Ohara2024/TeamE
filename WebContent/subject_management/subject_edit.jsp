<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>科目変更</title>
    <style>
        label { display: inline-block; width: 100px; margin-bottom: 5px; }
        input[type="text"] { width: 300px; padding: 5px; }
        .form-group { margin-bottom: 15px; }
    </style>
</head>
<body>

<h2>科目変更</h2>

<c:if test="${not empty error}">
    <p style="color:red;">${error}</p>
</c:if>

<c:if test="${not empty subject}">
    <form action="${pageContext.request.contextPath}/subject_update" method="post">
        <div class="form-group">
            <label for="cd">科目コード</label><br>
            <input type="text" id="cd" name="cd" value="${subject.cd}" readonly>
        </div>
        <div class="form-group">
            <label for="name">科目名</label><br>
            <input type="text" id="name" name="name" value="${subject.name}" maxlength="20" required>
        </div>
        <div class="form-group">
            <input type="submit" value="変更">
        </div>
    </form>
</c:if>

<a href="${pageContext.request.contextPath}/subject_list.jsp">戻る</a>

</body>
</html>

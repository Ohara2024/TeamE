<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List, bean.Subject" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>


<html>
<head>
    <title>科目一覧</title>
    <style>
        table {
            border-collapse: collapse;
            width: 80%;
        }
        th, td {
            border: 1px solid #ccc;
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        a.button {
            margin-right: 10px;
        }
    </style>
</head>
<body>

<h2>科目一覧</h2>

<c:if test="${not empty error}">
    <p style="color:red;">${error}</p>
</c:if>

<table>
    <tr>
        <th>科目コード</th>
        <th>科目名</th>
        <th>操作</th>
    </tr>
    <c:forEach var="subject" items="${subjectList}">
        <tr>
            <td>${subject.cd}</td>
            <td>${subject.name}</td>
            <td>
<a href="${pageContext.request.contextPath}/subjectmanagement/update.action?cd=${subject.cd}" class="button">編集</a>

                <form action="${pageContext.request.contextPath}/subjectmanagement/delete.action" method="post" style="display:inline;">
                    <input type="hidden" name="cd" value="${subject.cd}">
<a href="${pageContext.request.contextPath}/subjectmanagement/delete.action?cd=${subject.cd}" class="button">削除</a>
                </form>
            </td>
        </tr>
    </c:forEach>
</table>

<p><a href="${pageContext.request.contextPath}/subjectmanagement/create.action">新規登録</a></p>

</body>
</html>


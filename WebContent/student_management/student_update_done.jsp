<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>学生情報変更完了</title>
    <style>
        body { font-family: sans-serif; padding: 20px; }
        h2 { color: #333; }
        p { background-color: #e0ffe0; padding: 10px; border-left: 4px solid #4CAF50; }
        a { margin-right: 15px; display: inline-block; }
    </style>
</head>
<body>
    <h2>学生情報変更</h2>
    <p>変更が完了しました。</p>
    <a href="${pageContext.request.contextPath}/studentmanagement/update.action?no=${student.no}">戻る</a>
    <a href="${pageContext.request.contextPath}/studentmanagement/list.action">学生一覧</a>
</body>
</html>
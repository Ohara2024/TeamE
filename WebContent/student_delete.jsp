<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="bean.Subject" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>科目削除確認</title>
    <style>
        body {
            font-family: sans-serif;
            margin: 2em;
        }
        .container {
            max-width: 500px;
            margin: auto;
            border: 1px solid #ddd;
            padding: 1.5em;
            border-radius: 8px;
            background-color: #f9f9f9;
        }
        h2 {
            color: #c00;
        }
        .info {
            margin: 1em 0;
        }
        .buttons {
            display: flex;
            gap: 1em;
        }
        .buttons input, .buttons a {
            padding: 0.5em 1em;
            text-decoration: none;
            border: none;
            border-radius: 4px;
        }
        .delete-btn {
            background-color: #c00;
            color: white;
        }
        .cancel-btn {
            background-color: #ccc;
            color: black;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>科目削除確認</h2>

        <c:if test="${not empty error}">
            <p style="color:red;">${error}</p>
        </c:if>

        <div class="info">
            <p>以下の科目を削除してもよろしいですか？</p>
            <p><strong>科目コード：</strong> ${subject.cd}</p>
            <p><strong>科目名　　：</strong> ${subject.name}</p>
        </div>

        <form action="SubjectDeleteAction" method="post">
            <input type="hidden" name="cd" value="${subject.cd}" />
            <div class="buttons">
                <input type="submit" value="削除する" class="delete-btn" />
                <a href="subject_list.jsp" class="cancel-btn">キャンセル</a>
            </div>
        </form>
    </div>
</body>
</html>

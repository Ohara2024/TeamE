<%@ page contentType="text/html; charset=UTF-8" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>科目削除確認</title>
    <style>



    </style>
</head>
<body>
<header>得点管理システム</header>
<div class="container">
    <nav>
        <ul>
            <li><a href="<%= request.getContextPath() %>">メニュー</a></li>
            <li><a href="<%= request.getContextPath() %>">学生管理</a></li>
            <li><a href="<%= request.getContextPath() %>">成績管理</a></li>
            <li><a href="<%= request.getContextPath() %>/subjectmanager/TestRegistAction">　成績登録</a></li>
            <li><a href="<%= request.getContextPath() %>/subjectmanager/TestListAction">　成績参照</a></li>
            <li><a href="<%= request.getContextPath() %>">科目管理</a></li>
        </ul>
    </nav>
    <main>
        <h2>科目情報削除</h2>

        <%
            String error = (String) request.getAttribute("error");
            if (error != null && !error.isEmpty()) {
        %>
            <p style="color:red;"><%= error %></p>
        <%
            }

            String cd = request.getParameter("cd");
            String name = request.getParameter("name");
        %>

        <form action="<%= request.getContextPath() %>/scoremanager/SubjectDeleteExecuteAction" method="post">
            <input type="hidden" name="cd" value="<%= (cd != null ? cd : "") %>" />
            <div class="buttons">
                <input type="submit" value="削除する" class="delete-btn" />
                <a href="<%= request.getContextPath() %>/scoremanager/SubjectListAction" class="cancel-btn">キャンセル</a>
            </div>
        </form>
    </main>
</div>
</body>
</html>

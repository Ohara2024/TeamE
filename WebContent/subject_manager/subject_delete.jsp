<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>科目削除確認</title>
    <style>
        body {
            font-family: sans-serif;
            margin: 0;
            padding: 0;
            height: 100vh;
            display: flex;
            flex-direction: column;
        }
        header {
            background-color: #004080;
            color: white;
            padding: 1em;
            font-size: 1.5em;
            font-weight: bold;
            text-align: center;
        }
        .container {
            flex: 1;
            display: flex;
            height: calc(100vh - 60px);
        }
        nav {
            width: 200px;
            background-color: #f0f0f0;
            border-right: 1px solid #ccc;
            padding: 1em;
            box-sizing: border-box;
        }
        nav ul {
            list-style: none;
            padding: 0;
        }
        nav li {
            margin-bottom: 1em;
        }
        nav a {
            color: #004080;
            text-decoration: none;
            font-weight: bold;
        }
        nav a:hover {
            text-decoration: underline;
        }
        main {
            flex: 1;
            padding: 2em;
            box-sizing: border-box;
            background-color: #fff;
        }
        h2 {
            color: #c00;
            margin-top: 0;
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
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-weight: bold;
        }
        .delete-btn {
            background-color: #c00;
            color: white;
        }
        .cancel-btn {
            background-color: #ccc;
            color: black;
            text-align: center;
            display: inline-block;
            line-height: normal;
            text-decoration: none;
        }
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

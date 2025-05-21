<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="bean.Subject" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>科目削除確認</title>
    <style>
        /* 省略：前回のスタイルをそのまま使えます */
    </style>
</head>
<body>
<header>得点管理システム</header>
<div class="container">
    <nav>
        <ul>
            <li><a href="<%= request.getContextPath() %>/menu.jsp">メニュー</a></li>
            <li><a href="<%= request.getContextPath() %>/StudentListAction">学生管理</a></li>
            <li><a href="<%= request.getContextPath() %>/GradeListAction">成績管理</a></li>
            <li><a href="<%= request.getContextPath() %>/TestRegistAction">　成績登録</a></li>
            <li><a href="<%= request.getContextPath() %>/TestListAction">　成績参照</a></li>
            <li><a href="<%= request.getContextPath() %>/SubjectListAction">科目管理</a></li>
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

            Subject subject = (Subject) request.getAttribute("subject");
            if (subject == null) {
        %>
            <p style="color:red;">科目情報が取得できませんでした。</p>
            <a href="<%= request.getContextPath() %>/scoremanager/SubjectListAction">科目一覧に戻る</a>
        <%
            } else {
        %>
            <div class="info">
                <p>この科目を削除してもよろしいですか？</p>
                <p><strong>科目コード:</strong> <%= subject.getCd() %></p>
                <p><strong>科目名:</strong> <%= subject.getName() %></p>
            </div>

            <form action="<%= request.getContextPath() %>/scoremanager/SubjectDeleteExecuteAction" method="post">
                <input type="hidden" name="cd" value="<%= subject.getCd() %>" />
                <div class="buttons">
                    <input type="submit" value="削除する" class="delete-btn" />
                    <a href="<%= request.getContextPath() %>/scoremanager/SubjectListAction" class="cancel-btn">キャンセル</a>
                </div>
            </form>
        <%
            }
        %>
    </main>
</div>
</body>
</html>

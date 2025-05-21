<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>科目削除完了</title>
    <style>
        /* 前回のスタイルそのまま使えます */
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
        <p>科目の削除が完了しました。</p>
        <a href="<%= request.getContextPath() %>/scoremanager/SubjectListAction">科目一覧に戻る</a>
    </main>
</div>
</body>
</html>

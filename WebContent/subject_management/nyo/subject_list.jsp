<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="yourpackage.Subject" %>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>科目管理</title>
    <style>
        table {
            width: 60%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #ccc;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        a {
            margin-right: 10px;
        }
    </style>
</head>
<body>

    <!-- ① 画面タイトル -->
    <h2>科目管理</h2>

    <!-- ② 新規登録リンク -->
    <a href="SubjectRegisterServlet" name="41">新規登録</a>

    <!-- ③ 科目一覧テーブル -->
    <table>
        <tr>
            <!-- ④,⑤ ヘッダー -->
            <th>科目コード</th>
            <th>科目名</th>
            <th>操作</th>
        </tr>

        <!-- ⑥〜⑨ 科目データを表示 -->
        <%
            List<Subject> subjects = (List<Subject>) request.getAttribute("subjects");
            if (subjects != null && !subjects.isEmpty()) {
                for (Subject subject : subjects) {
        %>
        <tr>
            <td><%= subject.getCode() %></td> <!-- ⑥ -->
            <td><%= subject.getName() %></td> <!-- ⑦ -->
            <td>
                <a href="SubjectEditServlet?code=<%= subject.getCode() %>" name="42">変更</a> <!-- ⑧ -->
                <a href="SubjectDeleteServlet?code=<%= subject.getCode() %>" name="43">削除</a> <!-- ⑨ -->
            </td>
        </tr>
        <%
                }
            } else {
        %>
        <tr>
            <td colspan="3">科目が登録されていません。</td>
        </tr>
        <%
            }
        %>
    </table>

</body>
</html>

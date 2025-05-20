<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="bean.Teacher" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>メニュー - 得点管理システム</title>
    <style>
        body {
            font-family: sans-serif;
            background-color: #f0f4f8;
            margin: 0;
            padding: 0;
            text-align: center;
        }

        header {
            background-color: #007bff;
            color: white;
            padding: 20px 0;
        }

        .menu-container {
            margin: 50px auto;
            width: 80%;
            max-width: 600px;
        }

        .menu-box {
            background: white;
            border-radius: 10px;
            padding: 30px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        h2 {
            margin-bottom: 20px;
            color: #333;
        }

        ul {
            list-style: none;
            padding: 0;
        }

        ul li {
            margin: 15px 0;
        }

        a {
            text-decoration: none;
            color: #007bff;
            font-weight: bold;
        }

        a:hover {
            text-decoration: underline;
        }

        footer {
            margin-top: 50px;
            font-size: 0.9em;
            color: #555;
        }

        .logout {
            margin-top: 30px;
        }
    </style>
</head>
<body>

    <header>
        <h1>得点管理システム</h1>
    </header>

    <div class="menu-container">
        <div class="menu-box">
            <%
                Teacher teacher = (Teacher) session.getAttribute("teacher");
                if (teacher == null) {
                    response.sendRedirect("login.jsp");
                    return;
                }
            %>
            <h2>ようこそ、<%= teacher.getName() %>先生</h2>

            <ul>
                <li><a href="StudentView.action">学生管理</a></li>
                <li><a href="SubjectView.action">科目管理</a></li>
                <li><a href="ScoreView.action">得点管理</a></li>
            </ul>

            <div class="logout">
                <a href="Logout.action">ログアウト</a>
            </div>
        </div>
    </div>

    <footer>
        &copy; 2025 TBC<br>高崎情報ITクリエイター専門学校
    </footer>

</body>
</html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>成績管理</title>
    <style>
        body {
            font-family: sans-serif;
            margin: 0;
            padding: 0;
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
            display: flex;
            height: 100vh;
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
            overflow-y: auto;
        }
        h2 {
            color: #004080;
        }
        .form-box {
            border: 1px solid #ccc;
            border-radius: 8px;
            padding: 1.5em;
            background-color: #f9f9f9;
            margin-bottom: 2em;
        }
        .form-row {
            display: flex;
            flex-wrap: wrap;
            gap: 1.5em;
        }
        .form-item {
            display: flex;
            flex-direction: column;
            min-width: 200px;
        }
        .form-item label {
            margin-bottom: 0.5em;
            font-weight: bold;
        }
        .form-item select, .form-item button {
            padding: 0.5em;
            border-radius: 4px;
            border: 1px solid #ccc;
        }
        .result-table {
            width: 100%;
            border-collapse: collapse;
        }
        .result-table th, .result-table td {
            border: 1px solid #ccc;
            padding: 0.5em;
            text-align: center;
        }
        .result-table th {
            background-color: #eef;
        }
        .submit-button {
            margin-top: 1em;
            background-color: #004080;
            color: white;
            border: none;
            padding: 0.5em 1em;
            border-radius: 4px;
            font-weight: bold;
            cursor: pointer;
        }
        .submit-button:hover {
            background-color: #003366;
        }
    </style>
</head>
<body>
<header>得点管理システム</header>
<div class="container">
    <nav>
        <ul>
            <li><a href="#">メニュー</a></li>
            <li><a href="#">学生管理</a></li>
            <li><a href="#">成績管理</a></li>
            <li><a href="#">　成績登録</a></li>
            <li><a href="#">　成績参照</a></li>
            <li><a href="#">科目管理</a></li>
        </ul>
    </nav>
    <main>
        <h2>成績登録</h2>

        <!-- 検索フォーム -->
        <div class="form-box">
     <form action="TestRegistAction" method="post" class="form-row">
    <div class="form-item">
        <label for="admissionYear">入学年度</label>
        <select id="admissionYear" name="admissionYear">
            <option value="">--選択--</option>
            <c:forEach var="year" items="${yearList}"></c:forEach>
        </select>
    </div>
    <div class="form-item">
        <label for="className">クラス</label>
        <select id="className" name="className">
            <c:forEach var="cls" items="${classList}">
                <option value="${cls}">${cls}</option>
            </c:forEach>
        </select>
    </div>
    <div class="form-item">
        <label for="subject">科目</label>
        <select id="subject" name="subject">
            <c:forEach var="subj" items="${subjectList}">
                <option value="${subj.id}">${subj.name}</option>
            </c:forEach>
        </select>
    </div>
    <div class="form-item">
        <label for="examCount">回数</label>
        <select id="examCount" name="examCount">
        </select>
    </div>
    <div class="form-item">
        <label>&nbsp;</label>
        <button type="submit">検索</button>
    </div>
</form>

        </div>

        <!-- 検索結果（学生一覧＋得点入力フォーム） -->
        <c:if test="${not empty studentList}">
            <form action="TestRegistExecuteAction" method="post">
                <table class="result-table">
                    <tr>
                        <th>学生番号</th>
                        <th>氏名</th>
                        <th>得点</th>
                    </tr>
                    <c:forEach var="stu" items="${studentList}">
                        <tr>
                            <td>${stu.no}</td>
                            <td>${stu.name}</td>
                            <td>
                                <input type="number" name="score_${stu.no}" min="0" max="100" required>
                            </td>
                        </tr>
                    </c:forEach>
                </table>

                <!-- 隠しフィールド -->
                <input type="hidden" name="subjectId" value="${param.subject}">
                <input type="hidden" name="examCount" value="${param.examCount}">
                <button type="submit" class="submit-button">登録</button>
            </form>
        </c:if>
    </main>
</div>
</body>
</html>

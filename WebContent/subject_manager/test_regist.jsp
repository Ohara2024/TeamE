<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>成績管理</title>
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
            <li><a href="<%= request.getContextPath() %>/subjectmanager/TestRegistAction">成績登録</a></li>
            <li><a href="<%= request.getContextPath() %>/subjectmanager/TestListAction">成績参照</a></li>
            <li><a href="<%= request.getContextPath() %>">科目管理</a></li>
        </ul>
    </nav>
    <main>
        <h2>成績登録</h2>

        <div class="form-box">
            <form action="<%= request.getContextPath() %>/subjectmanager/TestRegistExecuteAction" method="post">

                <div class="form-item">
                    <label for="admissionYear">入学年度</label>
                    <select id="admissionYear" name="admissionYear">
                        <option value="">--選択--</option>
                        <c:forEach var="year" items="${yearList}">
                            <option value="${year}">${year}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-item">
                    <label for="className">クラス</label>
                    <select id="className" name="className">
                        <option value="">--選択--</option>
                        <c:forEach var="cls" items="${classList}">
                            <option value="${cls}">${cls}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-item">
                    <label for="subject">科目</label>
                    <select id="subject" name="subject">
                        <option value="">--選択--</option>
                        <c:forEach var="subj" items="${subjectList}">
                            <option value="${subj}">${subj}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-item">
                    <label for="examCount">回数</label>
                    <select id="examCount" name="examCount">
                        <option value="">--選択--</option>
                        <c:forEach var="i" begin="1" end="5">
                            <option value="${i}">${i}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-item">
                    <label>&nbsp;</label>
                    <button type="submit">検索</button>
                </div>
            </form>
        </div>

        <c:if test="${not empty studentList}">
          <form action="<%= request.getContextPath() %>/subjectmanager/TestRegistExecuteAction" method="post">
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

                <input type="hidden" name="subjectId" value="${param.subject}">
                <input type="hidden" name="examCount" value="${param.examCount}">
                <button type="submit" class="submit-button">登録</button>
            </form>
        </c:if>
    </main>
</div>
</body>
</html>

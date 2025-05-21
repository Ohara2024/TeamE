<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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
            <li><a href="<%= request.getContextPath() %>/subjectmanager/TestRegistAction">　成績登録</a></li>
            <li><a href="<%= request.getContextPath() %>">　成績参照</a></li>
            <li><a href="<%= request.getContextPath() %>">科目管理</a></li>
        </ul>
    </nav>
    <main>
        <h2>成績登録</h2>

        <div class="form-box">
<form action="TestRegistAction" method="post" class="form-row">
    <div class="form-item">
        <label for="admissionYear">入学年度</label>
        <select id="admissionYear" name="admissionYear">
            <option value="">--選択--</option>
            <option value="2021">2021</option>
            <option value="2022">2022</option>
            <option value="2023">2023</option>
            <c:forEach var="year" items="${yearList}">
            </c:forEach>
        </select>
    </div>
    <div class="form-item">
        <label for="className">クラス</label>
        <select id="className" name="className">
            <option value="">--選択--</option>
            <option value="101">101</option>
            <option value="131">131</option>
            <option value="201">201</option>
            <c:forEach var="cls" items="${classList}">
            </c:forEach>
        </select>
    </div>
    <div class="form-item">
        <label for="subject">科目</label>
        <select id="subject" name="subject">
            <option value="">--選択--</option>
            <option value="数学">数学</option>
            <option value="国語">国語</option>
            <option value="理科">理科</option>
            <option value="情報処理基礎知識Ⅰ">情報処理基礎知識Ⅰ</option>
            <option value="英語コミニケーション概論">英語コミニケーション概論</option>
            <option value="Javaフレームワーク">Javaフレームワーク</option>
            <option value="Git">Git</option>
            <option value="H2">H2</option>
            <option value="ID管理術">ID管理術</option>
            <option value="Javaシステム開発">Javaシステム開発</option>
            <option value="AWS">AWS</option>
            <option value="Bean">Bean</option>
            <option value="C言語">C言語</option>
            <option value="DB">DB</option>
            <option value="エラー対処術">エラー対処術</option>
            <option value="Flutter">Futter</option>
            <option value="Go言語">Go言語</option>
            <option value="ハードウェア">ハードウェア</option>
            <option value="IT概論">IT概論</option>
            <option value="Java基礎">Java基礎</option>
            <c:forEach var="subj" items="${subjectList}">
            </c:forEach>
        </select>
    </div>
    <div class="form-item">
        <label for="examCount">回数</label>
        <select id="examCount" name="examCount">
            <option value="">--選択--</option>
            <option value="1">1</option>
            <option value="2">2</option>
            <c:forEach var="i" begin="1" end="5">
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

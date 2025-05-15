<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="test_management.TestReferenceSearch"%>
<%@ page import="bean.TestListStudent"%>
<%@ page import="bean.TestListSubject"%>

<%
    TestReferenceSearch search = new TestReferenceSearch();

    // Lấy dữ liệu dropdown
    List<Integer> entYears = search.getEntYears();
    List<String> classNums = search.getClassNums();
    List<String> subjects = search.getSubjects();

    request.setAttribute("entYears", entYears);
    request.setAttribute("classNums", classNums);
    request.setAttribute("subjects", subjects);

    // Lấy tham số từ form
    String entYearParam = request.getParameter("entYear");
    String classNumParam = request.getParameter("classNum");
    String subjectCdParam = request.getParameter("subjectCd");
    String studentNoParam = request.getParameter("studentNo");

    Integer entYear = null;
    if (entYearParam != null && !entYearParam.isEmpty()) {
        entYear = Integer.parseInt(entYearParam);
    }

    List<?> resultList = null;
    if (entYearParam != null || classNumParam != null || subjectCdParam != null || studentNoParam != null) {
        resultList = search.search(entYear, classNumParam, subjectCdParam, studentNoParam);
    }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>成績参照</title>
<style>
    body { font-family: Arial, sans-serif; }
    .container { width: 800px; margin: 30px auto; }
    fieldset { border: 1px solid #ccc; padding: 15px; margin-bottom: 20px; }
    legend { font-weight: bold; }
    label { display: inline-block; width: 100px; }
    select, input { width: 150px; padding: 5px; margin-right: 20px; }
    button { padding: 6px 12px; }
    .search-section { margin-bottom: 20px; }
    table, th, td { border: 1px solid #ccc; border-collapse: collapse; padding: 5px; }
</style>
</head>
<body>

<div class="container">
    <h2>成績参照</h2>

    <form method="get" action="test_search.jsp">
        <div class="search-section">
            <fieldset>
                <legend>科目情報</legend>
                <label for="entYear">入学年度</label>
                <select id="entYear" name="entYear">
                    <option value="">----------</option>
                    <c:forEach var="year" items="${entYears}">
                        <option value="${year}" <c:if test="${param.entYear == year.toString()}">selected</c:if>>${year}</option>
                    </c:forEach>
                </select>

                <label for="classNum">クラス</label>
                <select id="classNum" name="classNum">
                    <option value="">----------</option>
                    <c:forEach var="cls" items="${classNums}">
                        <option value="${cls}" <c:if test="${param.classNum == cls}">selected</c:if>>${cls}</option>
                    </c:forEach>
                </select>

                <label for="subjectCd">科目</label>
                <select id="subjectCd" name="subjectCd">
                    <option value="">----------</option>
                    <c:forEach var="sub" items="${subjects}">
                        <option value="${sub}" <c:if test="${param.subjectCd == sub}">selected</c:if>>${sub}</option>
                    </c:forEach>
                </select>

                <button type="submit">検索</button>
            </fieldset>
        </div>

        <div class="search-section">
            <fieldset>
                <legend>学生情報</legend>
                <label for="studentNo">学生番号</label>
                <input type="text" id="studentNo" name="studentNo" placeholder="学生番号を入力してください" value="${param.studentNo}" />
                <button type="submit">検索</button>
            </fieldset>
        </div>
    </form>

    <hr />

    <%
        if (resultList != null && !resultList.isEmpty()) {
            Object first = resultList.get(0);
            if (first instanceof TestListStudent) {
    %>
                <h3>成績一覧 (科目)</h3>
                <table>
                    <tr>
                        <th>入学年度</th>
                        <th>クラス</th>
                        <th>学生番号</th>
                        <th>氏名</th>
                        <th>1回</th>
                        <th>2回</th>
                    </tr>
                    <c:forEach var="t" items="${resultList}">
                        <tr>
                            <td><c:out value="${t.entYear}"/></td>
                            <td><c:out value="${t.classNum}"/></td>
                            <td><c:out value="${t.studentNo}"/></td>
                            <td><c:out value="${t.studentName}"/></td>
                            <td><c:out value="${t.point}"/></td>
                            <td>-</td>
                        </tr>
                    </c:forEach>
                </table>
    <%
            } else if (first instanceof TestListSubject) {
    %>
                <h3>成績一覧 (学生)</h3>
                <table>
                    <tr>
                        <th>科目名</th>
                        <th>科目コード</th>
                        <th>回数</th>
                        <th>点数</th>
                    </tr>
                    <c:forEach var="t" items="${resultList}">
                        <tr>
                            <td><c:out value="${t.subjectName}"/></td>
                            <td><c:out value="${t.subjectCd}"/></td>
                            <td><c:out value="${t.num}"/></td>
                            <td><c:out value="${t.point}"/></td>
                        </tr>
                    </c:forEach>
                </table>
    <%
            }
        } else {
    %>
        <p>検索結果はありません。</p>
    <%
        }
    %>
</div>

</body>
</html>

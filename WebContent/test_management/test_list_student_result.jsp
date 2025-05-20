<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/main/header.jsp" />


<div class="main">
    <h2 style="background-color:#d8e6f7; padding: 10px 20px;">学生別成績結果</h2>

    <c:choose>
        <c:when test="${not empty resultList}">
            <p>学生番号: <strong><c:out value="${student.studentNo}" /></strong></p>
            <p>学生名: <strong><c:out value="${student.studentName}" /></strong></p>

            <table border="1" cellpadding="5" cellspacing="0" style="border-collapse: collapse; width: 100%;">
                <thead style="background-color:#f0f0f0;">
                    <tr>
                        <th>科目コード</th>
                        <th>科目名</th>
                        <th>点数</th>
                        <th>入学年度</th>
                        <th>クラス</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="item" items="${resultList}">
                        <tr>
                            <td><c:out value="${item.subject.subjectCd}" /></td>
                            <td><c:out value="${item.subject.subjectName}" /></td>
                            <td><c:out value="${item.score}" /></td>
                            <td><c:out value="${item.entranceYear}" /></td>
                            <td><c:out value="${item.classNum}" /></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:when>
        <c:otherwise>
            <p style="color:red;">該当する成績データが見つかりませんでした。</p>
        </c:otherwise>
    </c:choose>

    <p style="margin-top: 20px;">
        <a href="teame/testmanagement/list">検索画面に戻る</a>
    </p>
</div>

<jsp:include page="/main/footer.jsp" />

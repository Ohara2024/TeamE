<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/main/header.jsp" />
<jsp:include page="/main/side_menu.jsp" />

<div class="main">
    <h2>学生管理</h2>

    <form method="get" action="list" style="margin-bottom: 20px;">
        入学年度:
        <input type="text" name="entYear" value="${param.entYear}" />
        クラス:
        <input type="text" name="classNum" value="${param.classNum}" />
        在学中:
        <input type="checkbox" name="isAttend" <c:if test="${param.isAttend == 'on'}">checked</c:if> />
        <input type="submit" value="絞込み" />
        <a href="new" style="margin-left: 20px;">新規登録</a>
    </form>

    <table border="1" cellpadding="5" cellspacing="0" style="width: 100%;">
        <thead>
            <tr>
                <th>入学年度</th>
                <th>学生番号</th>
                <th>氏名</th>
                <th>クラス</th>
                <th>在学中</th>
                <th>変更</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="student" items="${list}">
                <tr>
                    <td><c:out value="${student.entYear}" /></td>
                    <td><c:out value="${student.no}" /></td>
                    <td><c:out value="${student.name}" /></td>
                    <td><c:out value="${student.classNum}" /></td>
                    <td><c:choose>
                        <c:when test="${student.isAttend}">○</c:when>
                        <c:otherwise>×</c:otherwise>
                    </c:choose></td>
                    <td><a href="edit?no=${student.no}">変更</a></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

<jsp:include page="/main/footer.jsp" />

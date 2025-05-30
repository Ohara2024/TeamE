<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<jsp:include page="/main/base.jsp" />

<div class="main-content">

<h2>成績参照</h2>

<!-- FORM 1: 科目情報での検索 -->
<form method="post" action="${pageContext.request.contextPath}/testmanagement/subjectexe.action">
    <fieldset style="border: none; padding: 10px 0; margin-bottom: 20px;">
        <legend style="font-weight: bold; margin-bottom: 5px;">科目情報</legend>

        <label for="entranceYear" style="margin-right: 10px;">入学年度</label>
        <select name="entranceYear" id="entranceYear" style="margin-right: 20px;">
            <option value="">-------</option>
            <c:forEach var="year" items="${entYearSet}">
                <option value="${year}">${year}</option>
            </c:forEach>
        </select>

        <label for="classNum" style="margin-right: 10px;">クラス</label>
        <select name="classNum" id="classNum" style="margin-right: 20px;">
            <option value="">-------</option>
            <c:if test="${empty cNumlist}">
                <option value="" disabled>クラスがありません</option>
            </c:if>
            <c:forEach var="cNum" items="${cNumlist}">
                <option value="${cNum}">${cNum}</option>
            </c:forEach>
        </select>

        <label for="subject" style="margin-right: 10px;">科目</label>
        <select name="subject" id="subject" style="margin-right: 20px;">
            <option value="">-------</option>
            <c:if test="${empty list}">
                <option value="" disabled>科目がありません</option>
            </c:if>
            <c:forEach var="subj" items="${list}">
                <option value="${subj.cd}">${subj.name}</option>
            </c:forEach>
        </select>

        <button type="submit" style="padding: 5px 15px;">検索</button>
    </fieldset>
</form>

<!-- FORM 2: 学生番号での検索 -->
<form method="post" action="${pageContext.request.contextPath}/testmanagement/studentexe.action">
    <fieldset style="border: none; padding: 10px 0;">
        <legend style="font-weight: bold; margin-bottom: 5px;">学生情報</legend>

        <label for="studentNo" style="margin-right: 10px;">学生番号</label>
        <input type="text" name="studentNo" id="studentNo" placeholder="例: 2225001" style="width: 200px; padding: 5px;" required />

        <button type="submit" style="margin-left: 10px; padding: 5px 15px;">検索</button>
    </fieldset>
</form>

<!-- データ一覧表示 -->
<c:if test="${not empty cNumlist or not empty list}">
    <h3>利用可能なデータ</h3>
    <h4>クラス一覧</h4>
    <ul>
        <c:forEach var="cNum" items="${cNumlist}">
            <li>${cNum}</li>
        </c:forEach>
    </ul>
    <h4>科目一覧</h4>
    <ul>
        <c:forEach var="subj" items="${list}">
            <li>${subj.name} (コード: ${subj.cd})</li>
        </c:forEach>
    </ul>
</c:if>
<c:if test="${empty cNumlist and empty list}">
    <p style="color: red;">データベースにクラスまたは科目のデータがありません。管理者にご連絡ください。</p>
</c:if>
</div>
<jsp:include page="/main/footer.jsp" />
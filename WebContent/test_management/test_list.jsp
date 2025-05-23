<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<jsp:include page="/main/header.jsp" />
<jsp:include page="/main/side_menu.jsp" />

<h2>成績参照</h2>

<!-- FORM 1: Tìm theo 科目情報 (năm, lớp, môn) -->
<form method="post" action="/TeamE/testmanagement/subjectexe">
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
            <c:forEach var="cNum" items="${cNumlist}">
                <option value="${cNum}">${cNum}</option>
            </c:forEach>
        </select>

        <label for="subject" style="margin-right: 10px;">科目</label>
        <select name="subject" id="subject" style="margin-right: 20px;">
            <option value="">-------</option>
            <c:forEach var="subj" items="${list}">
                <option value="${subj.cd}">${subj.name}</option>
            </c:forEach>
        </select>

        <button type="submit" style="padding: 5px 15px;">検索</button>
    </fieldset>
</form>

<!-- FORM 2: Tìm theo 学生番号 -->
<form method="post" action="/TeamE/testmanagement/studentexe">
    <fieldset style="border: none; padding: 10px 0;">
        <legend style="font-weight: bold; margin-bottom: 5px;">学生情報</legend>

        <label for="studentNo" style="margin-right: 10px;">学生番号</label>
        <input type="text" name="studentNo" id="studentNo" placeholder="学生番号を入力してください" style="width: 200px; padding: 5px;" />

        <button type="submit" style="margin-left: 10px; padding: 5px 15px;">検索</button>
    </fieldset>
</form>

<jsp:include page="/main/footer.jsp" />

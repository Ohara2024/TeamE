<!-- test_list.jsp -->
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/main/header.jsp" />
<jsp:include page="/main/side_menu.jsp" />

<div class="main">

    <h2 style="background-color:#d8e6f7; padding: 10px 20px;">成績参照（科目別）</h2>

    <form action="TestSearchBySubject.action" method="post" style="margin-bottom: 15px;">
        <fieldset style="border: none; padding: 10px 0;">
            <legend style="font-weight: bold; margin-bottom: 5px;">科目情報</legend>

            <label for="entranceYear">入学年度</label>
            <select name="entranceYear" id="entranceYear">
                <option value="">-------</option>
                <c:forEach var="year" items="${entYearSet}">
                    <option value="${year}">${year}</option>
                </c:forEach>
            </select>

            <label for="classNum" style="margin-left: 15px;">クラス</label>
            <select name="classNum" id="classNum">
                <option value="">-------</option>
                <c:forEach var="cNum" items="${cNumlist}">
                    <option value="${cNum}">${cNum}</option>
                </c:forEach>
            </select>

            <label for="subject" style="margin-left: 15px;">科目</label>
            <select name="subject" id="subject">
                <option value="">-------</option>
                <c:forEach var="subj" items="${list}">
                    <option value="${subj.subjectCd}">${subj.subjectName}</option>
                </c:forEach>
            </select>

            <button type="submit" style="margin-left: 15px; padding: 5px 10px;">検索</button>
        </fieldset>
    </form>

    <p style="color: #33b5e5; font-size: 13px; margin-top: 10px;">
        科目情報を選択して検索ボタンをクリックしてください
    </p>

</div>

<jsp:include page="/main/footer.jsp" />

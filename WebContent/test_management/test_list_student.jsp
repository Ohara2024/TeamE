<!-- test_list_student.jsp -->
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/main/header.jsp" />
<jsp:include page="/main/side_menu.jsp" />

<div class="main">

    <h2 style="background-color:#d8e6f7; padding: 10px 20px;">成績参照（学生別）</h2>

    <form action="TestSearchByStudent.action" method="post">
        <fieldset style="border: none; padding: 10px 0;">
            <legend style="font-weight: bold; margin-bottom: 5px;">学生情報</legend>

            <input type="text" name="studentNo" placeholder="学生番号を入力してください" style="width: 200px; padding: 5px;" />

            <button type="submit" style="margin-left: 10px; padding: 5px 10px;">検索</button>
        </fieldset>
    </form>

    <p style="color: #33b5e5; font-size: 13px; margin-top: 10px;">
        学生番号を入力して検索ボタンをクリックしてください
    </p>

</div>

<jsp:include page="/main/footer.jsp" />

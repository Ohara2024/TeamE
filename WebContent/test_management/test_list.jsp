<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/main/header.jsp"></jsp:include>
<jsp:include page="/main/side_menu.jsp"></jsp:include>
<div class="main">
    <p>データを更新する学生を選んでください</p><br>
    <form action="/sms/testmanagement/list" method="post">
        <select name="id">
            <c:forEach var="s" items="${student_list }">
                学生名 :<option value="${s.student_id}">${s.student_name}</option><br>
            </c:forEach>
        </select>
        <input type="submit" value="送信">
    </form>

    </div>
<jsp:include page="/main/footer.jsp"></jsp:include>

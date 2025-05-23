<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/main/header.jsp" />
<jsp:include page="/main/side_menu.jsp" />

<div class="main">
    <h2 style="background-color:#d8e6f7; padding: 10px 20px;">科目別成績結果</h2>

    <!-- Hiển thị thông báo lỗi nếu có -->
    <c:if test="${not empty errorMessage}">
        <div style="color:red; margin: 15px 0; padding: 10px; background-color: #ffe6e6; border: 1px solid #ff9999; border-radius: 5px;">
            ${errorMessage}
        </div>
    </c:if>

    <!-- Form tìm kiếm -->
    <form method="post" action="${pageContext.request.contextPath}/testmanagement/subjectexe" style="margin: 20px 0; padding: 20px; background-color: #f9f9f9; border-radius: 8px;">
        <div style="display: flex; flex-wrap: wrap; gap: 15px; align-items: end;">
            <div>
                <label style="display: block; margin-bottom: 5px; font-weight: bold;">入学年度:</label>
                <select name="entranceYear" style="padding: 8px; border: 1px solid #ccc; border-radius: 4px; min-width: 120px;">
                    <option value="">選択してください</option>
                    <c:forEach var="year" items="${entYearSet}">
                        <option value="${year}" <c:if test="${year == selectedYear}">selected</c:if>>${year}</option>
                    </c:forEach>
                </select>
            </div>

            <div>
                <label style="display: block; margin-bottom: 5px; font-weight: bold;">クラス:</label>
                <select name="classNum" style="padding: 8px; border: 1px solid #ccc; border-radius: 4px; min-width: 120px;">
                    <option value="">選択してください</option>
                    <c:forEach var="cNum" items="${cNumlist}">
                        <option value="${cNum}" <c:if test="${cNum == selectedClass}">selected</c:if>>${cNum}</option>
                    </c:forEach>
                </select>
            </div>

            <div>
                <label style="display: block; margin-bottom: 5px; font-weight: bold;">科目:</label>
                <select name="subject" style="padding: 8px; border: 1px solid #ccc; border-radius: 4px; min-width: 150px;">
                    <option value="">選択してください</option>
                    <c:forEach var="subj" items="${list}">
                        <option value="${subj.cd}" <c:if test="${subj.cd == selectedSubject}">selected</c:if>>${subj.name}</option>
                    </c:forEach>
                </select>
            </div>

            <div>
                <label style="display: block; margin-bottom: 5px; font-weight: bold;">学生番号:</label>
                <input type="text" name="studentNo" value="${param.studentNo}" placeholder="学生番号を入力"
                       style="padding: 8px; border: 1px solid #ccc; border-radius: 4px; min-width: 150px;">
            </div>

            <div>
                <button type="submit" style="padding: 10px 25px; background-color: #007bff; color: white; border: none; border-radius: 4px; cursor: pointer; font-size: 14px;">
                    検索
                </button>
            </div>
        </div>

        <div style="margin-top: 15px; color: #666; font-size: 14px;">
            ※ 科目で検索する場合は科目を選択してください。学生番号で検索する場合は学生番号を入力してください。
        </div>
    </form>

    <!-- Hiển thị tên môn học được chọn -->
    <c:if test="${not empty subjectName}">
        <div style="margin: 20px 0; padding: 10px; background-color: #e8f4f8; border-left: 4px solid #007bff; border-radius: 4px;">
            <strong>選択された科目: ${subjectName}</strong>
        </div>
    </c:if>

    <!-- Kết quả tìm kiếm -->
    <c:choose>
    <c:when test="${not empty resultList}">
        <table border="1" cellpadding="12" cellspacing="0" style="border-collapse: collapse; width: 100%; min-width: 800px;">
            <thead>
                <tr>
                    <th>入学年度</th>
                    <th>クラス</th>
                    <th>学生番号</th>
                    <th>学生名</th>
                    <th>成績</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="item" items="${resultList}" varStatus="status">
                    <tr style="<c:if test='${status.index % 2 == 1}'>background-color: #f8f9fa;</c:if>">
                        <td><c:out value="${item.entYear}" /></td>
                        <td><c:out value="${item.classNum}" /></td>
                        <td><c:out value="${item.studentNo}" /></td>
                        <td><c:out value="${item.studentName}" /></td>
                        <td>
                            <c:choose>
                                <c:when test="${not empty item.points}">
                                    <div style="display: flex; flex-wrap: wrap; gap: 8px; padding: 5px;">
                                        <c:forEach var="entry" items="${item.points}">
                                            <span style="display: inline-block; padding: 4px 8px; background-color:
                                                <c:choose>
                                                    <c:when test='${entry.value >= 80}'>#d4edda</c:when>
                                                    <c:when test='${entry.value >= 60}'>#fff3cd</c:when>
                                                    <c:otherwise>#f8d7da</c:otherwise>
                                                </c:choose>;
                                                color:
                                                <c:choose>
                                                    <c:when test='${entry.value >= 80}'>#155724</c:when>
                                                    <c:when test='${entry.value >= 60}'>#856404</c:when>
                                                    <c:otherwise>#721c24</c:otherwise>
                                                </c:choose>;
                                                border-radius: 4px; font-size: 13px; font-weight: bold;">
                                                第${entry.key}回: ${entry.value}点
                                            </span>
                                        </c:forEach>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <div style="text-align: center; color: #6c757d; font-style: italic;">
                                        未受験
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:when>
    <c:otherwise>
        <p style="color:red;">該当する成績データが見つかりませんでした。</p>
    </c:otherwise>
</c:choose>


    <!-- ナビゲーション -->
    <div style="margin-top: 40px; text-align: center; border-top: 1px solid #eee; padding-top: 20px;">
        <a href="${pageContext.request.contextPath}/testmanagement/list"
           style="display: inline-block; padding: 12px 30px; background-color: #6c757d; color: white; text-decoration: none; border-radius: 6px; font-weight: bold; transition: background-color 0.3s;">
            ← 検索画面に戻る
        </a>
    </div>
</div>

<style>
    .main {
        padding: 20px;
        max-width: 1200px;
        margin: 0 auto;
    }

    button:hover {
        background-color: #0056b3 !important;
        transform: translateY(-1px);
        transition: all 0.2s;
    }

    a:hover {
        background-color: #5a6268 !important;
        transform: translateY(-1px);
        transition: all 0.2s;
    }

    select:focus, input:focus {
        outline: none;
        border-color: #007bff;
        box-shadow: 0 0 0 2px rgba(0,123,255,0.25);
    }
</style>

<jsp:include page="/main/footer.jsp" />
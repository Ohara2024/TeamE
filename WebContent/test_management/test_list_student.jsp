<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/main/header.jsp" />
<jsp:include page="/main/side_menu.jsp" />

<div class="main">
    <h2 style="background-color:#d8e6f7; padding: 10px 20px;">学生別成績結果</h2>

    <!-- エラーメッセージの表示 -->
    <c:if test="${not empty errorMessage}">
        <div style="color:red; margin: 15px 0; padding: 10px; background-color: #ffe6e6; border: 1px solid #ff9999; border-radius: 5px;">
            ${errorMessage}
        </div>
    </c:if>

    <!-- 入学年度・クラス・科目での検索 -->
    <form id="searchForm1" method="post" action="${pageContext.request.contextPath}/testmanagement/subjectexe"
          style="margin: 20px 0; padding: 20px; background-color: #f9f9f9; border-radius: 8px;">
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
                <button type="submit" style="padding: 10px 25px; background-color: #007bff; color: white; border: none; border-radius: 4px; cursor: pointer; font-size: 14px;">
                    検索
                </button>
            </div>
        </div>

        <div style="margin-top: 15px; color: #666; font-size: 14px;">
            ※ 入学年度、クラス、科目を選択して検索してください。
        </div>
    </form>

    <!-- 学生番号での検索 -->
    <form id="searchForm2" method="post" action="${pageContext.request.contextPath}/testmanagement/studentexe"
          style="margin: 20px 0; padding: 20px; background-color: #f9f9f9; border-radius: 8px;">
        <div style="display: flex; flex-wrap: wrap; gap: 15px; align-items: end;">
            <div>
                <label style="display: block; margin-bottom: 5px; font-weight: bold;">学生番号:</label>
                <input type="text" name="f4" value="${f4}" placeholder="学生番号を入力"
                       style="padding: 8px; border: 1px solid #ccc; border-radius: 4px; min-width: 150px;">
            </div>

            <div>
                <button type="submit" style="padding: 10px 25px; background-color: #007bff; color: white; border: none; border-radius: 4px; cursor: pointer; font-size: 14px;">
                    検索
                </button>
            </div>
        </div>

        <div style="margin-top: 15px; color: #666; font-size: 14px;">
            ※ 学生番号を入力して検索してください。
        </div>
    </form>

    <!-- 学生情報の表示（修正済み） -->
    <c:if test="${not empty student}">
        <div style="margin: 20px 0; padding: 10px; background-color: #e8f4f8; border-left: 4px solid #007bff; border-radius: 4px;">
            <strong>学生番号: ${student.no}</strong><br>
            <strong>学生名: ${student.name}</strong>
        </div>
    </c:if>

    <!-- 成績データの表示 -->
    <c:choose>
        <c:when test="${not empty tlslist}">
            <table border="1" cellpadding="12" cellspacing="0" style="border-collapse: collapse; width: 100%; min-width: 800px; font-family: 'Hiragino Kaku Gothic Pro', Meiryo, sans-serif;">
                <thead>
                    <tr style="background-color: #e9ecef;">
                        <th>科目名</th>
                        <th>科目コード</th>
                        <th>試験回数</th>
                        <th>最新の得点</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="item" items="${tlslist}" varStatus="status">
                        <tr style="<c:if test='${status.index % 2 == 1}'>background-color: #f8f9fa;</c:if>">
                            <td><c:out value="${item.subjectName}" /></td>
                            <td><c:out value="${item.subjectCd}" /></td>
                            <td><c:out value="${item.testNo}" /></td>
                            <td><c:out value="${item.point}" /></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:when>
        <c:otherwise>
            <p style="color:red;">該当する成績データが見つかりませんでした。</p>
        </c:otherwise>
    </c:choose>

    <!-- 戻るボタン -->
    <div style="margin-top: 40px; text-align: center; border-top: 1px solid #eee; padding-top: 20px;">
        <a href="${pageContext.request.contextPath}/test_management/test_list.jsp"
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
        font-family: 'Hiragino Kaku Gothic Pro', Meiryo, sans-serif;
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

<script>
    document.getElementById('searchForm2').addEventListener('submit', function(event) {
        var studentNo = document.querySelector('input[name="f4"]').value;
        if (!studentNo) {
            event.preventDefault();
            alert('学生番号を入力してください。');
        }
    });
</script>

<jsp:include page="/main/footer.jsp" />

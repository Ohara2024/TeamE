<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:include page="/main/header.jsp" />
<jsp:include page="/main/side_menu.jsp" />
<style>
  .main-menu {
    padding: 15px;
    background-color: #f5f5f5;
  }
  .main-menu h2 {
    background-color: #eee;
    padding: 8px 10px;
    border-radius: 3px;
    margin-bottom: 20px;
  }
  .menu-boxes {
    display: flex;
    gap: 15px;
  }
  .box {
    flex: 1;
    border-radius: 8px;
    box-shadow: 1px 2px 5px #bbb;
    padding: 30px 20px;
    font-size: 18px;
  }
  .box.student {
    background-color: #d4a8a8;
  }
  .box.score {
    background-color: #c2e0c6;
  }
  .box.subject {
    background-color: #b5b8dc;
  }
  .box a {
    color: #0044cc;
    text-decoration: underline;
    font-size: 18px;
  }
  .box p {
    margin: 0 0 10px 0;
  }
</style>

<div class="main-menu">
  <h2>メニュー</h2>
  <div class="menu-boxes">
    <div class="box student">
      <a href="StudentManagement.action">学生管理</a>
    </div>
    <div class="box score">
      <p>成績管理</p>
      <a href="ScoreRegister.action">成績登録</a><br/>
      <a href="/TeamE/testmanagement/list">成績参照</a>
    </div>
    <div class="box subject">
      <a href="SubjectManagement.action">科目管理</a>
    </div>
  </div>
</div>
<jsp:include page="/main/footer.jsp" />
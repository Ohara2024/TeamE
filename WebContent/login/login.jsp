<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8" />
<title>ログイン</title>
<style>
    body { font-family: "メイリオ", Meiryo, sans-serif; }
    .login-form { max-width: 300px; margin: 60px auto; padding: 20px; border: 1px solid #ccc; border-radius: 6px; }
    label, input { display: block; width: 100%; margin-bottom: 10px; }
    input[type="submit"] { cursor: pointer; background-color: #007BFF; color: #fff; border: none; padding: 8px; }
    .error { color: red; margin-bottom: 10px; }
    .checkbox-container {
        display: flex;
        align-items: center;
        margin-bottom: 15px;
    }
    .checkbox-container input[type="checkbox"] {
        margin-right: 6px;
    }
</style>
<script>
    function togglePasswordVisibility() {
        var pwdInput = document.getElementById("password");
        var checkbox = document.getElementById("showPassword");
        if (checkbox.checked) {
            pwdInput.type = "text";
        } else {
            pwdInput.type = "password";
        }
    }
</script>
</head>
<body>
<div class="login-form">
    <h2>ログイン</h2>
    <form action="/TeamE/login/loginexe" method="post">
        <label for="id">教員ID:</label>
        <input type="text" name="id" id="id" required autofocus />

        <label for="password">パスワード:</label>
        <input type="password" name="password" id="password" required />

        <div class="checkbox-container">
            <input type="checkbox" id="showPassword" onclick="togglePasswordVisibility()" />
            <label for="showPassword">パスワード表示</label>
        </div>

        <input type="submit" value="ログイン" />
    </form>

    <% if (request.getAttribute("error") != null) { %>
        <div class="error"><%= request.getAttribute("error") %></div>
    <% } %>
</div>
</body>
</html>

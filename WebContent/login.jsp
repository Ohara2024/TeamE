<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>ログイン - 得点管理システム</title>
    <style>
        body {
            font-family: sans-serif;
            background-color: #f0f4f8;
            margin: 0;
            padding: 0;
            text-align: center;
        }

        .container {
            margin-top: 100px;
        }

        .login-box {
            display: inline-block;
            background: white;
            padding: 30px 40px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            text-align: left;
            width: 300px;
        }

        .login-box h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        .login-box label {
            display: block;
            margin-top: 15px;
            font-weight: bold;
        }

        .login-box input[type="text"],
        .login-box input[type="password"] {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            box-sizing: border-box;
        }

        .login-box .checkbox {
            margin-top: 10px;
        }

        .login-box input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin-top: 20px;
            background-color: #007bff;
            color: white;
            border: none;
            font-weight: bold;
            border-radius: 5px;
            cursor: pointer;
        }

        .error-msg {
            color: red;
            font-size: 0.9em;
            margin-top: 10px;
            text-align: center;
        }

        footer {
            margin-top: 50px;
            font-size: 0.9em;
            color: #666;
        }
    </style>
</head>
<body>

    <div class="container">
        <h1>得点管理システム</h1>

        <div class="login-box">
            <h2>ログイン</h2>

            <!-- エラーメッセージ表示 -->
            <div class="error-msg">
                <%= request.getAttribute("error") != null ? request.getAttribute("error") : "" %>
            </div>

            <form action="LoginExecute.action" method="post">
                <label for="id">ID</label>
                <input type="text" id="id" name="id" value="<%= request.getParameter("id") != null ? request.getParameter("id") : "" %>" />

                <label for="password">パスワード</label>
                <input type="password" id="password" name="password" />

                <div class="checkbox">
                    <input type="checkbox" id="chk_gps" onclick="togglePassword()" />
                    <label for="chk_gps">パスワードを表示</label>
                </div>

                <input type="submit" value="ログイン" name="log_in" />
            </form>
        </div>
    </div>

    <footer>
        &copy; 2025 TBC<br>高崎情報ITクリエイター専門学校
    </footer>

    <script>
        function togglePassword() {
            const pwField = document.getElementById("password");
            pwField.type = (pwField.type === "password") ? "text" : "password";
        }
    </script>

</body>
</html>

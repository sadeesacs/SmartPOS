<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Smart POS</title>
        <link rel="stylesheet" href="StyleSheet2.css" />

    </head>
    <body>
        <div class="login-container">
            <div class="Logo" style="left:115px;"><img src="images/icons/logo.png" /></div>
            <div class="logoname" style="left:180px;">Smart <span style="color:#5F4AE7">POS</span></div>
            <div class="login-text">
                Login
            </div>
            
            <div class="login-form">
                <form method="POST" action="">
                    <label for="username" >User Name</label>
                    <input type="text" id="username" name="username">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password">
                    <button type="login">Login</button>
                </form>
            </div>
            
        </div>
    </body>
</html>

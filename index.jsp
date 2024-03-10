<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>index</title>
    <link rel="stylesheet" href="./assets/css/auth.css">
</head>
<body>
    <div class="container__auth">
        <div class="container__auth--head">
            <div class="container__auth--head-logo">
                <h1>TASKER</h1>
            </div>
            <div class="container__auth--head-label">
                <h2>Welcome to Tasker !</h2>
                <p>Please sign-in to your account and start the adventure</p>
            </div>
            <div class="error">
                <% 
                    String error = "";
                    if(request.getAttribute("error") != null)error = (String)request.getAttribute("error");
                %>
                <p><%= error %></p>
            </div>
        </div>
        <div class="container__auth--content">
            <form action="Authentification"method="POST">
                <div class="container__auth--content-input">
                    <label for="input_username">Username</label>
                    <input type="text"name="username"placeholder="Enter your username"id="input_username"required>
                </div>
                <div class="container__auth--content-input">
                    <label for="input_password">Password</label>
                    <input type="password"name="password"placeholder="**********"id="input_password"required>
                </div>
                <div class="container__auth--content-btn">
                    <button type="submit">Sign In</button>
                </div>
                <input type="hidden"name="mode"value="auth">
            </form>
            <div class="container__auth--content-links">
                <p>New on our plateform ? Please <a href="inscription.html">Sign Up</a></p>
                <a href="#">Forgot your password ?</a>
            </div>
        </div>
    </div>
</body>
</html>
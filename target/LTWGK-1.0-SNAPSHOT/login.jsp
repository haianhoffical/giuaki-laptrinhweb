<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Account</title>
    <link href="css/style.css" rel="stylesheet" type="text/css"/>
</head>
<body>
    <div class="container">
        <img class="avatar" src="img/laclac.png">
        <form action="LoginServlet" method="post">
            <h1>Login Account</h1>
            
            <div class="form-group">
                <label for="username">Username</label>
                <input type="text" name="name" placeholder="Enter username" required>
            </div>
            
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" name="password" placeholder="Enter password" required>
            </div>
            
            <input type="submit" value="Login">
            <br><br>
            <a href="#">Forget Password?</a><br/>
            <a href="registration.jsp">Create New Account</a>
        </form>
    </div>
</body>
</html>
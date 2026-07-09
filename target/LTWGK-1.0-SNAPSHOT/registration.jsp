<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Form Validator</title>
    <link href="css/style.css" rel="stylesheet" type="text/css"/>
</head>
<body>
    <div class="container">
        <img class="avatar" src="img/laclac.png">
        <form action="RegisterServlet" method="post">
            <h1>Register</h1>
            
            <div class="form-group">
                <label for="username">Username</label>
                <input type="text" name="name" placeholder="Enter username" required>
            </div>
            
            <div class="form-group">
                <label for="email">Email</label>
                <input type="text" name="email" placeholder="Enter email" required>
            </div>
            
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" name="password" placeholder="Enter password" required>
            </div>
            
            <div class="form-group">
                <label for="confirmPassword">Confirm Password</label>
                <input type="password" name="confirmPassword" placeholder="Confirm Password" required>
            </div>
            
            <input type="submit" value="Register">
            <br><br>
            <a href="login.jsp">Already have Account?</a>
        </form>
    </div>
</body>
</html>
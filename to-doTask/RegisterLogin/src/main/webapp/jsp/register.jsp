<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration</title>
<!-- Bootstrap CSS -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<style>
/* Custom styles for this page */
body {
    background-color: #f8f9fa;
    margin: 0;
    padding: 0;
    font-family: Arial, sans-serif;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
     overflow: hidden;
}

.container {
    display: flex;
    max-width: 800px;
}

.image-container {
    flex: 1;
    overflow: hidden;
    border-top-left-radius: 10px;
    border-bottom-left-radius: 10px;
    filter: grayscale(0%);
        }
        .image-container:hover{
    /* opacity: 70%; */
    transform:scale(1.03) ;
    cursor: pointer;
    filter: drop-shadow(0 0 10px #333);
    transition: 1.1s;
}
 .image-container:hover img{
    filter: grayscale(100%);

}

.image-container img {
    width: 78%;
    height: 100vh;
    object-fit: cover;
}

.form-container {
    flex: 1;
    display: flex;
    flex-direction: column;
    margin-right: 7%;
    justify-content: space-around;
    padding: 20px;
     width: 50%;
    max-width: 400px;
    background-color: #fff;
    border-radius: 10px;
    box-shadow: 0px 0px 20px 0px rgba(0, 0, 0, 0.1);
}

.register-form h2 {
    margin: 0 0 15px;
    text-align: center;
}

.form-group {
    margin-bottom: 15px;
}

.form-control, .btn {
    min-height: 38px;
    border-radius: 2px;
    border: 1px solid #ced4da;
    padding: 5px 10px;
    font-size: 15px;
}

 .btn {
    font-weight: bold;
    background-color: purple;
    color: #fff;
    cursor: pointer;
    transition: background-color 0.3s ease; /* Add transition for smooth color change */
}

.btn:hover {
    background-color: #6f42c1; /* Change to a darker shade of purple on hover */
}
.alert {
    padding: 15px;
    margin-bottom: 20px;
    border: 1px solid transparent;
    border-radius: 4px;
    text-align: center;
}

.alert-success {
    color: #155724;
    background-color: #d4edda;
    border-color: #c3e6cb;
}

.alert-danger {
    color: #721c24;
    background-color: #f8d7da;
    border-color: #f5c6cb;
}
</style>
</head>
<body>


    <div class="image-container">
        <img src="/img/log3.jpg" alt="Login Image">
    </div>
    <div class="form-container">
        <form action="/register" method="post" class="register-form">
            <h2>Register</h2>
            <div class="form-group">
                <input type="text" name="firstName" class="form-control" placeholder="First Name" required="required">
            </div>
            <div class="form-group">
                <input type="text" name="lastName" class="form-control" placeholder="Last Name" required="required">
            </div>
            <div class="form-group">
                <input type="email" name="email" class="form-control" placeholder="Email" required="required">
            </div>
            <div class="form-group">
                <input type="password" name="password" class="form-control" placeholder="Password" required="required">
            </div>
            <div class="form-group">
                <button type="submit" class="btn btn-primary btn-block">Register</button>
            </div>
        </form>
        <% String message = request.getParameter("message"); if (message != null && !message.isEmpty()) { String alertClass = message.equals("success") ? "alert-success" : "alert-danger"; %>
        <div class="alert <%= alertClass %>">
            <%= message.equals("success") ? "Registration Successful!!!" : "Registration Failed. Please try again." %>
        </div>
        <% } %>
    </div>

</body>
</html>

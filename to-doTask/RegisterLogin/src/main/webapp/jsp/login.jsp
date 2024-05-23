<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>
<!-- Bootstrap CSS -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<style>
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
        .image-container img:before {
    content: ""; /* Required for pseudo-element */
    position: absolute; /* Position it absolutely */
    top: 0;
    left: 0;
    width: 70%;
    height: 100%;
    background: linear-gradient(to bottom, rgb(47 44 44 / 70%), rgb(55 50 50 / 90%)); /* Light gradient */
}
        

        .image-container img {
            width: 78%;
            height: 98%;
            object-fit: cover;
            
        }

        .form-container {
            flex: 1;
            display: flex;
            flex-direction: column;
            margin-right:7%;
            justify-content: space-around;
            padding: 20px;
             width: 50%;
            max-width: 400px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0px 0px 20px 0px rgba(0, 0, 0, 0.1);
        }

        .login-form h2 {
            margin: 0 0 15px;
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

</style>

</head>
<body>

    <div class="image-container">
        <img src="/img/log2.jpg" alt="Login Image">
    </div>
    <div class="form-container">
        <form action="/login" method="post" class="login-form">
            <h2 class="text-center">Login</h2>
            <div class="form-group">
                <input type="email" name="email" class="form-control"
                       placeholder="Email" required="required">
            </div>
            <div class="form-group">
                <input type="password" name="password" class="form-control"
                       placeholder="Password" required="required">
            </div>
            <div class="form-group">
                <button type="submit" class="btn btn-primary btn-block">Sign in</button>
            </div>
        </form>
    </div>


</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
<!-- Bootstrap CSS -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<style>
/* Custom styles for this page */
body {
    background-image: url('/img/home2.png');
    background-size: cover;
    background-position: center;
    background-repeat: no-repeat;
    height: 100vh; /* Make the body fill the viewport height */
    margin: 0; /* Remove default margin */
    display: flex;
    align-items: center;
    justify-content: center;
    font-family: Arial, sans-serif;
   
}

.home-container {
    width: 50%;
    text-align: center;
     color: white;/* Ensure text is readable on top of the background image */
}

h1 {
    font-size: 2.5rem;
    margin-bottom: 30px;
    colour:black;
    z-index:1;
     font-weight: bold;
}

.btn {
    margin: 10px;
    font-size: 20px;
    font-weight: bold;
    padding: 10px 20px;
    border-radius: 5px;
    text-transform: uppercase;
}

.btn-primary {
    background-color: #007bff; /* Bootstrap primary color */
    border-color: #007bff; /* Bootstrap primary color */
}

.btn-primary:hover {
    background-color: #0056b3; /* Darken the color on hover */
    border-color: #0056b3; /* Darken the color on hover */
}

.btn-success {
    background-color: #28a745; /* Bootstrap success color */
    border-color: #28a745; /* Bootstrap success color */
}

.btn-success:hover {
    background-color: #218838; /* Darken the color on hover */
    border-color: #218838; /* Darken the color on hover */
}

 .text-container {
           color: rgba(255, 255, 255, 0.6);
            font-size: 20px;
           margin-bottom:10px;
        }
        
        .test{
        height:10px;
        margin-bottom:30px;
        padding:10px auto;
          colour:white;
        }
</style>
</head>
<body>

<div class="home-container">
    <h1>Welcome to Your Daily Task List</h1>
    <div class="test">
    <div class="text-container" id="text-container"></div>
    </div>
    <a href="login" class="btn btn-primary">Login</a>
    <a href="register" class="btn btn-success">Register</a>
</div>
<script>
    // Define your text array
    var texts = ["Don't count the days, make the days count.", "Every day is a new beginning. Take a deep breath and start again." , "The secret of getting ahead is getting started.", "Motivation is what gets you started. Habit is what keeps you going."];
    
    // Set initial index and text container element
    var index = 0;
    var textContainer = document.getElementById('text-container');
    
    // Function to display text with typing effect
    function typeWriter() {
        if (index < texts.length) {
            var text = texts[index];
            var charIndex = 0;
            var typing = setInterval(function() {
                if (charIndex < text.length) {
                    textContainer.innerHTML += text.charAt(charIndex);
                    charIndex++;
                } else {
                    clearInterval(typing);
                    setTimeout(function() {
                        textContainer.innerHTML = ''; // Clear the text
                        index = (index + 1) % texts.length; // Move to the next text
                        typeWriter(); // Call the function recursively
                    }, 1000); // Delay before starting the next text
                }
            }, 30); // Typing speed
        }
    }
    
    // Start the typing effect after a delay
    setTimeout(typeWriter, 5000);
</script>
<script>
        window.onload = function() {
            setTimeout(changeBackground, 3000); // Change background after 3 seconds
        };

        // Array of background image URLs
        var backgroundImages = ['/img/home2.png', '/img/home.png', '/img/home3.png'];
        var currentIndex = 0;

        function changeBackground() {
            // Change background image
            document.body.style.backgroundImage = "url('" + backgroundImages[currentIndex] + "')";

            // Increment index or reset to 0 if it exceeds the array length
            currentIndex = (currentIndex + 1) % backgroundImages.length;

            // Call the function again after 3 seconds for the next background change
            setTimeout(changeBackground, 3000);
        }
    </script>
</body>

</html>
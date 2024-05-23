<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>To-Do List</title>
	<link rel="stylesheet" type="text/css" href="/src/main/webapp/css/styles.css">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
	 <script src="https://kit.fontawesome.com/946b4a5fa9.js" crossorigin="anonymous"></script>
<style>

.todo-list {
    background-image: url('/img/tas.jpg');
    
    background-position: center;
    background-repeat: no-repeat;
    height: 30vh; /* 30% of the viewport height */
    position: relative; /* Ensure children are positioned relative to this element */
    top: 0%; /* Remove margin from the top */
    padding:0;
}


.todo-list:before {
    content: ""; /* Required for pseudo-element */
    position: absolute; /* Position it absolutely */
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: linear-gradient(to bottom, rgb(47 44 44 / 70%), rgb(55 50 50 / 90%)); /* Light gradient */
}

/* CSS for styling the form */
.form-popup {
    display: none;
    position: fixed;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    border: 2px solid #ccc;
    background-color: #f9f9f9; /* Light gray background */
    padding: 40px; /* Increase padding for space from top and bottom */
    border-radius: 15px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    max-height: 80vh; /* Adjust as needed */
    width: 70vw; /* Adjust as needed */
    overflow-y: auto; /* Add scrollbar if content exceeds max-height */
}

/* Adjustments for responsiveness */
@media screen and (max-width: 600px) {
    .form-popup {
        width: 85vw; /* Adjust width for smaller screens */
        max-height: 90vh; /* Adjust max height for smaller screens */
        padding: 20px; /* Adjust padding for space from top and bottom on smaller screens */
    }
}

/* Styling for form elements */
.form-popup h2 {
    margin-bottom: 20px;
    color: #333;
}

.form-container {
    width: 100%;
}

.form-group {
    margin-bottom: 20px;
}

.form-group label {
    display: block;
    margin-bottom: 5px;
    color: #555;
}

.form-control {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    transition: border-color 0.3s;
}

.form-control:focus {
    outline: none;
    border-color: #66afe9;
}

.button-container {
    text-align: center;
}

.cancel, .submit {
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}

.cancel {
    background-color: #ccc;
    color: #333;
}

.submit {
    background-color: #4CAF50; /* Green color for submit button */
    color: white;
    transition: background-color 0.3s; /* Smooth transition on hover */
}

.submit:hover {
    background-color: #45a049; /* Darker green color on hover */
}

/* Styling the scrollbar */
.form-popup::-webkit-scrollbar {
    width: 10px; /* Width of the scrollbar */
}

.form-popup::-webkit-scrollbar-thumb {
    background-color: #888; /* Color of the scrollbar thumb */
    border-radius: 10px; /* Rounded corners */
}

.form-popup::-webkit-scrollbar-thumb:hover {
    background-color: #555; /* Darker color on hover */
}

/* End of CSS */
body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f2f2f2; /* Set background color */
        }

        /* Center content */
       .counts {
    justify-content: center;
    align-items: center;
    min-height: 100vh;
}

table {
    width: 80%;
    margin: 15px auto; /* Center the table horizontally */
    border-collapse: collapse;
    background-color: white; /* Table background color */
    border-radius: 10px; /* Table border radius */
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* Table box shadow */
}

        /* Styling for table header */
        th {
            background-color: #f2f2f2;
            color: #333;
            font-weight: bold;
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd; /* Bottom border */
        }

        /* Styling for table rows */
        td {
            padding: 10px;
            border-bottom: 1px solid #ddd; /* Bottom border */
        }

        /* Styling for even rows */
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }


        /* Styling for add task button */
        h1 {
            text-align: center;
            margin-top: 22px; /* Top and bottom margin */
            color: #333;
            font-size: 24px; /* Adjust font size */
            text-transform: uppercase; /* Uppercase text */
        }

        
        /* Popup container */
    .popup-container {
        display: none; /* Hide the popup by default */
        position: fixed;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        background-color: #fff;
        border: 1px solid #ccc;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        z-index: 9999; /* Ensure it appears on top of other content */
        text-align: center;
    }

    
    /* Close button */
    .close-btn {
        position: absolute;
        top: 10px;
        right: 10px;
        cursor: pointer;
    }

    /* Profile name */
    .profile-name {
        font-size: 24px;
        font-weight: bold;
        margin-bottom: 10px;
    }

    /* Profile email */
    .profile-email {
        font-size: 16px;
        color: #666;
    }
       .add-task-btn {
    background-color: purple;
    color: white;
    width:700px;
    border: none;
    padding: 5px 15px;
    border-radius: 5px;
    cursor: pointer;
    margin-top:10px;
    margin-left:-95px;
      align-items: center;
    justify-content:center;
   
}
.icon-btn {
    background: none;
    border: none;
    padding: 0;
    cursor: pointer;
}
       .action-icons {
    display: flex;
    justify-content: space-between;
    align-items: center;
}
  .btn {
    font-weight: bold;
    background-color: purple;
    color: #fff;
    cursor: pointer;
    transition: background-color 0.3s ease; /* Add transition for smooth color change */
}

.btn:hover {
    background-color: #6f42c1;
    }
   

.logout-container {
    margin-top: 20px; /* Adjust as needed */
    align-items: center;
    justify-content:space-around;
    margin-left:45%;
}

</style>
</head>
<body>


<div class="todo-list" style="margin-top: 0;">
<div class="popup-container" id="welcomePopup">
   
        <span class="close-btn" onclick="closePopup()">&times;</span>
       <div class="profile-name text-center">WELCOME, ${user.firstName} !!</div>
        <div class="profile-email text-center">${user.email}</div>
        <p>Have a good day!</p>   
</div>
</div>
    <div class="container" >
        <div class="row">
            <div class="col-md-6 mx-auto">
              <h1>Task Manager</h1>
                <button class="add-task-btn"  onclick="openForm()">Add Task</button>
                <!-- The pop-up form -->
                <div class="form-popup form-popups" id="myForm">
                    <h2 class="mb-4">Add Task</h2>
                    <form id="createTaskForm" action="/tasks" method="post" class="form-container">
                        <input type="hidden" id="userId" name="userId" value="${userId}">
                        <div class="form-group">
                            <label for="taskName">Task Name:</label>
                            <input type="text" id="taskName" name="taskName" class="form-control">
                        </div>
                        <div class="form-group">
                            <label for="description">Description:</label>
                            <textarea id="description" name="description" class="form-control"></textarea>
                        </div>
                        <div class="form-group">
                            <label for="dueDate">Due Date:</label>
                            <input type="date" id="dueDate" name="dueDate" pattern="\d{2}-\d{2}-\d{4}" class="form-control">
                        </div>
                        <div class="form-group">
                            <label for="priority">Priority:</label>
                            <input type="number" id="priority" name="priority" class="form-control">
                        </div>
                        <div class="form-group">
                            <label for="status">Status:</label>
                            <input type="text" id="status" name="status" class="form-control">
                        </div>
                        <button type="button" class="cancel" onclick="closeForm()">Close</button>
                        <button type="submit" class="submit btn">Create Task</button>
                    </form>
                    <div id="errorMessage" class="mt-3"></div>
                </div>
            </div>
        </div>
<div class="counts">
    <table>
        <thead>
            <tr>
                <th>Task Name</th>
                <th>Description</th>
                <th>Due Date</th>
                <th>Priority</th>
                <th>Status</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${tasks}" var="task">
                <tr>
                    
                    <td>${task.taskName}</td>
                    <td>${task.description}</td>
                    <td><fmt:formatDate value="${task.dueDate}" pattern="dd-MM-yyyy" /></td>
                    <td>${task.priority}</td>
                    <td>${task.status}</td>
                    <td class="action-icons">
                    
                         <button class="icon-btn" data-task-id="${id}" onclick="openForm2()">
        <i class="fa-solid fa-pen-to-square" style="color: purple;"></i>
    </button>
    <!-- Delete button -->
    <form id="deleteForm" action="/tasks/{id}" method="post" style="display: inline;">
        <input type="hidden" id="taskId" name="id">
        <button type="button" class="icon-btn" onclick="confirmDelete('${task.id}')">
            <i class="fa-solid fa-trash" style="color: red;"></i>
        </button>
    </form>
    </td>
                 
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <button type="submit" class="submit btn logout-container" onclick="logout()">Log Out</button>
    </div>
</div>
    

<div class="form-popup form-popups" id="myForm2">
    <h2 class="mb-4">Edit Task</h2>
    <form id="editTaskForm" action="/update" method="post" modelAttribute="todo" class="form-container">     
         <div class="form-group">
            <label for="taskName">Task Name:</label>
            <input type="text" id="taskName" name="taskName" class="form-control">
        </div>
        <div class="form-group">
            <label for="description">Description:</label>
            <textarea id="description" name="description" class="form-control"></textarea>
        </div>
        <div class="form-group">
            <label for="dueDate">Due Date:</label>
            <input type="date" id="dueDate" name="dueDate" pattern="\d{2}-\d{2}-\d{4}" class="form-control">
        </div>
        <div class="form-group">
            <label for="priority">Priority:</label>
            <input type="number" id="priority" name="priority" class="form-control">
        </div>
        <div class="form-group">
            <label for="status">Status:</label>
            <input type="text" id="status" name="status" class="form-control">
        </div>
        <button type="button" class="cancel" onclick="closeForm2()">Close</button>
        <button type="submit" id="update" class="submit">Update Task</button>
    </form>
    <div id="errorMessage" class="mt-3"></div>
</div>


	<!-- Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
		
		
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		
		
		
 
	<script>
		$(document)
				.ready(
						function() {
							$('#createTaskForm')
									.submit(
											function(event) {
												event.preventDefault();
												var userId = $('#userId').val(); // Get the userId from the hidden input field
												console.log($('#userId').val());
												var formData = $(this)
														.serialize(); // Serialize the form data
												formData += '&userId=' + userId; // Append userId to the serialized form data
												$
														.ajax({
															type : 'POST',
															url : '/tasks',
															data : formData,
															success : function(
																	response) {
																window.location.href = "/tasks";
																submitno();
															},
															error : function(
																	xhr,
																	status,
																	error) {
																$(
																		'#errorMessage')
																		.text(
																				"Failed to create task. Please try again.");
															}
														});
											});
						});
	</script>
	<script type="text/javascript">
		let curr = 1;

		function submitno() {
			// Find the current serial number element
			const serialNumberElem = document.querySelector('.serialNumber');

			// Update the serial number
			if (serialNumberElem) {
				serialNumberElem.textContent = curr++; // Update and increment the current serial number
			}
		}
	</script>

	<script>
    function openForm() {
        document.getElementById("userId").value = "${userId}";
        document.getElementById("myForm").style.display = "block";
    }

    function closeForm() {
        document.getElementById("myForm").style.display = "none";
    }
</script>
	<script>
		function openForm2() {
			document.getElementById("taskId").value = "${id}";
			document.getElementById("myForm2").style.display = "block";
		}

		function closeForm2() {
			document.getElementById("myForm2").style.display = "none";
		}
	</script>
	<script type="text/javascript">
	function confirmDelete(id) {
	    if (confirm("Are you sure you want to delete this task?")) {
	        deleteTask(id);
	    } else {
	        // User clicked cancel, do nothing
	    }
	}

	function deleteTask(id) {
	    $.ajax({
	        url: '/tasks/' + id, // Concatenate id to the URL
	        type: "Post",
	        success: function(result) {
	            // Refresh task list after deletion
	            alert("Successfully deleted");
	            // Reload the page to reflect changes
	           location.reload(true);
	        },
	        error: function(xhr, status, error) {
	            console.error("Failed to delete task:", error);
	        }
	    });
	}

	</script>
	<script>
    var popupShown = false; // Flag to track if popup has been shown

    // Function to show the popup
    function showPopup() {
        if (!popupShown) {
            document.getElementById('welcomePopup').style.display = 'block';
            popupShown = true; // Update flag to indicate popup has been shown
        }
    }

    // Function to close the popup
    function closePopup() {
        document.getElementById('welcomePopup').style.display = 'none';
    }

    function logout(){
    	if(confirm("Are you sure you want to Log Out ?")){
    		 window.location.href = '/login';
    	}
    	else{
    	console.log("i am here");
    	}
    }
  
</script>
<script>
function setEditData(taskId,taskName,description,dueDate ,priority,status)
{
	$('#taskName').val(taskName);
	$('#description').val(description);
	$('#dueDate').val(dueDate);
	$('#priority').val(priority);
	$('#status').val(status);
	$('#taskId').val(taskId);
	
	
}
</script>

<script>
        function logout() {
            var confirmLogout = confirm("Are you sure you want to logout?");
            if (confirmLogout) {
                // Redirect to the login page
                window.location.href = "/login";
            } else {
                // Do nothing or close the confirmation message
            }
        }
    </script>
</body>
</html>

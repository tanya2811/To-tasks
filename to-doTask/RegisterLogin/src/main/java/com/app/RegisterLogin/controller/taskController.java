package com.app.RegisterLogin.controller;


import java.sql.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.app.RegisterLogin.entity.User;
import com.app.RegisterLogin.entity.Task;
import com.app.RegisterLogin.repository.TaskRepository;
import com.app.RegisterLogin.repository.UserRepository;
import com.app.RegisterLogin.service.TaskService;
import jakarta.servlet.http.HttpSession;

@Controller
public class taskController {

    @Autowired
    private TaskService taskService;
    
    @Autowired
    private TaskRepository taskRepository;
    
    @Autowired
	private UserRepository userRepo;

  

    @GetMapping("/tasks")
    public String showTasks(Model model, HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user != null) {
            List<Task> tasks = taskRepository.findByUserId(user.getId());
            model.addAttribute("tasks", tasks);
            return "tasks"; // Return the tasks view name
        } else {
            return "redirect:/login"; // Redirect to login page if user is not logged in
        }
    }

    @PostMapping("/tasks")
    public String createTask(@RequestParam("taskName") String taskName,
                             @RequestParam("description") String description,
                             @RequestParam("dueDate") Date dueDate,
                             @RequestParam("priority") int priority,
                             @RequestParam("status") String status,
                             HttpSession session,
                             RedirectAttributes redirectAttributes) {
        User user = (User) session.getAttribute("user");
        if (user != null) {
            Task task = new Task();
            task.setTaskName(taskName);
            task.setDescription(description);
            task.setDueDate(dueDate);
            task.setPriority(priority);
            task.setStatus(status);
            task.setUserId(user);
            taskService.createTask(task);
            return "redirect:/tasks"; // Redirect to tasks page after task creation
        } else {
            return "redirect:/login"; // Redirect to login page if user is not logged in
        }
    }
    

    
//    @PostMapping("/update/{id}")
//    public String updateTasks(@PathVariable("id") Long id,
//                             @RequestParam("taskName") String taskName,
//                             @RequestParam("description") String description,
//                             @RequestParam("dueDate") Date dueDate,
//                             @RequestParam("priority") int priority,
//                             @RequestParam("status") String status,
//                             HttpSession session) {
//        User user = (User) session.getAttribute("user");
//        if (user != null) {
//            Task task = taskService.getTaskById(id);
//            if (task != null && task.getUserId().getId().equals(user.getId())) {
//                task.setTaskName(taskName);
//                task.setDescription(description);
//                task.setDueDate(dueDate);
//                task.setPriority(priority);
//                task.setStatus(status);
//                taskService.updateTasks(task);
//            }
//            return "redirect:/tasks"; // Redirect to tasks page after task update
//        } else {
//            return "redirect:/login"; // Redirect to login page if user is not logged in
//        }
    
    

    @PostMapping("/tasks/{id}")
    public String deleteTask(@PathVariable("id") Long id,
                             HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user != null) {
            taskService.deleteTask(id);
            return "redirect:/tasks"; // Redirect to tasks page after task deletion
        } else {
            return "redirect:/login"; // Redirect to login page if user is not logged in
        }
    }
 
//    @PostMapping("/logout")
//    public String logout(HttpSession session) {	
//    	User user =(User) session.getAttribute("user");
//    	if(user != null)
//    		 return "redirect:/";
//    	else 
//    	 return "redirect:/login"; 
//    }
// 
    
    
 

    
}

    
    
  
    


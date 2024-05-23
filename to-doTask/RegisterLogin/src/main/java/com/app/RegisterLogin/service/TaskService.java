package com.app.RegisterLogin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.RegisterLogin.entity.Task;
import com.app.RegisterLogin.entity.User;
import com.app.RegisterLogin.repository.TaskRepository;
import com.app.RegisterLogin.repository.UserRepository;

import jakarta.transaction.Transactional;

import java.util.List;
import java.util.Optional;

@Service
public class TaskService {

    @Autowired
    private TaskRepository taskRepository;
    
    @Autowired
    private UserRepository userRepository;

    public List<Task> getAllTasks() {
        return taskRepository.findAll();
    }
   
    @Transactional
    public void createTask(Task task) {
        taskRepository.save(task);
    }

    public void deleteTask(Long id) {
        taskRepository.deleteById(id);
    }

   

    public List<Task> getAllTasksByUserId(Long userId) {
        return taskRepository.findByUserId(userId);
    }    

        public Task getTaskById(Long id) {
            return taskRepository.findById(id).orElse(null);
        }

    }

    
    
    
    
    
    
    
    

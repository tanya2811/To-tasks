package com.app.RegisterLogin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.RegisterLogin.entity.User;
import com.app.RegisterLogin.repository.UserRepository;

@Service
public class userService {

	 @Autowired
	    private  UserRepository userRepository;

	    public  User authenticate(String email, String password) {
	        User user = userRepository.findByEmailAndPassword(email, password);
	        return user;
	    }

}

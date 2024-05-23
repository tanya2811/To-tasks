package com.app.RegisterLogin.repository;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.app.RegisterLogin.entity.User;
import com.app.RegisterLogin.entity.Task;


public interface TaskRepository extends JpaRepository<Task, Long> {
	
	@Query("SELECT t FROM Task t WHERE t.userId.id = :userId")
	List<Task> findByUserId(@Param("userId") Long userId);

}

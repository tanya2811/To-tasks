package com.app.RegisterLogin.entity;

import java.util.Date;



import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "Task")
public class Task {
	    @Id
	    @GeneratedValue(strategy = GenerationType.IDENTITY)
	    private Long id;

	    @ManyToOne
	    @JoinColumn(name = "userid")
	    private User userId;
	    
	    @Column(name = "taskName")
	    private String taskName;

	    @Column(name = "description")
	    private String description;


		@Column(name = "due_date")
	    private Date dueDate;

	    @Column(name = "priority")
	    private int priority;

	    @Column(name = "status")
	    private String status;

	  

	    public Task(Long id, User userId, String taskName, String description, Date dueDate, int priority,
	    		String status) {
	    	super();
	    	this.id = id;
	    	this.userId = userId;
	    	this.taskName = taskName;
	    	this.description = description;
	    	this.dueDate = dueDate;
	    	this.priority = priority;
	    	this.status = status;
	    }



		public Task() {
			super();
			// TODO Auto-generated constructor stub
		}



		public Long getId() {
			return id;
		}



		public void setId(Long id) {
			this.id = id;
		}



		public User getUserId() {
			return userId;
		}



		public void setUserId(User userId) {
			this.userId = userId;
		}



		public String getTaskName() {
			return taskName;
		}



		public void setTaskName(String taskName) {
			this.taskName = taskName;
		}



		public String getDescription() {
			return description;
		}



		public void setDescription(String description) {
			this.description = description;
		}



		public Date getDueDate() {
			return dueDate;
		}



		public void setDueDate(Date dueDate) {
			this.dueDate = dueDate;
		}
		public int getPriority() {
			return priority;
		}
		public void setPriority(int priority) {
			this.priority = priority;
		}
		public String getStatus() {
			return status;
		}
		public void setStatus(String status) {
			this.status = status;
		}    
			}




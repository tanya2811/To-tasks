package com.app.RegisterLogin.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "users") // Specify the name of the table
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id") // Map the 'id' property to the 'id' column
    private Long id;

    @Column(name = "first_name") // Map the 'firstName' property to the 'first_name' column
    private String firstName;

    @Column(name = "last_name") // Map the 'lastName' property to the 'last_name' column
    private String lastName;

    @Column(name = "email") // Map the 'email' property to the 'email' column
    private String email;

    @Column(name = "password") // Map the 'password' property to the 'password' column
    private String password;
	    
	    
	    public User() {
			super();
		}

		public User(Long id, String firstName, String lastName, String email, String password) {
			super();
			this.id = id;
			this.firstName = firstName;
			this.lastName = lastName;
			this.email = email;
			this.password = password;
		}
	    
		public Long getId() {
			return id;
		}
		public void setId(Long id) {
			this.id = id;
		}
		public String getFirstName() {
			return firstName;
		}
		public void setFirstName(String firstName) {
			this.firstName = firstName;
		}
		public String getLastName() {
			return lastName;
		}
		public void setLastName(String lastName) {
			this.lastName = lastName;
		}
		public String getEmail() {
			return email;
		}
		public void setEmail(String email) {
			this.email = email;
		}
		public String getPassword() {
			return password;
		}
		public void setPassword(String password) {
			this.password = password;
		}

		@Override
		public String toString() {
			return "User [id=" + id + ", firstName=" + firstName + ", lastName=" + lastName + ", email=" + email
					+ ", password=" + password + "]";
		}

	
		
		
}

package com.tiy.ssa.exerciseWebApp.entity;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="userinfo")
public class Userinfo implements Serializable {

	 private static final long serialVersionUID = 1L;
	    @Id
		@GeneratedValue(strategy=GenerationType.IDENTITY)
		@Column(name="id")
		int id;
		
		@Column(name="firstname")
		String firstname;
		
		@Column(name="lastname")
		String lastname;
		
		@Column(name="username")
		String username;
		
		@Column(name="password")
		String password;
		


		public int getId() {
			return id;
		}


		public String getFirstname() {
			return firstname;
		}


		public String getLastname() {
			return lastname;
		}


		public String getUsername() {
			return username;
		}


		public String getPassword() {
			return password;
		}


		public void setId(int id) {
			this.id = id;
		}


		public void setFirstname(String firstname) {
			this.firstname = firstname;
		}


		public void setLastname(String lastname) {
			this.lastname = lastname;
		}


		public void setUsername(String username) {
			this.username = username;
		}


		public void setPassword(String password) {
			this.password = password;
		}


		public Userinfo() {
		
		}


		public Userinfo(String firstname, String lastname, String username, String password) {
			super();
			this.firstname = firstname;
			this.lastname = lastname;
			this.username = username;
			this.password = password;
		}

		
}

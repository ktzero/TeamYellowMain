package com.tiy.ssa.exerciseWebApp.entity;


import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="excercise")
public class Exercise implements Serializable {

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
		




		
}

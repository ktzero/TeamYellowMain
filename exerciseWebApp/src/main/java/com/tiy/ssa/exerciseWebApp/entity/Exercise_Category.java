package com.tiy.ssa.exerciseWebApp.entity;


import java.io.Serializable;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;


@Entity
@Table(name="exercise_category")
public class Exercise_Category implements Serializable {

	 private static final long serialVersionUID = 1L;
	    @Id
		@GeneratedValue(strategy=GenerationType.IDENTITY)
		@Column(name="id")
		int id;
		
		@Column(name="description")
		String description;
		
//		@OneToMany(mappedBy="category")
//		private Set<Exercise> exercise;

		public Exercise_Category(String description) {
			this.description = description;
		}
		
		public Exercise_Category() {
		}


		public int getId() {
			return id;
		}

		public String getDescription() {
			return description;
		}

		public void setId(int id) {
			this.id = id;
		}

		public void setDescription(String description) {
			this.description = description;
		}
		

		

		
}

package com.tiy.ssa.exerciseWebApp.entity;


import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


@Entity
@Table(name="exercise")
public class Exercise implements Serializable {

	 private static final long serialVersionUID = 1L;
	    @Id
		@GeneratedValue(strategy=GenerationType.IDENTITY)
		@Column(name="id")
		int id;
		
		@Column(name="exercise_name")
		String exercise_name;
		
		@Column(name="exercise_desc")
		String exercise_desc;
		
//		@ManyToOne
//		@JoinColumn(name="id")
//		private Exercise_Category category;
		
		@Column(name="category_id")
		Integer category_id;
		
		@Column(name="url")
		String url;
		
		public Exercise() {
		}
		
		
	
		public Exercise(String exercise_name, String exercise_desc, Integer category_id, String url) {
			super();
			this.exercise_name = exercise_name;
			this.exercise_desc = exercise_desc;
			this.category_id = category_id;
			this.url = url;
		}


		public Integer getCategory_id() {
			return category_id;
		}

		public void setCategory_id(Integer category_id) {
			this.category_id = category_id;
		}

		public int getId() {
			return id;
		}

		public String getExercise_name() {
			return exercise_name;
		}

		public String getExercise_desc() {
			return exercise_desc;
		}


		public String getUrl() {
			return url;
		}

		public void setExercise_name(String exercise_name) {
			this.exercise_name = exercise_name;
		}

		public void setExercise_desc(String exercise_desc) {
			this.exercise_desc = exercise_desc;
		}


		public void setUrl(String url) {
			this.url = url;
		}

		

		
}

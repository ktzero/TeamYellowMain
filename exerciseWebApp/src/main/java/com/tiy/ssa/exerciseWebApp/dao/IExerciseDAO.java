package com.tiy.ssa.exerciseWebApp.dao;

import java.util.List;

import com.tiy.ssa.exerciseWebApp.entity.Exercise;

public interface IExerciseDAO {

	Exercise getExerciseByName(String exName);
	List<Exercise> getExerciseListByCategory(Integer category_id);
	
	
}

package com.tiy.ssa.exerciseWebApp.service;

import java.util.List;

import com.tiy.ssa.exerciseWebApp.entity.Exercise;

public interface IExerciseService {
	
	Exercise getExerciseByName(String exName);
	List<Exercise> getExerciseListByCategory(Integer category_id);
	
}

package com.tiy.ssa.exerciseWebApp.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tiy.ssa.exerciseWebApp.entity.Exercise;
import com.tiy.ssa.exerciseWebApp.entity.Exercise_Tracking;
import com.tiy.ssa.exerciseWebApp.entity.Exercise_Tracking_Data;
import com.tiy.ssa.exerciseWebApp.entity.WeeklyProgress;
import com.tiy.ssa.exerciseWebApp.service.IExerciseService;
import com.tiy.ssa.exerciseWebApp.service.IExercise_CategoryService;
import com.tiy.ssa.exerciseWebApp.service.IExercise_TrackingService;
import com.tiy.ssa.exerciseWebApp.service.IUserinfoService;

@Controller
@RequestMapping("/")
@CrossOrigin
public class Exercise_TrackingController {

	
	@Autowired
	private IUserinfoService userinfoService;
	
	@Autowired
	private IExerciseService exerciseService;
	
	@Autowired
	private IExercise_CategoryService exercise_CategoryService;
	
	@Autowired
	private IExercise_TrackingService exrcise_TrackingService;
	
	// Create workout routine for the user 
    
    @RequestMapping(value="/exerciseTracking/{userid}/{intensity}", method = RequestMethod.POST)
    @ResponseBody
    @CrossOrigin
    public String createWorkoutRoutineForUser(@PathVariable("userid") String userid,@PathVariable("intensity") Integer intensity) {
    	String response ="Failure";
    	int noOfSets = 3;
    	int noOfReps = 10;
    	String dayno = " "; 
    	List<Exercise> exercise = exerciseService.getExerciseListByIntensity(intensity);
    	switch(intensity){
    	case 1: noOfSets = 2;
    	        noOfReps = 10;
    	        break;
    	case 2: noOfSets = 3;
    			noOfReps = 10;
    			break;
    	case 3: noOfSets = 4;
				noOfReps = 12;
				break;
    	}
    	HashMap<Integer,String> dayStr = new HashMap<Integer,String>();
    	dayStr.put(1, "One");
    	dayStr.put(2, "Two");
    	dayStr.put(3, "Three");
    	dayStr.put(4, "Four");
    	dayStr.put(5, "Five");
    	int week = 1;
    	//logic for creating routine for 4 weeks, 5 days a week workout routine 
    		for(int i=1;i < 21;i++){
    			for(Exercise ex : exercise){
    				  if (i>5 && i <=10) week =2;
	    			  if (i>10 && i <=15) week =3;
	    			  if (i>15 && i <=20) week =4;
    				int j = i % 5;
    				if (j==0) { j+=5;}
	    			 if(j == ex.getCategory_id() ) {
	    				 dayno = "Week" + dayStr.get(week) + "Day" + dayStr.get(j) ;
	    				 System.err.println(dayno);
		    			  Exercise_Tracking ex_trk = new Exercise_Tracking(userid,dayno,ex.getId(),noOfSets,noOfReps);
		    			  exrcise_TrackingService.insertWorkoutRoutine(ex_trk);
		    			  response = "Success";
		    			  
	    			 }
    			}
    		}
    	
    	return response;
    }
    
    
//Retrieve workout routine for a user 
    
    @RequestMapping(value="/exerciseTracking/{userid}", method = RequestMethod.POST)
    @ResponseBody
    @CrossOrigin
//    public ResponseEntity<List<Exercise_Tracking>> getWorkoutRoutineForUser(@PathVariable("userid") String userid) {
    public List<Exercise_Tracking_Data> getWorkoutRoutineForUser(@PathVariable("userid") String userid) {
    	String ex_name;
    	List<Exercise_Tracking_Data> ex_data = new ArrayList<>();
    	List<Exercise_Tracking> exTrack = exrcise_TrackingService.getWorkoutRoutineByUser(userid);
   // 	System.err.println("Ex id ="+exTrack.get(0).getExercise_id());
    	for(Exercise_Tracking ex : exTrack){
    		
    		Exercise exercise = exerciseService.getExerciseById(ex.getExercise_id());
   // 		System.err.println("Ex name ="+ exercise.getExercise_name());
    		
    		 ex_data.add(new Exercise_Tracking_Data(ex.getDayNo(),exercise.getExercise_name(),ex.getNumberOfSets(),
    						ex.getNumberOfReps(),ex.getTimeInMins(),ex.getTodays_date(),ex.isComplete()));
    		 
 //   		 System.err.println("Ex name again ="+ ex_data.get(0).getEx_name());
    	}
    	 return ex_data;
    }
    
//Retrieve workout for the selected day for the given user
    @RequestMapping(value="/trackThisDay/{userid}/{dayno}", method = RequestMethod.POST)
    @ResponseBody
    @CrossOrigin
    public List<Exercise_Tracking_Data> getWorkoutRoutineForUserByDay(@PathVariable("userid") String userid,@PathVariable("dayno") String dayno) {
    	String ex_name;
    	List<Exercise_Tracking_Data> ex_data = new ArrayList<>();
    	List<Exercise_Tracking> exTrack = exrcise_TrackingService.getWorkoutRoutineByUserByDay(userid,dayno);
//    	System.err.println("Ex id ="+exTrack.get(0).getExercise_id());
    	for(Exercise_Tracking ex : exTrack){
    		
    		Exercise exercise = exerciseService.getExerciseById(ex.getExercise_id());
//    		System.err.println("Ex name ="+ exercise.getExercise_name());
    		
    		 ex_data.add(new Exercise_Tracking_Data(ex.getDayNo(),exercise.getExercise_name(),ex.getNumberOfSets(),
    						ex.getNumberOfReps(),ex.getTimeInMins(),ex.getTodays_date(),ex.isComplete()));
    		 
//    		 System.err.println("Ex name again ="+ ex_data.get(0).getEx_name());
    	}
    	 return ex_data;
    }
    
    @RequestMapping(value="/updateThisDay/{userid}/{dayno}/{ex_name}/{complete}", method = RequestMethod.POST)
    @ResponseBody
    @CrossOrigin
    public boolean updateWorkoutRoutineForUserByDay(@PathVariable("userid") String userid,@PathVariable("dayno") String dayno,@PathVariable("ex_name") String ex_name, @PathVariable("complete") boolean complete) {
    	int ex_id;
    	boolean response = false;
    	Exercise exercise  = exerciseService.getExerciseByName(ex_name);
    	List<Exercise_Tracking> exTrack = new ArrayList<>();
    	exTrack = exrcise_TrackingService.getWorkoutRoutineByUserByDay(userid, dayno);
    	for(Exercise_Tracking ex : exTrack){
    	
    	 if (ex.getExercise_id() == exercise.getId()){
    		 ex.setComplete(complete);
    		 ex.setTodays_date(new Date());
    		response = exrcise_TrackingService.updateWorkoutRoutine(ex);
    		 
    	 }
//    	 	System.err.println("Ex id ="+exTrack.get(0).getExercise_id());
    	
    	}
    	 return response;
    }
    
 // Retrieve weekly progress for the given user
    @RequestMapping(value="/weeklyProgress/{userid}", method = RequestMethod.POST)
    @ResponseBody
    @CrossOrigin
    public List<WeeklyProgress> getWeeklyProgressForUser(@PathVariable("userid") String userid) {
    	String dayno;
    	int count=0, completeCount=0, oneVal=0;
    	int[] percent = {0,0,0,0,0};
    	List<WeeklyProgress> weekPr = new ArrayList<>();
    	HashMap<Integer,String> dayStr = new HashMap<Integer,String>();
    	dayStr.put(0, "One");
    	dayStr.put(1, "Two");
    	dayStr.put(2, "Three");
    	dayStr.put(3, "Four");
    	dayStr.put(4, "Five");
    	 
    	 for (int i=0; i<4;i++){
    		 for(int j=0;j<5;j++){
    			 dayno = "Week" + dayStr.get(i) + "Day" + dayStr.get(j) ;
    			 System.err.println("Dayno = "+dayno);
    			 List<Exercise_Tracking> exTrack = exrcise_TrackingService.getWorkoutRoutineByUserByDay(userid,dayno);
    			 percent[j]=0;
    			 count = 0;
    			 completeCount =0 ;
    			 	for(Exercise_Tracking ex : exTrack){
    		    		count++;
    		    		if (ex.isComplete()){
    		    			completeCount++;
    		    		}
    		    		 System.err.println("User id is ="+ ex.getUser_id());
    		    	}
    			 	if (count != 0){
	    			 	oneVal = 100 / count; 
	    			 	percent[j] = oneVal * completeCount;
    			 	}
    		 }
    		 WeeklyProgress week = new WeeklyProgress(percent[0],percent[1],percent[2],percent[3],percent[4]);
    		 weekPr.add(week);
    	 }
    	
    	
    	
    	 return weekPr;
    }
	
	
    @RequestMapping(value="/deleteRoutine/{userid}", method = RequestMethod.DELETE)
    @ResponseBody
    @CrossOrigin
    public boolean deleteWorkoutRoutineForUserByDay(@PathVariable("userid") String userid) {
    	boolean response = false;
    	response = exrcise_TrackingService.deleteWorkoutRoutine(userid);
    	
    	 return response;
    }
	
}

package com.tiy.ssa.exerciseWebApp.controller;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.core.env.Environment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.tiy.ssa.exerciseWebApp.entity.Exercise;
import com.tiy.ssa.exerciseWebApp.entity.Exercise_Category;
import com.tiy.ssa.exerciseWebApp.entity.Userinfo;
import com.tiy.ssa.exerciseWebApp.service.IExerciseService;
import com.tiy.ssa.exerciseWebApp.service.IExercise_CategoryService;
import com.tiy.ssa.exerciseWebApp.service.IUserinfoService;

@Controller
@RequestMapping("/")
@CrossOrigin
public class ExerciseController {

		@Autowired
		private IUserinfoService userinfoService;
		
		@Autowired
		private IExerciseService exerciseService;
		
		@Autowired
		private IExercise_CategoryService exercise_CategoryService;
		
		@Autowired
		private Environment env;
		    
	    @RequestMapping(value="/user/add/{fname}/{lname}/{username}/{pwd}", method = RequestMethod.POST)
	    @ResponseBody
	    @CrossOrigin
	    public String addUser(@PathVariable("fname") String fname, @PathVariable("lname") String lname,@PathVariable("username") String username,@PathVariable("pwd") String pwd) {
	    	Userinfo user = new Userinfo(fname,lname,username,pwd);
	        userinfoService.addUser(user);
	        String response = " User "+fname + " "+lname +" account created successfully";
	    //    return user;
	        return response;
	    }

	    @RequestMapping(value="/login/{username}/{pwd}", method = RequestMethod.POST)
	    @ResponseBody
	    @CrossOrigin
	    public String getUser(@PathVariable("username") String username,@PathVariable("pwd") String pwd) {
	    	Userinfo user =  userinfoService.getUserByUsername(username);
	    	String response = " ";
	    	if(user.getUsername().equals(username) && user.getPassword().equals(pwd)){
	    		 response = "User !! "+user.getFirstname() + "  "+user.getLastname() +" !! logged in successfully";
	    	}else{
//	    		System.out.println("First name = "+user.getFirstname());
//	    		System.out.println("Username = "+user.getUsername());
//	    		System.out.println("pwd = "+user.getPassword());
	    		response = "User ID and password dont match/ user does not exist ";
	    	}
	    		
	        return response;
	    }
		
	    
	    @RequestMapping(value="/exercise/{exCat}", method = RequestMethod.POST)
	    @ResponseBody
	    @CrossOrigin
	    public ResponseEntity<List<Exercise>> getExerciseList(@PathVariable("exCat") String exCat) {
	    	int cat_id;
	    	cat_id = exercise_CategoryService.getExerciseCategoryByDesc(exCat);
	    	List<Exercise> exercise = exerciseService.getExerciseListByCategory(cat_id);
	        return new ResponseEntity<List<Exercise>>(exercise, HttpStatus.OK);
	    }
	    
	    @RequestMapping(value="/exerciseCategories", method = RequestMethod.POST)
	    @ResponseBody
	    @CrossOrigin
	    public ResponseEntity<List<Exercise_Category>> getCategoriesList() {
//	      	System.err.println("Inside cat list");
	    	List<Exercise_Category> exerciseCat = exercise_CategoryService.getAllExerciseCategory();
//	    	System.err.println("Cat is  = "+exerciseCat.get(0).getDescription());
	        return new ResponseEntity<List<Exercise_Category>>(exerciseCat, HttpStatus.OK);
	    }
	    
	}

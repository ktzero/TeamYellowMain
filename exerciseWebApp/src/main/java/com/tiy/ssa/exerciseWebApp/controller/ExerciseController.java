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

import com.tiy.ssa.exerciseWebApp.entity.Userinfo;
import com.tiy.ssa.exerciseWebApp.service.IUserinfoService;

@Controller
@RequestMapping("/")
@CrossOrigin
public class ExerciseController {

		@Autowired
		private IUserinfoService exerciseService;
		
		@Autowired
		private Environment env;
		    
	    @RequestMapping(value="/user/add/{fname}/{lname}/{username}/{pwd}", method = RequestMethod.POST)
	    @ResponseBody
	    @CrossOrigin
	    public String addUser(@PathVariable("fname") String fname, @PathVariable("lname") String lname,@PathVariable("username") String username,@PathVariable("pwd") String pwd) {
	    	Userinfo user = new Userinfo(fname,lname,username,pwd);
	        exerciseService.addUser(user);
	        String response = " User "+fname + " "+lname +" account created successfully";
	    //    return user;
	        return response;
	    }

	    @RequestMapping(value="/login/{username}/{pwd}", method = RequestMethod.POST)
	    @ResponseBody
	    @CrossOrigin
	    public String getUser(@PathVariable("username") String username,@PathVariable("pwd") String pwd) {
	    	Userinfo user =  exerciseService.getUserByUsername(username);
	    	String response = " ";
	    	if(user.getUsername().equals(username) && user.getPassword().equals(pwd)){
	    		 response = "User "+user.getFirstname() + " "+user.getLastname() +" logged in successfully";
	    	}else{
//	    		System.out.println("First name = "+user.getFirstname());
//	    		System.out.println("Username = "+user.getUsername());
//	    		System.out.println("pwd = "+user.getPassword());
	    		response = "User ID and password dont match/ user does not exist ";
	    	}
	    		
	        return response;
	    }
		    
	}

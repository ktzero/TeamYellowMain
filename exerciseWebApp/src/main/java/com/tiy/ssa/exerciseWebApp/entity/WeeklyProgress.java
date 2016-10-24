package com.tiy.ssa.exerciseWebApp.entity;

public class WeeklyProgress {

	Integer day1;
	Integer day2;
	Integer day3;
	Integer day4;
	Integer day5;
	
	
	public WeeklyProgress(Integer day1, Integer day2, Integer day3, Integer day4, Integer day5) {
		super();
		this.day1 = day1;
		this.day2 = day2;
		this.day3 = day3;
		this.day4 = day4;
		this.day5 = day5;
	}
	public WeeklyProgress() {
	
	}
	public Integer getDay1() {
		return day1;
	}
	public Integer getDay2() {
		return day2;
	}
	public Integer getDay3() {
		return day3;
	}
	public Integer getDay4() {
		return day4;
	}
	public Integer getDay5() {
		return day5;
	}
	public void setDay1(Integer day1) {
		this.day1 = day1;
	}
	public void setDay2(Integer day2) {
		this.day2 = day2;
	}
	public void setDay3(Integer day3) {
		this.day3 = day3;
	}
	public void setDay4(Integer day4) {
		this.day4 = day4;
	}
	public void setDay5(Integer day5) {
		this.day5 = day5;
	}
	
	
	
}

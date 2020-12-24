package com.entities;

import java.util.Random;

import javax.persistence.Entity;
import javax.persistence.Id;
@Entity
public class Teachers {
	@Id
	public int id;
	public String teacher;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTeacher() {
		return teacher;
	}
	public void setTeacher(String teacher) {
		this.teacher = teacher;
	}
	
	public Teachers(String teacher) {
		super();
		this.id=new Random().nextInt(10000);
		this.teacher = teacher;
	}
	public Teachers() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	
	
}

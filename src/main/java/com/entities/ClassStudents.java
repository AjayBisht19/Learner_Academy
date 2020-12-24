package com.entities;

import java.util.Random;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class ClassStudents {
	@Id
	private int ClassId;
	private String class_;
	private String student;
	public int getClassId() {
		return ClassId;
	}
	public void setClassId(int classId) {
		ClassId = classId;
	}
	public String getClass_() {
		return class_;
	}
	public ClassStudents() {
		super();
		// TODO Auto-generated constructor stub
	}
	public void setClass_(String class_) {
		this.class_ = class_;
	}
	public String getStudent() {
		return student;
	}
	public void setStudent(String student) {
		this.student = student;
	}
	public ClassStudents( String class_, String student) {
		super();
		this.ClassId = new Random().nextInt(10000);
		this.class_ = class_;
		this.student = student;
	}
	
	

}

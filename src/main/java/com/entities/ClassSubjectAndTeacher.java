package com.entities;

import java.util.Random;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class ClassSubjectAndTeacher {
	@Id
	private int cstId;
	private String class_;
	private String subject;
	private String teacher;
	public ClassSubjectAndTeacher(String class_, String subject, String teacher) {
		super();
		
		this.cstId = new Random().nextInt(10000);
		this.class_ = class_;
		this.subject = subject;
		this.teacher = teacher;
	}
	public ClassSubjectAndTeacher() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getCstId() {
		return cstId;
	}
	public void setCstId(int cstId) {
		this.cstId = cstId;
	}
	public String getClass_() {
		return class_;
	}
	public void setClass_(String class_) {
		this.class_ = class_;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getTeacher() {
		return teacher;
	}
	public void setTeacher(String teacher) {
		this.teacher = teacher;
	}
	
	
	
	

}

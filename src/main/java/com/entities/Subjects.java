package com.entities;

import java.util.Random;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table
public class Subjects {
	@Id
	public int id;
	public String subject;

	public Subjects(String subject) {
		super();
		this.id=new Random().nextInt(10000);
		this.subject = subject;
	}
	public Subjects() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	
	
	

}

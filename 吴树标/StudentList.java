package entity;

import java.util.ArrayList;
import java.util.List;

public class StudentList {
	private List<Student> students = new ArrayList<Student>();
	private List<String> join_time = new ArrayList<String>();
	private String activity_name;
	
	public StudentList()
	{
		
	}
	public String getActivity_name() {
		return activity_name;
	}
	public void setActivity_name(String activity_name) {
		this.activity_name = activity_name;
	}
	public List<String> getJoin_time() {
		return join_time;
	}
	public void setJoin_time(List<String> join_time) {
		this.join_time = join_time;
	}
	public void addJoin_time(String s) {
		String temp = s;
		this.join_time.add(temp);
	}
	public List<Student> getStudents() {
		return students;
	}
	public void setStudents(List<Student> students) {
		this.students = students;
	}
	public void addStudents(Student s)
	{
		Student ns = new Student(s);
		students.add(ns);
	}
}

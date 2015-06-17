package entity;

public class MSo {
	private Student student = new Student();
	private String join_time;
	public MSo() {}
	public MSo(MSo mso) {
		this.setStudent(new Student(mso.getStudent()));
		this.setJoin_time(mso.getJoin_time());
	}
	public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
	}
	public String getJoin_time() {
		return join_time;
	}
	public void setJoin_time(String join_time) {
		this.join_time = join_time;
	}
	
	
}

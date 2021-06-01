package board.mboard.vo;

public class MemberVo {
	private String name;
	private String email;
	private String password;
	private String age;
	private String bio;
	private String job;
	private String inter;
	
	public MemberVo() {
		
	}
	
	public MemberVo(String name, String email, String password, String age, String bio, String job, String inter) {
		this.name = name;
		this.email = email;
		this.password = password;
		this.age = age;
		this.bio = bio;
		this.job = job;
		this.inter = inter;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getBio() {
		return bio;
	}
	public void setBio(String bio) {
		this.bio = bio;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public String getInter() {
		return inter;
	}
	public void setInter(String inter) {
		this.inter = inter;
	}
	
	@Override
	public String toString() {
		return "MemberVo [name=" + name + ", email=" + email + ", password=" + password + ", age=" + age + ", bio="
				+ bio + ", job=" + job + ", inter=" + inter + "]";
	}
	
}

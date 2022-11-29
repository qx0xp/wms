package pyr.mycompany.domain;

public class MemberDTO {
	// 아이디
	public String id;
	// 비밀번호
	public String password;
	// 이름
	public String name;
	// 부서명
	public String dept;
	// 연락처
	public String tel;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDept() {
		return dept;
	}
	public void setDept(String dept) {
		this.dept = dept;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	@Override
	public String toString() {
		return "MemberDTO [id=" + id + ", password=" + password + ", name=" + name + ", dept=" + dept + ", tel=" + tel
				+ "]";
	}
}

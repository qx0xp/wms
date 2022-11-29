package pyr.mycompany.domain;

public class ClientDTO {
	// 거래처코드
	public String client_id;
	// 거래처명
	public String client_name;
	// 거래처연락처
	public String client_tel;
	// 거래처담당자
	public String client_manager;
	// 글번호
	public int bno;
	
	public String getClient_id() {
		return client_id;
	}
	public void setClient_id(String client_id) {
		this.client_id = client_id;
	}
	public String getClient_name() {
		return client_name;
	}
	public void setClient_name(String client_name) {
		this.client_name = client_name;
	}
	public String getClient_tel() {
		return client_tel;
	}
	public void setClient_tel(String client_tel) {
		this.client_tel = client_tel;
	}
	public String getClient_manager() {
		return client_manager;
	}
	public void setClient_manager(String client_manager) {
		this.client_manager = client_manager;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	@Override
	public String toString() {
		return "ClientDTO [client_id=" + client_id + ", client_name=" + client_name + ", client_tel=" + client_tel
				+ ", client_manager=" + client_manager + ", bno=" + bno + "]";
	}
}

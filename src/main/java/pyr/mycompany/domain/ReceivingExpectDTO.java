package pyr.mycompany.domain;

public class ReceivingExpectDTO {
	//입고예정코드
	private String expect_id;
	//입고예정날짜
	private String expect_date;
	//품목코드
	private String raw_id;
	//품목명
	private String raw_name;
	//거래처코드
	private String client_id;
	//수량
	private int expect_quantity;
	//창고명
	private String storage_name;
	//구역명
	private String storageArea_name;
	//거래처
	private String client_name;
	//입고예정번호
	private int bno;
	//입고지시상태
	private int expect_state;
	public String getExpect_id() {
		return expect_id;
	}
	public void setExpect_id(String expect_id) {
		this.expect_id = expect_id;
	}
	public String getExpect_date() {
		return expect_date;
	}
	public void setExpect_date(String expect_date) {
		this.expect_date = expect_date;
	}
	public String getRaw_id() {
		return raw_id;
	}
	public void setRaw_id(String raw_id) {
		this.raw_id = raw_id;
	}
	public String getRaw_name() {
		return raw_name;
	}
	public void setRaw_name(String raw_name) {
		this.raw_name = raw_name;
	}
	public String getClient_id() {
		return client_id;
	}
	public void setClient_id(String client_id) {
		this.client_id = client_id;
	}
	public int getExpect_quantity() {
		return expect_quantity;
	}
	public void setExpect_quantity(int expect_quantity) {
		this.expect_quantity = expect_quantity;
	}
	public String getStorage_name() {
		return storage_name;
	}
	public void setStorage_name(String storage_name) {
		this.storage_name = storage_name;
	}
	public String getStorageArea_name() {
		return storageArea_name;
	}
	public void setStorageArea_name(String storageArea_name) {
		this.storageArea_name = storageArea_name;
	}
	public String getClient_name() {
		return client_name;
	}
	public void setClient_name(String client_name) {
		this.client_name = client_name;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public int getExpect_state() {
		return expect_state;
	}
	public void setExpect_state(int expect_state) {
		this.expect_state = expect_state;
	}
	@Override
	public String toString() {
		return "ReceivingExpectDTO [expect_id=" + expect_id + ", expect_date=" + expect_date + ", raw_id=" + raw_id
				+ ", raw_name=" + raw_name + ", client_id=" + client_id + ", expect_quantity=" + expect_quantity
				+ ", storage_name=" + storage_name + ", storageArea_name=" + storageArea_name + ", client_name="
				+ client_name + ", bno=" + bno + ", expect_state=" + expect_state + "]";
	}

}

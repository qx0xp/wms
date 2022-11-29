package pyr.mycompany.domain;

public class ReceivingDTO {
	//입고코드
	private String receiving_id;
	//입고날짜
	private String receiving_date;
	//품목코드
	private String raw_id;
	//품목명
	private String raw_name;
	//거래처코드
	private String client_id;
	//수량
	private int receiving_quantity;
	//창고명
	private String storage_name;
	//구역명
	private String storageArea_name;
	//거래처
	private String client_name;
	//바코드
	private String barcode;
	//입고번호
	private int bno;
	//입고상태
	private int receiving_state;
	public String getReceiving_id() {
		return receiving_id;
	}
	public void setReceiving_id(String receiving_id) {
		this.receiving_id = receiving_id;
	}
	public String getReceiving_date() {
		return receiving_date;
	}
	public void setReceiving_date(String receiving_date) {
		this.receiving_date = receiving_date;
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
	public int getReceiving_quantity() {
		return receiving_quantity;
	}
	public void setReceiving_quantity(int receiving_quantity) {
		this.receiving_quantity = receiving_quantity;
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
	public String getBarcode() {
		return barcode;
	}
	public void setBarcode(String barcode) {
		this.barcode = barcode;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public int getReceiving_state() {
		return receiving_state;
	}
	public void setReceiving_state(int receiving_state) {
		this.receiving_state = receiving_state;
	}
	@Override
	public String toString() {
		return "ReceivingDTO [receiving_id=" + receiving_id + ", receiving_date=" + receiving_date + ", raw_id="
				+ raw_id + ", raw_name=" + raw_name + ", client_id=" + client_id + ", receiving_quantity="
				+ receiving_quantity + ", storage_name=" + storage_name + ", storageArea_name=" + storageArea_name
				+ ", client_name=" + client_name + ", barcode=" + barcode + ", bno=" + bno + ", receiving_state="
				+ receiving_state + "]";
	}
}
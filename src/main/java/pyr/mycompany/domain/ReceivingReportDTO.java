package pyr.mycompany.domain;

public class ReceivingReportDTO {
	//원자재 코드
	private String raw_id;
	//원자재 이름
	private String raw_name;
	//입고수량
	private int total_receiving_quantity;
	//거래처이름
	private String client_name;

	
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
	public int getTotal_receiving_quantity() {
		return total_receiving_quantity;
	}
	public void setTotal_receiving_quantity(int total_receiving_quantity) {
		this.total_receiving_quantity = total_receiving_quantity;
	}
	public String getClient_name() {
		return client_name;
	}
	public void setClient_name(String client_name) {
		this.client_name = client_name;
	}
	
	@Override
	public String toString() {
		return "RawStatusDTO [raw_id=" + raw_id + ", raw_name=" + raw_name + ", total_receiving_quantity="
				+ total_receiving_quantity + ", client_name=" + client_name + "]";
	}
	
}

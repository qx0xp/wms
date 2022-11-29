package pyr.mycompany.domain;

public class DeliveryReportDTO {

	//원자재 코드
	private String raw_id;
	//원자재 이름
	private String raw_name;
	//출고수량
	private int total_delivery_quantity;
	//출하지번호
	private int shipment_bno;
	//출하지 이름
	private String shipment_name;
	
	
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
	public int getTotal_delivery_quantity() {
		return total_delivery_quantity;
	}
	public void setTotal_delivery_quantity(int total_delivery_quantity) {
		this.total_delivery_quantity = total_delivery_quantity;
	}
	public int getShipment_bno() {
		return shipment_bno;
	}
	public void setShipment_bno(int shipment_bno) {
		this.shipment_bno = shipment_bno;
	}
	public String getShipment_name() {
		return shipment_name;
	}
	public void setShipment_name(String shipment_name) {
		this.shipment_name = shipment_name;
	}
	
	@Override
	public String toString() {
		return "DeliveryReportDTO [raw_id=" + raw_id + ", raw_name=" + raw_name + ", total_delivery_quantity="
				+ total_delivery_quantity + ", shipment_bno=" + shipment_bno + ", shipment_name=" + shipment_name + "]";
	}
		
}

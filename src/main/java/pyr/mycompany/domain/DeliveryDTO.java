package pyr.mycompany.domain;

public class DeliveryDTO {
	//출고코드
	private String delivery_id;
	//출고날짜
	private String delivery_date;
	//품목코드
	private String raw_id;
	//품목명
	private String raw_name;
	//수량
	private int delivery_quantity;
	//창고명
	private String storage_name;
	//구역명
	private String storageArea_name;
	//출고번호
	private int bno;
	//출하지번호
	private int shipment_bno;
	//출하지
	private String shipment_name;
	//재고코드
	private String inventory_id;
	
	
	public String getDelivery_id() {
		return delivery_id;
	}
	public void setDelivery_id(String delivery_id) {
		this.delivery_id = delivery_id;
	}
	public String getDelivery_date() {
		return delivery_date;
	}
	public void setDelivery_date(String delivery_date) {
		this.delivery_date = delivery_date;
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
	public int getDelivery_quantity() {
		return delivery_quantity;
	}
	public void setDelivery_quantity(int delivery_quantity) {
		this.delivery_quantity = delivery_quantity;
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
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
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
	public String getInventory_id() {
		return inventory_id;
	}
	public void setInventory_id(String inventory_id) {
		this.inventory_id = inventory_id;
	}
	
	@Override
	public String toString() {
		return "DeliveryDTO [delivery_id=" + delivery_id + ", delivery_date=" + delivery_date + ", raw_id=" + raw_id
				+ ", raw_name=" + raw_name + ", delivery_quantity=" + delivery_quantity + ", storage_name="
				+ storage_name + ", storageArea_name=" + storageArea_name + ", bno=" + bno + ", shipment_bno="
				+ shipment_bno + ", shipment_name=" + shipment_name + ", inventory_id=" + inventory_id + "]";
	}
	
}

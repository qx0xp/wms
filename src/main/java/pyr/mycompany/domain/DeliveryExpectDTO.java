package pyr.mycompany.domain;

public class DeliveryExpectDTO {
	//출고예정코드
	private String d_expect_id;
	//출고예정날짜
	private String d_expect_date;
	//품목코드
	private String raw_id;
	//품목명
	private String raw_name;
	//수량
	private int d_expect_quantity;
	//창고명
	private String storage_name;
	//구역명
	private String storageArea_name;
	//출고지시상태
	private int d_expect_state;
	//출하지번호
	private int shipment_bno;
	//출하지
	private String shipment_name;
	//출고예정번호
	private int bno;
	//재고코드
	private String inventory_id;
	//재고수량
	private int inventory_quantity;
	
	
	public int getInventory_quantity() {
		return inventory_quantity;
	}
	public void setInventory_quantity(int inventory_quantity) {
		this.inventory_quantity = inventory_quantity;
	}
	public String getD_expect_id() {
		return d_expect_id;
	}
	public void setD_expect_id(String d_expect_id) {
		this.d_expect_id = d_expect_id;
	}
	public String getD_expect_date() {
		return d_expect_date;
	}
	public void setD_expect_date(String d_expect_date) {
		this.d_expect_date = d_expect_date;
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
	public int getD_expect_quantity() {
		return d_expect_quantity;
	}
	public void setD_expect_quantity(int d_expect_quantity) {
		this.d_expect_quantity = d_expect_quantity;
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
	public int getD_expect_state() {
		return d_expect_state;
	}
	public void setD_expect_state(int d_expect_state) {
		this.d_expect_state = d_expect_state;
	}
	public int getShipment_bno() {
		return shipment_bno;
	}
	public void setShipment_bno(int shipment_bno) {
		this.shipment_bno = shipment_bno;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getInventory_id() {
		return inventory_id;
	}
	public void setInventory_id(String inventory_id) {
		this.inventory_id = inventory_id;
	}
	
	public String getShipment_name() {
		return shipment_name;
	}
	public void setShipment_name(String shipment_name) {
		this.shipment_name = shipment_name;
	}
	
	@Override
	public String toString() {
		return "DeliveryExpectDTO [d_expect_id=" + d_expect_id + ", d_expect_date=" + d_expect_date + ", raw_id="
				+ raw_id + ", raw_name=" + raw_name + ", d_expect_quantity=" + d_expect_quantity + ", storage_name="
				+ storage_name + ", storageArea_name=" + storageArea_name + ", d_expect_state=" + d_expect_state
				+ ", shipment_bno=" + shipment_bno + ", shipment_name=" + shipment_name + ", bno=" + bno
				+ ", inventory_id=" + inventory_id + ", inventory_quantity=" + inventory_quantity + "]";
	}
	
}

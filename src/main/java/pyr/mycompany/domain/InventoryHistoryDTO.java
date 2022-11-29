package pyr.mycompany.domain;

public class InventoryHistoryDTO {
	// 이력번호
	public String history_id;
	// 이력일자
	public String history_date;
	// 작업구분
	public String history_category;
	// 작업상세
	public String history_detail;
	// 품번
	public String raw_id;
	// 변동수량
	public int diff_quantity;
	// 보내는재고
	public String d_inventory_id;
	// 받는재고
	public String r_inventory_id;
	// 담당자아이디
	public String history_admin;
	// 담당자명
	public String name;
	// 글번호
	public int bno;
	// 품목명
	public String raw_name;
	// 창고명
	public String storage_name;
	// 구역명
	public String storageArea_name;
	// 사유번호
	public String msg_bno;
	
	public String getHistory_id() {
		return history_id;
	}
	public void setHistory_id(String history_id) {
		this.history_id = history_id;
	}
	public String getHistory_date() {
		return history_date;
	}
	public void setHistory_date(String history_date) {
		this.history_date = history_date;
	}
	public String getHistory_category() {
		return history_category;
	}
	public void setHistory_category(String history_category) {
		this.history_category = history_category;
	}
	public String getHistory_detail() {
		return history_detail;
	}
	public void setHistory_detail(String history_detail) {
		this.history_detail = history_detail;
	}
	public String getRaw_id() {
		return raw_id;
	}
	public void setRaw_id(String raw_id) {
		this.raw_id = raw_id;
	}
	public int getDiff_quantity() {
		return diff_quantity;
	}
	public void setDiff_quantity(int diff_quantity) {
		this.diff_quantity = diff_quantity;
	}
	public String getD_inventory_id() {
		return d_inventory_id;
	}
	public void setD_inventory_id(String d_inventory_id) {
		this.d_inventory_id = d_inventory_id;
	}
	public String getR_inventory_id() {
		return r_inventory_id;
	}
	public void setR_inventory_id(String r_inventory_id) {
		this.r_inventory_id = r_inventory_id;
	}
	public String getHistory_admin() {
		return history_admin;
	}
	public void setHistory_admin(String history_admin) {
		this.history_admin = history_admin;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getRaw_name() {
		return raw_name;
	}
	public void setRaw_name(String raw_name) {
		this.raw_name = raw_name;
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
	public String getMsg_bno() {
		return msg_bno;
	}
	public void setMsg_bno(String msg_bno) {
		this.msg_bno = msg_bno;
	}
	@Override
	public String toString() {
		return "InventoryHistoryDTO [history_id=" + history_id + ", history_date=" + history_date
				+ ", history_category=" + history_category + ", history_detail=" + history_detail + ", raw_id=" + raw_id
				+ ", diff_quantity=" + diff_quantity + ", d_inventory_id=" + d_inventory_id + ", r_inventory_id="
				+ r_inventory_id + ", history_admin=" + history_admin + ", name=" + name + ", bno=" + bno
				+ ", raw_name=" + raw_name + ", storage_name=" + storage_name + ", storageArea_name=" + storageArea_name
				+ ", msg_bno=" + msg_bno + "]";
	}
}

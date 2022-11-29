package pyr.mycompany.domain;

public class InventoryDTO {
	// 재고코드
	public String inventory_id;
	// 예약수량
	public int inventory_quantity;
	// 실재고
	public int real_quantity;
	// 품목코드
	public String raw_id;
	// 품목명
	public String raw_name;
	// 창고명
	public String storage_name;
	// 구역명
	public String storageArea_name;
	// 품목DTO
	public RawDTO rawDTO;
	// 수량합계
	public int sumInv;
	// 글번호
	public int bno;
	
	public String getInventory_id() {
		return inventory_id;
	}
	public void setInventory_id(String inventory_id) {
		this.inventory_id = inventory_id;
	}
	public int getInventory_quantity() {
		return inventory_quantity;
	}
	public void setInventory_quantity(int inventory_quantity) {
		this.inventory_quantity = inventory_quantity;
	}
	public int getReal_quantity() {
		return real_quantity;
	}
	public void setReal_quantity(int real_quantity) {
		this.real_quantity = real_quantity;
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
	public RawDTO getRawDTO() {
		return rawDTO;
	}
	public void setRawDTO(RawDTO rawDTO) {
		this.rawDTO = rawDTO;
	}
	public int getSumInv() {
		return sumInv;
	}
	public void setSumInv(int sumInv) {
		this.sumInv = sumInv;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	@Override
	public String toString() {
		return "InventoryDTO [inventory_id=" + inventory_id + ", inventory_quantity=" + inventory_quantity
				+ ", real_quantity=" + real_quantity + ", raw_id=" + raw_id + ", raw_name=" + raw_name
				+ ", storage_name=" + storage_name + ", storageArea_name=" + storageArea_name + ", rawDTO=" + rawDTO
				+ ", sumInv=" + sumInv + ", bno=" + bno + "]";
	}
}

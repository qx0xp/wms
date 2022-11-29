package pyr.mycompany.domain;

public class StorageDTO {
	// 창고명
	public String storage_name;
	// 창고구역명
	public String storageArea_name;
	
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
	@Override
	public String toString() {
		return "StorageDTO [storage_name=" + storage_name + ", storageArea_name=" + storageArea_name + "]";
	}
}

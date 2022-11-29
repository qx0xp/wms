package pyr.mycompany.domain;

public class Criteria {
	// 검색 결과에 따른 페이지 정보(페이지 번호, 한 페이지당 보이는 글 수)
	// 페이지 번호
	public int pageNum;
	// 한 페이지당 보이는 글 수
	public int amount;
	
	// 검색어
	public String keyword;
	// 재고코드
	public String inventory_id;
	// 품목코드
	public String raw_id;
	// 품목명
	public String raw_name;
	// 창고명
	public String storage_name;
	// 구역명
	public String storageArea_name;
	// 거래처 코드
	private String client_id;
	// 거래처명
	public String client_name;
	// 거래처 담당자명
	public String client_manager;
	// 입고번호
	private String receiving_id;
	// 입고날짜
	private String receiving_date;
	// 바코드
	private String barcode;
	// 시작일
	private String start_date;
	// 종료일
	private String end_date;
	//입고예정번호
	private String expect_id;
	//입고예정 날짜
	private String expect_date;
	//출고예정코드
	private String d_expect_id;
	//출고예정날짜
	private String d_expect_date;
	//출고코드
	private String delivery_id;
	//출고날짜
	private String delivery_date;
	//입고유형
	private String receiving_category;
	//출고유형
	private String delivery_category;
	
	
	//작업구분
	private String history_category;
	//작업상세
	private String history_detail;
	//담당자명
	private String name;
	//출하지명
	private String shipment_name;
	
	
	

	// 생성자
	public Criteria() {
		this(1, 10);
	}
	
	public Criteria(int pageNum, int amount) {
		this.pageNum=pageNum;
		this.amount=amount;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getInventory_id() {
		return inventory_id;
	}

	public void setInventory_id(String inventory_id) {
		this.inventory_id = inventory_id;
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

	public String getClient_manager() {
		return client_manager;
	}

	public void setClient_manager(String client_manager) {
		this.client_manager = client_manager;
	}

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

	public String getBarcode() {
		return barcode;
	}

	public void setBarcode(String barcode) {
		this.barcode = barcode;
	}

	public String getStart_date() {
		return start_date;
	}

	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}

	public String getEnd_date() {
		return end_date;
	}

	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}

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

	public String getReceiving_category() {
		return receiving_category;
	}

	public void setReceiving_category(String receiving_category) {
		this.receiving_category = receiving_category;
	}

	public String getDelivery_category() {
		return delivery_category;
	}

	public void setDelivery_category(String delivery_category) {
		this.delivery_category = delivery_category;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getShipment_name() {
		return shipment_name;
	}

	public void setShipment_name(String shipment_name) {
		this.shipment_name = shipment_name;
	}

	@Override
	public String toString() {
		return "Criteria [pageNum=" + pageNum + ", amount=" + amount + ", keyword=" + keyword + ", inventory_id="
				+ inventory_id + ", raw_id=" + raw_id + ", raw_name=" + raw_name + ", storage_name=" + storage_name
				+ ", storageArea_name=" + storageArea_name + ", client_id=" + client_id + ", client_name=" + client_name
				+ ", client_manager=" + client_manager + ", receiving_id=" + receiving_id + ", receiving_date="
				+ receiving_date + ", barcode=" + barcode + ", start_date=" + start_date + ", end_date=" + end_date
				+ ", expect_id=" + expect_id + ", expect_date=" + expect_date + ", d_expect_id=" + d_expect_id
				+ ", d_expect_date=" + d_expect_date + ", delivery_id=" + delivery_id + ", delivery_date="
				+ delivery_date + ", receiving_category=" + receiving_category + ", delivery_category="
				+ delivery_category + ", history_category=" + history_category + ", history_detail=" + history_detail
				+ ", name=" + name + ", shipment_name=" + shipment_name + "]";
	}
}

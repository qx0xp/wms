package pyr.mycompany.domain;

public class ItemDTO {
	//품목코드
	private String raw_id;
	//품명
	private String raw_name;
	//단위
	private String raw_unit;
	//가격
	private int raw_price;
	//거래처
	private String client_name;

	public String getClient_name() {
		return client_name;
	}

	public void setClient_name(String client_name) {
		this.client_name = client_name;
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

	public String getRaw_unit() {
		return raw_unit;
	}

	public void setRaw_unit(String raw_unit) {
		this.raw_unit = raw_unit;
	}

	public int getRaw_price() {
		return raw_price;
	}

	public void setRaw_price(int raw_price) {
		this.raw_price = raw_price;
	}

	@Override
	public String toString() {
		return "ItemDTO [raw_id=" + raw_id + ", raw_name=" + raw_name + ", raw_unit=" + raw_unit + ", raw_price="
				+ raw_price + ", client_name=" + client_name + "]";
	}
}

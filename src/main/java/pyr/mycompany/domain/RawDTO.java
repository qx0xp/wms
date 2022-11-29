package pyr.mycompany.domain;

public class RawDTO {
	// 품목코드
	public String raw_id;
	// 품목명
	public String raw_name;
	// 규격
	public String raw_standard;
	// 가격
	public int raw_price;
	// 글번호
	public int bno;
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
	public String getRaw_standard() {
		return raw_standard;
	}
	public void setRaw_standard(String raw_standard) {
		this.raw_standard = raw_standard;
	}
	public int getRaw_price() {
		return raw_price;
	}
	public void setRaw_price(int raw_price) {
		this.raw_price = raw_price;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	@Override
	public String toString() {
		return "RawDTO [raw_id=" + raw_id + ", raw_name=" + raw_name + ", raw_standard=" + raw_standard + ", raw_price="
				+ raw_price + ", bno=" + bno + "]";
	}
}

package pyr.mycompany.domain;

public class StatusReportDTO {
	// 월별
	public String month;
	// 월별입고카운트
	public int count;
	
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	@Override
	public String toString() {
		return "StatusReportDTO [month=" + month + ", count=" + count + "]";
	}
	
	
}

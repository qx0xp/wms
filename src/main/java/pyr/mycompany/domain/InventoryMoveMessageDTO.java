package pyr.mycompany.domain;

public class InventoryMoveMessageDTO {
	// 사유번호
	public int msg_bno;
	// 사유명
	public String msg_name;
	
	public int getMsg_bno() {
		return msg_bno;
	}
	public void setMsg_bno(int msg_bno) {
		this.msg_bno = msg_bno;
	}
	public String getMsg_name() {
		return msg_name;
	}
	public void setMsg_name(String msg_name) {
		this.msg_name = msg_name;
	}
	@Override
	public String toString() {
		return "InventoryMoveMessageDTO [msg_bno=" + msg_bno + ", msg_name=" + msg_name + "]";
	}
}

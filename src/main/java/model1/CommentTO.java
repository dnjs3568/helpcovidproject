package model1;

public class CommentTO {
	private String seq; 
	private String cmseq; 
	private String cID;
	private String cnickname;
	private String ccontent;
	private String cdate;
	
	public String getSeq() {
		return seq;
	}
	public String getCmseq() {
		return cmseq;
	}
	public void setCmseq(String cmseq) {
	this.cmseq = cmseq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getcID() {
		return cID;
	}
	public void setcID(String cID) {
		this.cID = cID;
	}
	public String getCnickname() {
		return cnickname;
	}
	public void setCnickname(String cnickname) {
		this.cnickname = cnickname;
	}
	public String getCcontent() {
		return ccontent;
	}
	public void setCcontent(String ccontent) {
		this.ccontent = ccontent;
	}
	public String getCdate() {
		return cdate;
	}
	public void setCdate(String cdate) {
		this.cdate = cdate;
	}
	
}

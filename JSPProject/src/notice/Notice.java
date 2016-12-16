package notice;

public class Notice {
	private int noticeUniqueKey;
	private String noticeTitle;
	private String noticeDate;
	private String noticeContent;
	
	public Notice(int noticeUniqueKey, String noticeTitle, String noticeDate) {
		this.noticeUniqueKey = noticeUniqueKey;
		this.noticeTitle = noticeTitle;
		this.noticeDate = noticeDate;
	}
	
	public int getNoticeUniqueKey() {
		return noticeUniqueKey;
	}
	public void setNoticeUniqueKey(int noticeUniqueKey) {
		this.noticeUniqueKey = noticeUniqueKey;
	}
	public String getNoticeTitle() {
		return noticeTitle;
	}
	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}
	public String getNoticeDate() {
		return noticeDate;
	}
	public void setNoticeDate(String noticeDate) {
		this.noticeDate = noticeDate;
	}
	public String getNoticeContent() {
		return noticeContent;
	}
	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}
}

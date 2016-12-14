package review;

public class Review {
	private int reviewUniqueKey;
	private String reviewTitle;
	private int userUniqueKey;
	private String reviewDate;
	private String reviewContent;
	private String reviewImage;
	
	public int getReviewUniqueKey() {
		return reviewUniqueKey;
	}
	public void setReviewUniqueKey(int reviewUniqueKey) {
		this.reviewUniqueKey = reviewUniqueKey;
	}
	public String getReviewTitle() {
		return reviewTitle;
	}
	public void setReviewTitle(String reviewTitle) {
		this.reviewTitle = reviewTitle;
	}
	public int getUserUniqueKey() {
		return userUniqueKey;
	}
	public void setUserUniqueKey(int userUniqueKey) {
		this.userUniqueKey = userUniqueKey;
	}
	public String getReviewDate() {
		return reviewDate;
	}
	public void setReviewDate(String reviewDate) {
		this.reviewDate = reviewDate;
	}
	public String getReviewContent() {
		return reviewContent;
	}
	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}
	public String getReviewImage() {
		return reviewImage;
	}
	public void setReviewImage(String reviewImage) {
		this.reviewImage = reviewImage;
	}
}

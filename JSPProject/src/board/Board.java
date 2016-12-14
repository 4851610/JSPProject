package board;

public class Board {
	private int recipeUniqueKey;
	private String recipeTitle;
	private String userName;
	private String categorizeName;
	private int recipeLike;
	private String recipeWritingDate;
	private String recipeContent;
	private String recipeImage;
	
	public Board() {}
	
	public Board(String recipeImage) {
		this.recipeImage = recipeImage;
	}
	
	public int getRecipeUniqueKey() {
		return recipeUniqueKey;
	}
	public void setRecipeUniqueKey(int recipeUniqueKey) {
		this.recipeUniqueKey = recipeUniqueKey;
	}
	public String getRecipeTitle() {
		return recipeTitle;
	}
	public void setRecipeTitle(String recipeTitle) {
		this.recipeTitle = recipeTitle;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getCategorizeName() {
		return categorizeName;
	}
	public void setCategorizeName(String categorizeName) {
		this.categorizeName = categorizeName;
	}
	public int getRecipeLike() {
		return recipeLike;
	}
	public void setRecipeLike(int recipeLike) {
		this.recipeLike = recipeLike;
	}
	public String getRecipeWritingDate() {
		return recipeWritingDate;
	}
	public void setRecipeWritingDate(String recipeWritingDate) {
		this.recipeWritingDate = recipeWritingDate;
	}
	public String getRecipeContent() {
		return recipeContent;
	}
	public void setRecipeContent(String recipeContent) {
		this.recipeContent = recipeContent;
	}
	public String getRecipeImage() {
		return recipeImage;
	}
	public void setRecipeImage(String recipeImage) {
		this.recipeImage = recipeImage;
	}
}

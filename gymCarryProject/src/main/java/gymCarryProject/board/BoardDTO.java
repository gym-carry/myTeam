package gymCarryProject.board;

import java.util.Date;

public class BoardDTO {

	private int boardNum;
	private String userId;
	private String local;
	private String companyName;
	private String boardTitle;
	private String boardContent;
	private Date boardRegdate;
	private int parent;
	private int viewCnt;
	
	public BoardDTO() {}
	
	public BoardDTO(int boardNum, String userId, String local, String companyName, String boardTitle,
			String boardContent, Date boardRegdate, int viewCnt) {
		super();
		this.boardNum = boardNum;
		this.userId = userId;
		this.local = local;
		this.companyName = companyName;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardRegdate = boardRegdate;
		this.viewCnt = viewCnt;
	}

	public BoardDTO(int boardNum, String userId, String local, String companyName, String boardTitle,
			String boardContent, Date boardRegdate, int parent, int viewCnt) {
		super();
		this.boardNum = boardNum;
		this.userId = userId;
		this.local = local;
		this.companyName = companyName;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardRegdate = boardRegdate;
		this.parent = parent;
		this.viewCnt = viewCnt;
	}
	public int getBoardNum() {
		return boardNum;
	}
	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getLocal() {
		return local;
	}
	public void setLocal(String local) {
		this.local = local;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public Date getBoardRegdate() {
		return boardRegdate;
	}
	public void setBoardRegdate(Date boardRegdate) {
		this.boardRegdate = boardRegdate;
	}
	public int getParent() {
		return parent;
	}
	public void setParent(int parent) {
		this.parent = parent;
	}
	public int getViewCnt() {
		return viewCnt;
	}
	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}

	@Override
	public String toString() {
		return "BoardDTO [boardNum=" + boardNum + ", userId=" + userId + ", local=" + local + ", companyName="
				+ companyName + ", boardTitle=" + boardTitle + ", boardContent=" + boardContent + ", boardRegdate="
				+ boardRegdate + ", parent=" + parent + ", viewCnt=" + viewCnt + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + boardNum;
		result = prime * result + ((userId == null) ? 0 : userId.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		BoardDTO other = (BoardDTO) obj;
		if (boardNum != other.boardNum)
			return false;
		if (userId == null) {
			if (other.userId != null)
				return false;
		} else if (!userId.equals(other.userId))
			return false;
		return true;
	}
	
	
	
}

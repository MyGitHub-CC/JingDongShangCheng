package entity;

public class Image {
	private int id;
	private String bigImg;
	private String smallImg;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getBigImg() {
		return bigImg;
	}

	public void setBigImg(String bigImg) {
		this.bigImg = bigImg;
	}

	public String getSmallImg() {
		return smallImg;
	}

	public void setSmallImg(String smallImg) {
		this.smallImg = smallImg;
	}

	@Override
	public String toString() {
		return "Image [id=" + id + ", bigImg=" + bigImg + ", smallImg="
				+ smallImg + "]";
	}
}

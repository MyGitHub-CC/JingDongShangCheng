package entity;

public class Order {
	private int id;
	private User user;
	private Product product;
	private int num;
	private int uuId;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getUuId() {
		return uuId;
	}

	public void setUuId(int uuId) {
		this.uuId = uuId;
	}

	@Override
	public String toString() {
		return "Order [id=" + id + ", user=" + user + ", product=" + product
				+ ", num=" + num + ", uuId=" + uuId + "]";
	}

}

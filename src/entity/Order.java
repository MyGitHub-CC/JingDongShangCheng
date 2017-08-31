package entity;

import java.util.List;

public class Order {
	private int id;
	private int uId;
	private List<Product> products;
	private int num;
	private String orderNum;
	private int payment;
	private int send;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getuId() {
		return uId;
	}

	public void setuId(int uId) {
		this.uId = uId;
	}

	public List<Product> getProducts() {
		return products;
	}

	public void setProducts(List<Product> products) {
		this.products = products;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getOrderNum() {
		return orderNum;
	}

	public void setOrderNum(String orderNum) {
		this.orderNum = orderNum;
	}

	public int getPayment() {
		return payment;
	}

	public void setPayment(int payment) {
		this.payment = payment;
	}

	public int getSend() {
		return send;
	}

	public void setSend(int send) {
		this.send = send;
	}

	@Override
	public String toString() {
		return "Order [id=" + id + ", uId=" + uId + ", products=" + products
				+ ", num=" + num + ", orderNum=" + orderNum + ", payment="
				+ payment + ", send=" + send + "]";
	}

}

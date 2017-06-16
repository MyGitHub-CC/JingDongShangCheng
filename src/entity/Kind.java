package entity;

import java.util.List;

public class Kind {
	private int id;
	private String name;
	private List<Clazz> clazzs;
	private int c_id;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<Clazz> getClazzs() {
		return clazzs;
	}

	public void setClazzs(List<Clazz> clazzs) {
		this.clazzs = clazzs;
	}

	public int getC_id() {
		return c_id;
	}

	public void setC_id(int c_id) {
		this.c_id = c_id;
	}

	@Override
	public String toString() {
		return "Kind [id=" + id + ", name=" + name + ", clazzs=" + clazzs
				+ ", c_id=" + c_id + "]";
	}

}

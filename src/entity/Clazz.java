package entity;

public class Clazz {
	private int id;
	private String name;
	private int k_id;

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

	public int getK_id() {
		return k_id;
	}

	public void setK_id(int k_id) {
		this.k_id = k_id;
	}

	@Override
	public String toString() {
		return "Clazz [id=" + id + ", name=" + name + ", k_id=" + k_id + "]";
	}

}

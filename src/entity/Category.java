package entity;

import java.util.List;

public class Category {
	private int id;
	private String name;
	private List<Species> species;

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

	public List<Species> getSpecies() {
		return species;
	}

	public void setSpecies(List<Species> species) {
		this.species = species;
	}

	@Override
	public String toString() {
		return "Category [id=" + id + ", name=" + name + ", species=" + species
				+ "]";
	}

}

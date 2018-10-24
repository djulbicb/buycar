package com.bo.buycar.model.product;

public enum ProductCategory {
CAR("Car"), TRUCK("Truck"), MOTORCYCLE("Motorcycle"), RV("RV"), BOAT("Boat");
	String name;
	private ProductCategory(String name) {
		this.name= name;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
}

package spring.mvc.group_buy.model.entity;

import com.google.gson.Gson;

public class Rank {

	Integer productId;
	
	String productName;
	
	Double price;
	
	String unit;
	
	Integer totalQuantity;
	
	Rank() {
		
	}

	public Rank(Integer productId, String productName, Double price, String unit, Integer totalQuantity) {
		super();
		this.productId = productId;
		this.productName = productName;
		this.price = price;
		this.unit = unit;
		this.totalQuantity = totalQuantity;
	}

	public Integer getProductId() {
		return productId;
	}

	public void setProductId(Integer productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	public Integer getTotalQuantity() {
		return totalQuantity;
	}

	public void setTotalQuantity(Integer totalQuantity) {
		this.totalQuantity = totalQuantity;
	}

	@Override
	public String toString() {
		return new Gson().toJson(this);
	}
}

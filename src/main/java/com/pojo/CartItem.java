package com.pojo;

public class CartItem {
	private int menuId;
	private int restaurantId;
	private String itemName;
	private float price;
	private int quantity;
	private String imagePath;
	private float unitPrice;
	private String description;

	public CartItem() {
		// TODO Auto-generated constructor stub
	}	

	public CartItem(int menuId, int restaurantId, String itemName, float price, int quantity,
			String imagePath) {
		super();
		this.menuId = menuId;
		this.restaurantId = restaurantId;
		this.itemName = itemName;
		this.price = price;
		this.quantity = quantity;
		this.imagePath = imagePath;
	}

	public CartItem(int menuId, int restaurantId, String itemName, float price, int quantity) {
		super();
		this.menuId = menuId;
		this.restaurantId = restaurantId;
		this.itemName = itemName;
		this.price = price;
		this.quantity = quantity;
	}

	public CartItem(int menuId, int restaurantId, String itemName, float price, int quantity, String imagePath,
			 String description) {
		super();
		this.menuId = menuId;
		this.restaurantId = restaurantId;
		this.itemName = itemName;
		this.price = price;
		this.quantity = quantity;
		this.imagePath = imagePath;
		this.description = description;
		this.unitPrice = price;
	}

	public float getUnitPrice() { 
		return unitPrice; 
	}
	
	public void setUnitPrice(float unitPrice) {
		this.unitPrice = unitPrice; 
	}
	
	public int getMenuId() {
		return menuId;
	}

	public void setMenuId(int menuId) {
		this.menuId = menuId;
	}

	public int getRestaurantId() {
		return restaurantId;
	}

	public void setRestaurantId(int restaurantId) {
		this.restaurantId = restaurantId;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}


	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Override
	public String toString() {
		return "CartItem [menuId=" + menuId + ", restaurantId=" + restaurantId + ", itemName=" + itemName + ", price="
				+ price + ", quantity=" + quantity + ", imagePath=" + imagePath + ", unitPrice=" + unitPrice
				+ ", description=" + description + "]";
	}
}
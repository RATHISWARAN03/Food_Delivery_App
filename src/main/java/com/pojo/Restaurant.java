package com.pojo;

public class Restaurant {
	private int restaurantId;
	private String name;
	private String address;
	private String phone;
	private String rating;
	private String cusineType;
	private String isActive;
	private String eta;
	private int adminUserId;
	private String imagePath;
	private float distance;

	public Restaurant() {

	}

	public Restaurant(int restaurantId, String name, String address, String phone, String rating, String cusineType,
			String isActive, String eta, int adminUserId, String imagePath, float distance) {
		super();
		this.restaurantId = restaurantId;
		this.name = name;
		this.address = address;
		this.phone = phone;
		this.rating = rating;
		this.cusineType = cusineType;
		this.isActive = isActive;
		this.eta = eta;
		this.adminUserId = adminUserId;
		this.imagePath = imagePath;
		this.distance = distance;
	}
	

	public int getRestaurantId() {
		return restaurantId;
	}

	public void setRestaurantId(int restaurantId) {
		this.restaurantId = restaurantId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getRating() {
		return rating;
	}

	public void setRating(String rating) {
		this.rating = rating;
	}

	public String getCusineType() {
		return cusineType;
	}

	public void setCusineType(String cusineType) {
		this.cusineType = cusineType;
	}

	public String getIsActive() {
		return isActive;
	}

	public void setIsActive(String isActive) {
		this.isActive = isActive;
	}

	public String getEta() {
		return eta;
	}

	public void setEta(String eta) {
		this.eta = eta;
	}

	public int getAdminUserId() {
		return adminUserId;
	}

	public void setAdminUserId(int adminUserId) {
		this.adminUserId = adminUserId;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	public float getDistance() {
		return distance;
	}

	public void setDistance(float distance) {
		this.distance = distance;
	}

	@Override
	public String toString() {
		return "Restaurant [restaurantId=" + restaurantId + ", name=" + name + ", address=" + address + ", phone="
				+ phone + ", rating=" + rating + ", cusineType=" + cusineType + ", isActive=" + isActive + ", eta="
				+ eta + ", adminUserId=" + adminUserId + ", imagePath=" + imagePath + ", distance=" + distance + "]";
	}
}


package com.app.dao;
import java.util.List;
import com.pojo.Restaurant;

public interface Restaurantdao {
	void addRestaurant(Restaurant restaurant);
	Restaurant getRestaurant(int id);
	void updateRestauran(Restaurant restaurant);
	void deleteRestaurant(int id);
	List<Restaurant> getAllRestaurant();
}

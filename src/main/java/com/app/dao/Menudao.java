package com.app.dao;
import java.util.List;
import com.pojo.Menu;

public interface Menudao {
	void addMenu(Menu menu);
	Menu getMenu(int menuId);
	void updateMenu(Menu menu);
	void deleteMenu(int menuId);
	List<Menu> getAllMenu();
	List<Menu> getAllMenuByRestaurant(int restaurant);
}

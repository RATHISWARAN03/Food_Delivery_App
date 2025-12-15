package com.app.daoimpl;
import java.util.HashMap;
import java.util.Map;
import com.app.dao.Cartdao;
import com.pojo.CartItem;

public class Cartimpl implements Cartdao {
	Map <Integer, CartItem> map= new HashMap<Integer, CartItem>();
	@Override
	public void addToCart(CartItem cartItem) {
		int menuId = cartItem.getMenuId();
		if(map.containsKey(menuId)) {
			CartItem existingItem = map.get(menuId);
			existingItem.setQuantity(existingItem.getQuantity()+cartItem.getQuantity());
			existingItem.setPrice(existingItem.getUnitPrice() * existingItem.getQuantity());
		}
		else {
			cartItem.setUnitPrice(cartItem.getPrice());
			// set TOTAL PRICE initially
			cartItem.setPrice(cartItem.getPrice() * cartItem.getQuantity());
			map.put(menuId, cartItem);
		}
	}
	@Override
	public void updateTheCart(int itemId, int quantity) {
		CartItem item = map.get(itemId);
		if (item == null) {
			return; 
		}
		if (quantity <= 0) {
			map.remove(itemId);
			return;
		}
		item.setQuantity(quantity);
		item.setPrice(item.getUnitPrice() * quantity);
	}
	@Override
	public void deleteTheCart(int itemId) {
		map.remove(itemId);
	}
	public Map<Integer, CartItem> getCartItems() {
		return map;
	}
	public void clear()
	{
		map.clear();
	}
}

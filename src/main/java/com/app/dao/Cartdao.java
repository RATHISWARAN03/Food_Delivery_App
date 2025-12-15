package com.app.dao;
import com.pojo.CartItem;

public interface Cartdao {
	void addToCart(CartItem cartItem);
	void updateTheCart(int itemId,int quantity);
	void deleteTheCart(int itemId);
}

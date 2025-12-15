package com.app.dao;
import java.util.List;
import com.pojo.User;

public interface Userdao {
	boolean addUser(User user);
	User getUser(int id);
	void updateUser(User user);
	void deleteUser(int id);
	List<User> getAllUsers();
	User login(String email, String password);
}

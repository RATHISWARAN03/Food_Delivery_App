package com.app.daoimpl;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.app.dao.Menudao;
import com.app.util.DBConnection;
import com.pojo.Menu;

public class Menuimpl implements Menudao {
	private static final String ADD_MENU = "INSERT INTO `menu` (`restaurantId`,`itemName`,`description`,`price`,`rating`,`isAvailable`,`imagePath`) VALUES (?,?,?,?,?,?,?)";
	private static final String GET_MENU = "SELECT * FROM `menu` WHERE `menuId` = ? ";
	private static final String UPDATE_MENU = "UPDATE `menu` SET `menuId`= ? ,`restaurantId` = ? ,`itemName` = ? ,`description` = ? ,`price` = ? ,`rating` = ? ,`isAvailable` = ? ,`imagePath` = ? WHERE `menuId` = ? ";
	private static final String DELETE_MENU = "DELETE FROM `menu` WHERE `menuId` = ? ";
	private static final String GET_ALL_MENU = "SELECT * FROM `menu`";
	private static final String GET_ALL_MENUS = "SELECT * FROM `menu` WHERE `restaurantId`= ?";


	@Override
	public void addMenu(Menu menu) {
		Connection connection = DBConnection.getConnection();
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(ADD_MENU, PreparedStatement.RETURN_GENERATED_KEYS);

			preparedStatement.setInt(1, menu.getRestaurantId());
			preparedStatement.setString(2, menu.getItemName());
			preparedStatement.setString(3, menu.getDescription());
			preparedStatement.setFloat(4, menu.getPrice());
			preparedStatement.setString(5, menu.getRating());
			preparedStatement.setString(6, menu.getIsAvailable());
			preparedStatement.setString(7, menu.getImagePath());

			int executeUpdate = preparedStatement.executeUpdate();
			System.out.println(executeUpdate);
			ResultSet generatedKeys = preparedStatement.getGeneratedKeys();		
			if(generatedKeys.next()) {
				int menuid = generatedKeys.getInt(1);
				System.out.println(menuid);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public Menu getMenu(int menuId) {
		Menu menu = null;
		Connection connection = DBConnection.getConnection();
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(GET_MENU);
			preparedStatement.setInt(1, menuId);
			ResultSet executeQuery = preparedStatement.executeQuery();
			while(executeQuery.next()) {
				menu = new Menu(
						executeQuery.getInt("menuId"),
						executeQuery.getInt("restaurantId"),
						executeQuery.getString("itemName"),
						executeQuery.getString("description"),
						executeQuery.getFloat("price"),
						executeQuery.getString("rating"),
						executeQuery.getString("isAvailable"),
						executeQuery.getString("imagePath"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return menu ;
	}

	@Override
	public void updateMenu(Menu menu) {
		Connection connection = DBConnection.getConnection();
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_MENU);

			preparedStatement.setInt(1, menu.getMenuId());
			preparedStatement.setInt(2, menu.getRestaurantId());
			preparedStatement.setString(3, menu.getItemName());
			preparedStatement.setString(4, menu.getDescription());
			preparedStatement.setFloat(5, menu.getPrice());
			preparedStatement.setString(6, menu.getRating());
			preparedStatement.setString(7, menu.getIsAvailable());
			preparedStatement.setString(8, menu.getImagePath());
			preparedStatement.setInt(9, menu.getMenuId());

			int executeUpdate = preparedStatement.executeUpdate();
			System.out.println(executeUpdate);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteMenu(int menuId) {
		Connection connection = DBConnection.getConnection();
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(DELETE_MENU);
			preparedStatement.setInt(1, menuId);
			int executeUpdate = preparedStatement.executeUpdate();
			System.out.println(executeUpdate);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<Menu> getAllMenu() {

		List<Menu> list = new ArrayList<>();
		Connection connection = DBConnection.getConnection();

		try {
			PreparedStatement preparedStatement = connection.prepareStatement(GET_ALL_MENU);
			ResultSet executeUpdate = preparedStatement.executeQuery();
			while(executeUpdate.next()) {
				Menu menu = new Menu(
						executeUpdate.getInt("menuId"),
						executeUpdate.getInt("restaurantId"),
						executeUpdate.getString("itemName"),
						executeUpdate.getString("description"),
						executeUpdate.getFloat("price"),
						executeUpdate.getString("rating"),
						executeUpdate.getString("isAvailable"),
						executeUpdate.getString("imagePath")
						);
				list.add(menu);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Menu> getAllMenuByRestaurant(int restaurant) {
		List<Menu> list = new ArrayList<>();
		Connection connection = DBConnection.getConnection();
		try {
			PreparedStatement statement = connection.prepareStatement(GET_ALL_MENUS);
			statement.setInt(1, restaurant);
			ResultSet executeQuery = statement.executeQuery();
			while(executeQuery.next()) {
				Menu menu = new Menu(
						executeQuery.getInt("menuId"),
						executeQuery.getInt("restaurantId"),
						executeQuery.getString("itemName"),
						executeQuery.getString("description"),
						executeQuery.getFloat("price"),
						executeQuery.getString("rating"),
						executeQuery.getString("isAvailable"),
						executeQuery.getString("imagePath"));
				list.add(menu);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
}

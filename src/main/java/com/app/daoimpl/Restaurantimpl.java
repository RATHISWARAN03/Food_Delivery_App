package com.app.daoimpl;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.app.dao.Restaurantdao;
import com.app.util.DBConnection;
import com.pojo.Restaurant;

public class Restaurantimpl implements Restaurantdao {
	private static final String ADD_RESTAURANT = "INSERT INTO `restaurant` (`restaurantId`,`name`,`address`,`phone`,`rating`,`cusineType`,`isActive`,`eta`,`adminUserId`,`imagePath`) VALUES (?,?,?,?,?,?,?,?,?,?)";
	private static final String GET_RESTAURANT = "SELECT * FROM `restaurant` WHERE `restaurantId` = ?";
	private static final String UPDATE_RESTAURANT = "UPDATE `restaurant` SET `restaurantId` = ? ,`name` = ? ,`address` = ? ,`phone` = ? ,`rating` = ? ,`cusineType` = ? ,`isActive` = ? ,`eta` = ? ,`adminUserId` = ? ,`imagePath` = ? WHERE `restaurantId` = ?";
	private static final String DELETE_RESTAURANT = "DELETE FROM `restaurant` WHERE `restaurantId` = ? ";
	private static final String GET_ALL_RESTAURANT = "SELECT * FROM `restaurant`";
 	@Override
	public void addRestaurant(Restaurant restaurant) {
		try (Connection connection = DBConnection.getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement(ADD_RESTAURANT);){

			preparedStatement.setInt(1, restaurant.getRestaurantId());
			preparedStatement.setString(2, restaurant.getName());
			preparedStatement.setString(3, restaurant.getAddress());
			preparedStatement.setString(4, restaurant.getPhone());
			preparedStatement.setString(5, restaurant.getRating());
			preparedStatement.setString(6, restaurant.getCusineType());
			preparedStatement.setString(7, restaurant.getIsActive());
			preparedStatement.setString(8, restaurant.getEta());
			preparedStatement.setInt(9, restaurant.getAdminUserId());
			preparedStatement.setString(10, restaurant.getImagePath());
			preparedStatement.setFloat(11, restaurant.getDistance());

			int executeUpdate = preparedStatement.executeUpdate();
			System.out.println(executeUpdate);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public Restaurant getRestaurant(int id) {
		Restaurant restaurant=null;
		try(Connection connection = DBConnection.getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement(GET_RESTAURANT);){
			preparedStatement.setInt(1, id);
			ResultSet executeQuery = preparedStatement.executeQuery();
			while(executeQuery.next()) {
				restaurant = new Restaurant(
						executeQuery.getInt("restaurantId"),
						executeQuery.getString("name"),
						executeQuery.getString("address"),
						executeQuery.getString("phone"),
						executeQuery.getString("rating"),
						executeQuery.getString("cusineType"),
						executeQuery.getString("isActive"),
						executeQuery.getString("eta"),
						executeQuery.getInt("adminUserId"),
						executeQuery.getString("imagePath"),
						executeQuery.getFloat("distance"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return restaurant;
	}

	@Override
	public void updateRestauran(Restaurant restaurant) {

		try(Connection connection = DBConnection.getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_RESTAURANT);){

			preparedStatement.setInt(1, restaurant.getRestaurantId());
			preparedStatement.setString(2, restaurant.getName());
			preparedStatement.setString(3, restaurant.getAddress());
			preparedStatement.setString(4, restaurant.getPhone());
			preparedStatement.setString(5, restaurant.getRating());
			preparedStatement.setString(6, restaurant.getCusineType());
			preparedStatement.setString(7, restaurant.getIsActive());
			preparedStatement.setString(8, restaurant.getEta());
			preparedStatement.setInt(9, restaurant.getAdminUserId());
			preparedStatement.setString(10, restaurant.getImagePath());
			preparedStatement.setInt(11, restaurant.getRestaurantId());
			preparedStatement.setFloat(12, restaurant.getDistance());

			int executeUpdate = preparedStatement.executeUpdate();
			System.out.println(executeUpdate);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteRestaurant(int id) {

		try(Connection connection = DBConnection.getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement(DELETE_RESTAURANT);) {
			preparedStatement.setInt(1, id);
			int executeUpdate = preparedStatement.executeUpdate();
			System.out.println(executeUpdate);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<Restaurant> getAllRestaurant() {
		Restaurant restaurant = null;
		List<Restaurant> list = new ArrayList<>();
		try(Connection connection = DBConnection.getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement(GET_ALL_RESTAURANT);) {
			ResultSet executeQuery = preparedStatement.executeQuery();
			while(executeQuery.next()){
				restaurant = new Restaurant(
				executeQuery.getInt("restaurantId"),
				executeQuery.getString("name"),
				executeQuery.getString("address"),
				executeQuery.getString("phone"),
				executeQuery.getString("rating"),
				executeQuery.getString("cusineType"),
				executeQuery.getString("isActive"),
				executeQuery.getString("eta"),
				executeQuery.getInt("adminUserId"),
				executeQuery.getString("imagePath"),
				executeQuery.getFloat("distance"));
				list.add(restaurant);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
}

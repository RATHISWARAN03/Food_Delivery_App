package com.app.daoimpl;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import com.app.dao.Ordersdao;
import com.app.util.DBConnection;
import com.pojo.Orders;

public class Ordersimpl implements Ordersdao {
	private static final String ADD_ORDERS = "INSERT INTO `orders` (`userId`,`restaurantId`,`orderDate`,`totalAmount`,`status`,`paymentMode`,`address`,`name`,`phonenumber`) VALUES (?,?,?,?,?,?,?,?,?)";
	private static final String GET_ORDERS = "SELECT * FROM `orders` WHERE `orderId` = ?";
	private static final String UPDATE_ORDERS = "UPDATE `orders` SET `orderId` = ? ,`userId` = ? ,`restaurantId` = ? ,`orderDate`= ? ,`totalAmount` = ?,`status` = ? ,`paymentMode` = ? WHERE `orderId` = ?";
	private static final String DELETE_ORDERS = "DELETE FROM `orders` WHERE `orderId` = ? ";
	private static final String GET_ALL_ORDERS = "SELECT * FROM `orders`";
	private static final String GET_ORDERS_BY_USER_ID = "SELECT * FROM orders WHERE userId = ? ORDER BY orderId DESC";
  
	@Override
	public int addOrders(Orders orders) {
		int generatedOrderId = 0;
		try (Connection connection = DBConnection.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(ADD_ORDERS,PreparedStatement.RETURN_GENERATED_KEYS);){


			preparedStatement.setInt(1, orders.getUserId());
			preparedStatement.setInt(2, orders.getRestaurantId());
			preparedStatement.setTimestamp(3, new Timestamp(System.currentTimeMillis()));
			preparedStatement.setFloat(4, orders.getTotalAmount());
			preparedStatement.setString(5, orders.getStatus());
			preparedStatement.setString(6, orders.getPaymentMode());
			preparedStatement.setString(7, orders.getAddress());
			preparedStatement.setString(8, orders.getName());
			preparedStatement.setString(9, orders.getPhoneNumber());

			int executeUpdate = preparedStatement.executeUpdate();
			System.out.println(executeUpdate);
			ResultSet generatedKeys = preparedStatement.getGeneratedKeys();
			while(generatedKeys.next()) {
				generatedOrderId = generatedKeys.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return generatedOrderId;
	}

	@Override
	public Orders getOrders(int orderId) {

		Orders orders = null;
		try(Connection connection = DBConnection.getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement(GET_ORDERS);){
			preparedStatement.setInt(1, orderId);
			ResultSet executeQuery = preparedStatement.executeQuery();
			while(executeQuery.next()) {
				orders = new Orders(executeQuery.getInt("orderId"),
						executeQuery.getInt("userId"),
						executeQuery.getInt("restaurantId"),
						executeQuery.getTimestamp("orderDate"),
						executeQuery.getFloat("totalAmount"),
						executeQuery.getString("status"),
						executeQuery.getString("paymentMode"),
						executeQuery.getString("address"),
						executeQuery.getString("name"),
						executeQuery.getString("phonenumber"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return orders;
	}

	@Override
	public void updateOrders(Orders orders) {

		try(Connection connection = DBConnection.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_ORDERS);){
			preparedStatement.setInt(1, orders.getOrderId());
			preparedStatement.setInt(2, orders.getUserId());
			preparedStatement.setInt(3, orders.getRestaurantId());
			preparedStatement.setTimestamp(4, new Timestamp(System.currentTimeMillis()));
			preparedStatement.setFloat(5, orders.getTotalAmount());
			preparedStatement.setString(6, orders.getStatus());
			preparedStatement.setString(7, orders.getPaymentMode());
			preparedStatement.setString(8, orders.getAddress());
			preparedStatement.setString(9, orders.getName());
			preparedStatement.setString(10, orders.getPhoneNumber());
			int executeUpdate = preparedStatement.executeUpdate();
			System.out.println(executeUpdate);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteOrders(int orderId) {

		try(Connection connection = DBConnection.getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement(DELETE_ORDERS);){
			preparedStatement.setInt(1, orderId);
			int executeUpdate = preparedStatement.executeUpdate();
			System.out.println(executeUpdate);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<Orders> getAllOrders() {
		List<Orders> list = new ArrayList<>();
		try(Connection connection = DBConnection.getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement(GET_ALL_ORDERS);){
			ResultSet executeQuery = preparedStatement.executeQuery();
			while(executeQuery.next()) {
				Orders orders = new Orders(executeQuery.getInt("orderId"),
				executeQuery.getInt("userId"),
				executeQuery.getInt("restaurantId"),
				executeQuery.getTimestamp("orderDate"),
				executeQuery.getFloat("totalAmount"),
				executeQuery.getString("status"),
				executeQuery.getString("paymentMode"),
				executeQuery.getString("address"),
				executeQuery.getString("name"),
				executeQuery.getString("phonenumber"));
				list.add(orders);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public List<Orders> getOrdersByUserId(int userId) {
	    List<Orders> list = new ArrayList<>();
	    try (Connection connection = DBConnection.getConnection();
	         PreparedStatement ps = connection.prepareStatement(GET_ORDERS_BY_USER_ID)) {
	        ps.setInt(1, userId);
	        ResultSet rs = ps.executeQuery();
	        while (rs.next()) {
	            Orders order = new Orders(
	                rs.getInt("orderId"),
	                rs.getInt("userId"),
	                rs.getInt("restaurantId"),
	                rs.getTimestamp("orderDate"),
	                rs.getFloat("totalAmount"),
	                rs.getString("status"),
	                rs.getString("paymentMode"),
	                rs.getString("address"),
	                rs.getString("name"),
	                rs.getString("phonenumber"));
	            list.add(order);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return list;
	}
}

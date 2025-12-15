package com.app.daoimpl;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import com.app.dao.Userdao;
import com.app.util.DBConnection;
import com.pojo.User;

public class Userimpl implements Userdao {

	private static final String ADDUSER_QUERY = "INSERT into `user`(`name`,`username`,`password`,`email`,`phone`,`address`,`role`,`createdDate`,`lastLoginDate`) VALUES(?,?,?,?,?,?,?,?,?)";
	private static final String GET_USER = "SELECT * from `user` WHERE `userId` = ?";
	private static final String UPDATE_QUERY = "UPDATE `user` SET `userId` =?,`name`=?,`username`=?,`password`=?,`email`=?,`phone`=?,`address`=? WHERE `userId` =?";
	private static final String DELETE_QUERY = "DELETE FROM `user` where `userId` = ?";
	private static final String GET_ALL_USER = "SELECT * FROM `user`";
	private static final String PASSWORD_AUTH = "SELECT * FROM user WHERE email=? AND password=?";
	@Override
	public boolean addUser(User user) {
		try(Connection connection = DBConnection.getConnection();
			PreparedStatement statement = connection.prepareStatement(ADDUSER_QUERY);) {
			statement.setString(1, user.getName());
			statement.setString(2, user.getUsername());
			statement.setString(3, user.getPassword());
			statement.setString(4, user.getEmail());
			statement.setString(5, user.getPhone());
			statement.setString(6, user.getAddress());
			statement.setString(7, user.getRole());
			statement.setTimestamp(8, new Timestamp(System.currentTimeMillis()));
			statement.setTimestamp(9, new Timestamp(System.currentTimeMillis()));
			return statement.executeUpdate() > 0;
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public User getUser(int id) {
		User user =null;
		try(Connection connection = DBConnection.getConnection();
				PreparedStatement preparedStatement= connection.prepareStatement(GET_USER);) {
			preparedStatement.setInt(1,id);
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				user = new User(resultSet.getInt("userId"),
						resultSet.getString("name"),
						resultSet.getString("username"),
						resultSet.getString("password"),
						resultSet.getString("email"),
						resultSet.getString("phone"),
						resultSet.getString("address"),
						resultSet.getString("role"),
						resultSet.getTimestamp("createdDate"),
						resultSet.getTimestamp("lastLoginDate"));
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		return user;
	}

	@Override
	public void updateUser(User user) {
		try (Connection connection = DBConnection.getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_QUERY);){
			preparedStatement.setInt(1,user.getUserId());
			preparedStatement.setString(2, user.getName());
			preparedStatement.setString(3, user.getUsername());
			preparedStatement.setString(4, user.getPassword());
			preparedStatement.setString(5, user.getEmail());
			preparedStatement.setString(6, user.getPhone());
			preparedStatement.setString(7, user.getAddress());
			preparedStatement.setInt(8,user.getUserId());

			int executeUpdate = preparedStatement.executeUpdate();
			System.out.println(executeUpdate);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteUser(int id) {

		try (Connection connection = DBConnection.getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement(DELETE_QUERY);){
			preparedStatement.setInt(1, id);
			int executeUpdate = preparedStatement.executeUpdate();
			System.out.println(executeUpdate);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<User> getAllUsers() {
		User user = null;
		List<User> allUsers = new ArrayList<>();
		try (Connection connection = DBConnection.getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement(GET_ALL_USER);){
			ResultSet executeQuery = preparedStatement.executeQuery();
			while(executeQuery.next()) {
				user = new User(executeQuery.getInt("userId"),
						executeQuery.getString("name"),
						executeQuery.getString("username"),
						executeQuery.getString("password"),
						executeQuery.getString("email"),
						executeQuery.getString("phone"),
						executeQuery.getString("address"),
						executeQuery.getString("role"),
						executeQuery.getTimestamp("createdDate"),
						executeQuery.getTimestamp("lastLoginDate")
						);
				allUsers.add(user);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return allUsers;
	}

	public User login(String email, String password) {
        try(Connection con = DBConnection.getConnection()) {
            PreparedStatement ps = con.prepareStatement(PASSWORD_AUTH);
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if(rs.next()) {
                User u = new User();
                u.setUserId(rs.getInt("userId"));
                u.setName(rs.getString("name"));
                u.setEmail(rs.getString("ema"
                		+ "il"));
                return u; 
            }
        } catch(Exception e){ e.printStackTrace(); }
        return null; 
    }
}

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

    // ✅ distance INCLUDED (11 columns)
    private static final String ADD_RESTAURANT =
        "INSERT INTO restaurant " +
        "(restaurantId, name, address, phone, rating, cusineType, isActive, eta, adminUserId, imagePath, distance) " +
        "VALUES (?,?,?,?,?,?,?,?,?,?,?)";

    private static final String GET_RESTAURANT =
        "SELECT * FROM restaurant WHERE restaurantId = ?";

    // ✅ distance INCLUDED
    private static final String UPDATE_RESTAURANT =
        "UPDATE restaurant SET " +
        "name = ?, address = ?, phone = ?, rating = ?, cusineType = ?, " +
        "isActive = ?, eta = ?, adminUserId = ?, imagePath = ?, distance = ? " +
        "WHERE restaurantId = ?";

    private static final String DELETE_RESTAURANT =
        "DELETE FROM restaurant WHERE restaurantId = ?";

    private static final String GET_ALL_RESTAURANT =
        "SELECT * FROM restaurant";

    // --------------------------------------------------

    @Override
    public void addRestaurant(Restaurant restaurant) {
        Connection connection = DBConnection.getConnection();
        if (connection == null) {
            throw new RuntimeException("DB CONNECTION FAILED in addRestaurant()");
        }

        try (PreparedStatement ps = connection.prepareStatement(ADD_RESTAURANT)) {

            ps.setInt(1, restaurant.getRestaurantId());
            ps.setString(2, restaurant.getName());
            ps.setString(3, restaurant.getAddress());
            ps.setString(4, restaurant.getPhone());
            ps.setString(5, restaurant.getRating());
            ps.setString(6, restaurant.getCusineType());
            ps.setString(7, restaurant.getIsActive());
            ps.setString(8, restaurant.getEta());
            ps.setInt(9, restaurant.getAdminUserId());
            ps.setString(10, restaurant.getImagePath());
            ps.setFloat(11, restaurant.getDistance());

            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // --------------------------------------------------

    @Override
    public Restaurant getRestaurant(int id) {
        Restaurant restaurant = null;

        Connection connection = DBConnection.getConnection();
        if (connection == null) {
            throw new RuntimeException("DB CONNECTION FAILED in getRestaurant()");
        }

        try (PreparedStatement ps = connection.prepareStatement(GET_RESTAURANT)) {

            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                restaurant = new Restaurant(
                    rs.getInt("restaurantId"),
                    rs.getString("name"),
                    rs.getString("address"),
                    rs.getString("phone"),
                    rs.getString("rating"),
                    rs.getString("cusineType"),
                    rs.getString("isActive"),
                    rs.getString("eta"),
                    rs.getInt("adminUserId"),
                    rs.getString("imagePath"),
                    rs.getFloat("distance")
                );
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return restaurant;
    }

    // --------------------------------------------------

    @Override
    public void updateRestauran(Restaurant restaurant) {

        Connection connection = DBConnection.getConnection();
        if (connection == null) {
            throw new RuntimeException("DB CONNECTION FAILED in updateRestaurant()");
        }

        try (PreparedStatement ps = connection.prepareStatement(UPDATE_RESTAURANT)) {

            ps.setString(1, restaurant.getName());
            ps.setString(2, restaurant.getAddress());
            ps.setString(3, restaurant.getPhone());
            ps.setString(4, restaurant.getRating());
            ps.setString(5, restaurant.getCusineType());
            ps.setString(6, restaurant.getIsActive());
            ps.setString(7, restaurant.getEta());
            ps.setInt(8, restaurant.getAdminUserId());
            ps.setString(9, restaurant.getImagePath());
            ps.setFloat(10, restaurant.getDistance());
            ps.setInt(11, restaurant.getRestaurantId());

            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // --------------------------------------------------

    @Override
    public void deleteRestaurant(int id) {

        Connection connection = DBConnection.getConnection();
        if (connection == null) {
            throw new RuntimeException("DB CONNECTION FAILED in deleteRestaurant()");
        }

        try (PreparedStatement ps = connection.prepareStatement(DELETE_RESTAURANT)) {

            ps.setInt(1, id);
            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // --------------------------------------------------

    @Override
    public List<Restaurant> getAllRestaurant() {

        List<Restaurant> list = new ArrayList<>();

        Connection connection = DBConnection.getConnection();
        if (connection == null) {
            throw new RuntimeException("DB CONNECTION FAILED in getAllRestaurant()");
        }

        try (PreparedStatement ps = connection.prepareStatement(GET_ALL_RESTAURANT)) {

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Restaurant restaurant = new Restaurant(
                    rs.getInt("restaurantId"),
                    rs.getString("name"),
                    rs.getString("address"),
                    rs.getString("phone"),
                    rs.getString("rating"),
                    rs.getString("cusineType"),
                    rs.getString("isActive"),
                    rs.getString("eta"),
                    rs.getInt("adminUserId"),
                    rs.getString("imagePath"),
                    rs.getFloat("distance")
                );
                list.add(restaurant);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }
}

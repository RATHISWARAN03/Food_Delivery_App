package com.app.daoimpl;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.app.dao.OrderItemdao;
import com.app.util.DBConnection;
import com.pojo.OrderItem;

public class OrderItemimpl implements OrderItemdao {
    private static final String ADD_ORDERITEM ="INSERT INTO orderitem (orderId, menuId, quantity, totalPrice) VALUES (?,?,?,?)";
    private static final String ORDER_ITEM ="SELECT * FROM orderitem WHERE orderItemId = ?";
    private static final String UPDATE_ORDER ="UPDATE orderitem SET orderId=?, menuId=?, quantity=?, totalPrice=? WHERE orderItemId=?";
    private static final String DELETE_ORDER ="DELETE FROM orderitem WHERE orderItemId=?";
    private static final String GET_ALL_ORDERS ="SELECT * FROM orderitem";
    private static final String GET_ITEMS_BY_ORDER ="SELECT * FROM orderitem WHERE orderId = ?";

    @Override
    public void addOrderItem(OrderItem orderItem) {
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement ps = connection.prepareStatement(ADD_ORDERITEM)) {

            ps.setInt(1, orderItem.getOrderId());
            ps.setInt(2, orderItem.getMenuId());
            ps.setInt(3, orderItem.getQuantity());
            ps.setFloat(4, orderItem.getTotalPrice());
            ps.executeUpdate();
            System.out.println("OrderItem inserted");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public OrderItem getOrderItem(int orderItemId) {
        OrderItem orderItem = null;
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement ps = connection.prepareStatement(ORDER_ITEM)) {
            	ps.setInt(1, orderItemId);
            	ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                orderItem = new OrderItem(
                        rs.getInt("orderItemId"),
                        rs.getInt("orderId"),
                        rs.getInt("menuId"),
                        rs.getInt("quantity"),
                        rs.getFloat("totalPrice")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orderItem;
    }

    @Override
    public void updateOrdetItem(OrderItem orderItem) {
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement ps = connection.prepareStatement(UPDATE_ORDER)) {
            ps.setInt(1, orderItem.getOrderId());
            ps.setInt(2, orderItem.getMenuId());
            ps.setInt(3, orderItem.getQuantity());
            ps.setFloat(4, orderItem.getTotalPrice());
            ps.executeUpdate();
            System.out.println("OrderItem updated");

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteOrderItem(int orderItemId) {
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement ps = connection.prepareStatement(DELETE_ORDER)) {
            ps.setInt(1, orderItemId);
            ps.executeUpdate();
            System.out.println("OrderItem deleted ✔");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<OrderItem> getAllOrderItem() {
        List<OrderItem> list = new ArrayList<>();
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement ps = connection.prepareStatement(GET_ALL_ORDERS)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                OrderItem item = new OrderItem(
                        rs.getInt("orderItemId"),
                        rs.getInt("orderId"),
                        rs.getInt("menuId"),
                        rs.getInt("quantity"),
                        rs.getFloat("totalPrice"));
                list.add(item);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    
    @Override
    public List<OrderItem> getOrderItemsByOrderId(int orderId) {
        List<OrderItem> list = new ArrayList<>();
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(GET_ITEMS_BY_ORDER)) {
            ps.setInt(1, orderId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                OrderItem item = new OrderItem(
                    rs.getInt("orderItemId"),
                    rs.getInt("orderId"),
                    rs.getInt("menuId"),
                    rs.getInt("quantity"),
                    rs.getFloat("totalPrice"));

                list.add(item);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}

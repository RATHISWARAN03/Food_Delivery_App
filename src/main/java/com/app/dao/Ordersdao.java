package com.app.dao;
import java.util.List;
import com.pojo.Orders;

public interface Ordersdao {
    int addOrders(Orders orders);
    Orders getOrders(int orderId);
    void updateOrders(Orders orders);
    void deleteOrders(int orderId);
    List<Orders> getAllOrders();
    List<Orders> getOrdersByUserId(int userId);
}

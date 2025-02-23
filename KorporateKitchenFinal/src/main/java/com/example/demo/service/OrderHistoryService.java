package com.example.demo.service;

import com.example.demo.model.OrderHistory;
import java.util.List;

public interface OrderHistoryService {
    OrderHistory saveOrderHistory(OrderHistory orderHistory);
    OrderHistory getOrderHistoryById(int id);
    List<OrderHistory> getOrderHistoriesByUserId(int userId);
    List<OrderHistory> getAllOrderHistories();
    void deleteOrderHistory(int id);
}

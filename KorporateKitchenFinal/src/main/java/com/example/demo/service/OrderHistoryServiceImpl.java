package com.example.demo.service;

import com.example.demo.model.OrderHistory;
import com.example.demo.repository.OrderHistoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class OrderHistoryServiceImpl implements OrderHistoryService {
    
    @Autowired
    private OrderHistoryRepository orderHistoryRepository;
    
    @Override
    public OrderHistory saveOrderHistory(OrderHistory orderHistory) {
        return orderHistoryRepository.save(orderHistory);
    }
    
    @Override
    public OrderHistory getOrderHistoryById(int id) {
        return orderHistoryRepository.findById(id).orElse(null);
    }
    
    @Override
    public List<OrderHistory> getOrderHistoriesByUserId(int userId) {
        return orderHistoryRepository.findByUserUserId(userId);
    }
    
    @Override
    public List<OrderHistory> getAllOrderHistories() {
        return orderHistoryRepository.findAll();
    }
    
    @Override
    public void deleteOrderHistory(int id) {
        orderHistoryRepository.deleteById(id);
    }
}


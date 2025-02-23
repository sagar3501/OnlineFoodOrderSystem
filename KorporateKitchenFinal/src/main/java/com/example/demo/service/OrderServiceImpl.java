package com.example.demo.service;

import com.example.demo.model.Order;
import com.example.demo.model.Order.OrderStatus;
import com.example.demo.repository.OrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderRepository orderRepository;
    
    @Transactional
    public Order saveOrder(Order order) {
        // Use saveAndFlush to force immediate commit to the database
        return orderRepository.saveAndFlush(order);
    }
    
    @Override
    public Order getOrderById(int id) {
        return orderRepository.findById(id).orElse(null);
    }
    
    @Override
    public List<Order> getOrdersByUserId(int userId) {
        return orderRepository.findByUser_UserId(userId);
    }
    
    @Override
    public List<Order> getAllOrders() {
        return orderRepository.findAll();
    }
    
    @Override
    public void deleteOrder(int id) {
        orderRepository.deleteById(id);
    }
    
    @Override
    public List<Order> getOrdersByRestaurantId(int restaurantId) {
        return orderRepository.findByRestaurant_RestaurantId(restaurantId);
    }
    
    @Override
    public List<Order> getOrdersByStatus(OrderStatus status) {
        return orderRepository.findAll()
                .stream()
                .filter(o -> o.getOrder_status() == status)
                .collect(Collectors.toList());
    }
}

package com.example.demo.model;

import jakarta.persistence.*;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import org.hibernate.annotations.CreationTimestamp;

@Entity
@Table(name = "orders")
public class Order {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int orderId;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;
    
    @ManyToOne
    @JoinColumn(name = "restaurant_id")
    private Restaurant restaurant;
    
    @Column(columnDefinition = "TEXT")
    private String items;
    
    private int quantity;
    
    @Column(precision = 10, scale = 2)
    private BigDecimal totalPrice;
    
    @CreationTimestamp
    @Column(name = "order_date", nullable = false, updatable = false)
    private LocalDateTime orderDate;
    
    @Enumerated(EnumType.STRING)
    private OrderStatus order_status;
    
    public enum OrderStatus {
        pending,
        accepted,
        rejected,
        completed,
        cancelled
    }
    
    // Getters and Setters

    public int getOrderId() {
        return orderId;
    }
    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }
    public User getUser() {
        return user;
    }
    public void setUser(User user) {
        this.user = user;
    }
    public Restaurant getRestaurant() {
        return restaurant;
    }
    public void setRestaurant(Restaurant restaurant) {
        this.restaurant = restaurant;
    }
    public String getItems() {
        return items;
    }
    public void setItems(String items) {
        this.items = items;
    }
    public int getQuantity() {
        return quantity;
    }
    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    public BigDecimal getTotalPrice() {
        return totalPrice;
    }
    public void setTotalPrice(BigDecimal totalPrice) {
        this.totalPrice = totalPrice;
    }
    public LocalDateTime getOrderDate() {
        return orderDate;
    }
    public void setOrderDate(LocalDateTime orderDate) {
        this.orderDate = orderDate;
    }
    public OrderStatus getOrder_status() {
        return order_status;
    }
    public void setOrder_status(OrderStatus order_status) {
        this.order_status = order_status;
    }
}

package com.example.demo.model;

import jakarta.persistence.*;
import java.math.BigDecimal;

@Entity
@Table(name = "cart")
public class Cart {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "cart_id")
    private int cartId;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;
    
    @Column(name = "item_name", nullable = false, length = 100)
    private String itemName;
    
    @Column(name = "item_price", precision = 10, scale = 2, nullable = false)
    private BigDecimal itemPrice;
    
    @Column(name = "total_price", precision = 10, scale = 2, nullable = false)
    private BigDecimal totalPrice;
    
    @Column(nullable = false)
    private int quantity = 1;  // New field for quantity with default value 1

    // Getters and Setters
    public int getCartId() {
        return cartId;
    }
    public void setCartId(int cartId) {
        this.cartId = cartId;
    }
    public User getUser() {
        return user;
    }
    public void setUser(User user) {
        this.user = user;
    }
    public String getItemName() {
        return itemName;
    }
    public void setItemName(String itemName) {
        this.itemName = itemName;
    }
    public BigDecimal getItemPrice() {
        return itemPrice;
    }
    public void setItemPrice(BigDecimal itemPrice) {
        this.itemPrice = itemPrice;
    }
    public BigDecimal getTotalPrice() {
        return totalPrice;
    }
    public void setTotalPrice(BigDecimal totalPrice) {
        this.totalPrice = totalPrice;
    }
    public int getQuantity() {
        return quantity;
    }
    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}



package com.example.demo.model;

import jakarta.persistence.*;
import java.math.BigDecimal;
import java.time.LocalTime;

@Entity
@Table(name = "master_menu_items")
public class MasterMenuItem {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int itemId;

    @ManyToOne
    @JoinColumn(name = "restaurant_id")
    private Restaurant restaurant;

    @Column(nullable = false, length = 100)
    private String itemName;

    @Column(columnDefinition = "TEXT")
    private String itemDescription;

    @Column(precision = 10, scale = 2, nullable = false)
    private BigDecimal price;

    @Lob
    private byte[] image;

    @Column(length = 50)
    private String itemType;
    
    // New columns for availability
    @Column(name = "available_from")
    private LocalTime availableFrom;
    
    @Column(name = "available_until")
    private LocalTime availableUntil;

    // Getters and Setters
    public int getItemId() {
        return itemId;
    }
    public void setItemId(int itemId) {
        this.itemId = itemId;
    }
    public Restaurant getRestaurant() {
        return restaurant;
    }
    public void setRestaurant(Restaurant restaurant) {
        this.restaurant = restaurant;
    }
    public String getItemName() {
        return itemName;
    }
    public void setItemName(String itemName) {
        this.itemName = itemName;
    }
    public String getItemDescription() {
        return itemDescription;
    }
    public void setItemDescription(String itemDescription) {
        this.itemDescription = itemDescription;
    }
    public BigDecimal getPrice() {
        return price;
    }
    public void setPrice(BigDecimal price) {
        this.price = price;
    }
    public byte[] getImage() {
        return image;
    }
    public void setImage(byte[] image) {
        this.image = image;
    }
    public String getItemType() {
        return itemType;
    }
    public void setItemType(String itemType) {
        this.itemType = itemType;
    }
    public LocalTime getAvailableFrom() {
        return availableFrom;
    }
    public void setAvailableFrom(LocalTime availableFrom) {
        this.availableFrom = availableFrom;
    }
    public LocalTime getAvailableUntil() {
        return availableUntil;
    }
    public void setAvailableUntil(LocalTime availableUntil) {
        this.availableUntil = availableUntil;
    }
}


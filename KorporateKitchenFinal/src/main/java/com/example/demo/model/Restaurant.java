package com.example.demo.model;

import jakarta.persistence.*;
import java.sql.Time;

@Entity
@Table(name = "restaurant")
public class Restaurant {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "restaurant_id") // Database column remains "restaurant_id"
    private int restaurantId;          // Updated property name (camelCase)
    
    @Column(name = "restaurant_name", nullable = false, length = 100)
    private String restaurantName;
    
    @Column(name = "user_name", nullable = false, length = 50)
    private String userName;
    
    @Column(nullable = false, unique = true, length = 100)
    private String email;
    
    @Column(nullable = false, length = 255)
    private String password;
    
    @Column(length = 15)
    private String contact;
    
    @Column(columnDefinition = "TEXT")
    private String address;
    
    @Lob
    private byte[] image;
    
    private Time open_hours;
    private Time close_hours;
    
    // Getters and Setters
    public int getRestaurantId() {
        return restaurantId;
    }
    public void setRestaurantId(int restaurantId) {
        this.restaurantId = restaurantId;
    }
    public String getRestaurantName() {
        return restaurantName;
    }
    public void setRestaurantName(String restaurantName) {
        this.restaurantName = restaurantName;
    }
    public String getUserName() {
        return userName;
    }
    public void setUserName(String userName) {
        this.userName = userName;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public String getContact() {
        return contact;
    }
    public void setContact(String contact) {
        this.contact = contact;
    }
    public String getAddress() {
        return address;
    }
    public void setAddress(String address) {
        this.address = address;
    }
    public byte[] getImage() {
        return image;
    }
    public void setImage(byte[] image) {
        this.image = image;
    }
    public Time getOpen_hours() {
        return open_hours;
    }
    public void setOpen_hours(Time open_hours) {
        this.open_hours = open_hours;
    }
    public Time getClose_hours() {
        return close_hours;
    }
    public void setClose_hours(Time close_hours) {
        this.close_hours = close_hours;
    }
}

package com.example.demo.model;

import jakarta.persistence.*;

@Entity
@Table(name = "user_favorites")
public class UserFavorite {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int favorite_id;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    @Column(name = "item_name", nullable = false, length = 100)
    private String itemName;

    @Column(name = "restaurant_name", nullable = false, length = 100)
    private String restaurantName;

    // Getters and Setters
    public int getFavorite_id() {
        return favorite_id;
    }

    public void setFavorite_id(int favorite_id) {
        this.favorite_id = favorite_id;
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

    public String getRestaurantName() {
        return restaurantName;
    }

    public void setRestaurantName(String restaurantName) {
        this.restaurantName = restaurantName;
    }
}

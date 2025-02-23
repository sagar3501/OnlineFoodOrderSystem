package com.example.demo.service;

import com.example.demo.model.Restaurant;
import java.util.List;

public interface RestaurantService {
    Restaurant saveRestaurant(Restaurant restaurant);
    Restaurant getRestaurantById(int id);
    Restaurant getRestaurantByEmail(String email);
    List<Restaurant> getAllRestaurants();
    void deleteRestaurant(int id);
    long countRestaurants();
}

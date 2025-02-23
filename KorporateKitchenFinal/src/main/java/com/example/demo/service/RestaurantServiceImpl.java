package com.example.demo.service;
 
import com.example.demo.model.Restaurant;
import com.example.demo.repository.RestaurantRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
 
@Service
public class RestaurantServiceImpl implements RestaurantService {
    @Autowired
    private RestaurantRepository restaurantRepository;
    @Override
    public Restaurant saveRestaurant(Restaurant restaurant) {
        return restaurantRepository.save(restaurant);
    }
    @Override
    public Restaurant getRestaurantById(int id) {
        return restaurantRepository.findById(id).orElse(null);
    }
    @Override
    public Restaurant getRestaurantByEmail(String email) {
        return restaurantRepository.findByEmail(email);
    }
    @Override
    public List<Restaurant> getAllRestaurants() {
        return restaurantRepository.findAll();
    }
    @Override
    public void deleteRestaurant(int id) {
        restaurantRepository.deleteById(id);
    }
    @Override
    public long countRestaurants() {
        return restaurantRepository.count();
    }
}
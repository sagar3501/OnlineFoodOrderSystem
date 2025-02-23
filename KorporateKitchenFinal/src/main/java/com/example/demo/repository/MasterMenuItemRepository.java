package com.example.demo.repository;

import com.example.demo.model.MasterMenuItem;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface MasterMenuItemRepository extends JpaRepository<MasterMenuItem, Integer> {
    List<MasterMenuItem> findByRestaurantRestaurantId(int restaurantId);
}

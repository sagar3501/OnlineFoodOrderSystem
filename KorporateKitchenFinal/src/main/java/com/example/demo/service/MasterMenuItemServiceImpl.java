package com.example.demo.service;

import com.example.demo.model.MasterMenuItem;
import com.example.demo.repository.MasterMenuItemRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class MasterMenuItemServiceImpl implements MasterMenuItemService {

    @Autowired
    private MasterMenuItemRepository masterMenuItemRepository;
    
    @Override
    public List<MasterMenuItem> getMenuItemsByRestaurantId(int restaurantId) {
        return masterMenuItemRepository.findByRestaurantRestaurantId(restaurantId);
    }
    
    @Override
    public MasterMenuItem getMenuItemById(int itemId) {
        return masterMenuItemRepository.findById(itemId).orElse(null);
    }
    
    @Override
    public MasterMenuItem saveMenuItem(MasterMenuItem menuItem) {
        return masterMenuItemRepository.save(menuItem);
    }
    
    @Override
    public void deleteMenuItem(int itemId) {
        masterMenuItemRepository.deleteById(itemId);
    }
}

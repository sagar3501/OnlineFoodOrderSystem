package com.example.demo.service;

import com.example.demo.model.MasterMenuItem;
import java.util.List;

public interface MasterMenuItemService {
    List<MasterMenuItem> getMenuItemsByRestaurantId(int restaurantId);
    MasterMenuItem getMenuItemById(int itemId);
    MasterMenuItem saveMenuItem(MasterMenuItem menuItem);
    void deleteMenuItem(int itemId);
}

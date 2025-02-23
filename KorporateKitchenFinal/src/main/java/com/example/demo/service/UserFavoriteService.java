package com.example.demo.service;

import com.example.demo.model.UserFavorite;
import java.util.List;

public interface UserFavoriteService {
    UserFavorite saveFavorite(UserFavorite favorite);
    UserFavorite getFavoriteById(int id);
    List<UserFavorite> getFavoritesByUserId(int userId);
    List<UserFavorite> getAllFavorites();
    void deleteFavorite(int id);
}

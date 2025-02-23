package com.example.demo.service;

import com.example.demo.model.UserFavorite;
import com.example.demo.repository.UserFavoriteRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class UserFavoriteServiceImpl implements UserFavoriteService {
    
    @Autowired
    private UserFavoriteRepository userFavoriteRepository;
    
    @Override
    public UserFavorite saveFavorite(UserFavorite favorite) {
        return userFavoriteRepository.save(favorite);
    }
    
    @Override
    public UserFavorite getFavoriteById(int id) {
        return userFavoriteRepository.findById(id).orElse(null);
    }
    
    @Override
    public List<UserFavorite> getFavoritesByUserId(int userId) {
        return userFavoriteRepository.findByUserUserId(userId);
    }
    
    @Override
    public List<UserFavorite> getAllFavorites() {
        return userFavoriteRepository.findAll();
    }
    
    @Override
    public void deleteFavorite(int id) {
        userFavoriteRepository.deleteById(id);
    }
}


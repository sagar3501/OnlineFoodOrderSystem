package com.example.demo.repository;

import com.example.demo.model.UserFavorite;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface UserFavoriteRepository extends JpaRepository<UserFavorite, Integer> {
    List<UserFavorite> findByUserUserId(int userId);
}

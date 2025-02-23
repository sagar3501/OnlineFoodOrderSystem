package com.example.demo.repository;

import com.example.demo.model.OrderHistory;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface OrderHistoryRepository extends JpaRepository<OrderHistory, Integer> {
    List<OrderHistory> findByUserUserId(int userId);
}

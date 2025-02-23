package com.example.demo.repository;

import com.example.demo.model.Bank;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import java.util.List;

public interface BankRepository extends JpaRepository<Bank, Integer> {

    // JPQL query: Navigate from Bank -> Payment -> Order -> Restaurant
    @Query("SELECT b FROM Bank b " +
           "JOIN Payment p ON b.transactionId = p.transaction_id " +
           "JOIN Order o ON p.order.orderId = o.orderId " +
           "WHERE o.restaurant.restaurantId = :restaurantId")
    List<Bank> findByRestaurantId(@Param("restaurantId") int restaurantId);
}

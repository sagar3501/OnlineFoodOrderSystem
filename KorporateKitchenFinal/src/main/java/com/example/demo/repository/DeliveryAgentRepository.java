package com.example.demo.repository;

import com.example.demo.model.DeliveryAgent;
import org.springframework.data.jpa.repository.JpaRepository;

public interface DeliveryAgentRepository extends JpaRepository<DeliveryAgent, Integer> {
    // Retrieves a delivery agent by email
    DeliveryAgent findByEmail(String email);
}

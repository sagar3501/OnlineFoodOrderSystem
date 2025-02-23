package com.example.demo.service;

import com.example.demo.model.DeliveryAgent;
import java.util.List;

public interface DeliveryAgentService {
    DeliveryAgent saveDeliveryAgent(DeliveryAgent agent);
    DeliveryAgent getDeliveryAgentById(int id);
    DeliveryAgent getDeliveryAgentByEmail(String email);
    List<DeliveryAgent> getAllDeliveryAgents();
    void deleteDeliveryAgent(int id);
    long countDeliveryAgents();
}

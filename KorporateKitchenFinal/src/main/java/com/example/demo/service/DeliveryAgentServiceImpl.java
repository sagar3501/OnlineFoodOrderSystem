package com.example.demo.service;

import com.example.demo.model.DeliveryAgent;
import com.example.demo.repository.DeliveryAgentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class DeliveryAgentServiceImpl implements DeliveryAgentService {

    @Autowired
    private DeliveryAgentRepository deliveryAgentRepository;
    
    @Override
    public DeliveryAgent saveDeliveryAgent(DeliveryAgent agent) {
        return deliveryAgentRepository.save(agent);
    }
    
    @Override
    public DeliveryAgent getDeliveryAgentById(int id) {
        return deliveryAgentRepository.findById(id).orElse(null);
    }
    
    @Override
    public DeliveryAgent getDeliveryAgentByEmail(String email) {
        return deliveryAgentRepository.findByEmail(email);
    }
    
    @Override
    public List<DeliveryAgent> getAllDeliveryAgents() {
        return deliveryAgentRepository.findAll();
    }
    
    @Override
    public void deleteDeliveryAgent(int id) {
        deliveryAgentRepository.deleteById(id);
    }
    
    @Override
    public long countDeliveryAgents() {
        return deliveryAgentRepository.count();
    }
}


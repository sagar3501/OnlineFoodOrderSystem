package com.example.demo.service;

import com.example.demo.model.Delivery;
import com.example.demo.repository.DeliveryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class DeliveryServiceImpl implements DeliveryService {
    
    @Autowired
    private DeliveryRepository deliveryRepository;
    
    @Transactional
    public Delivery saveDelivery(Delivery delivery) {
        return deliveryRepository.save(delivery);
    }
    
    @Override
    public Delivery getDeliveryById(int id) {
        return deliveryRepository.findById(id).orElse(null);
    }
    
    @Override
    public List<Delivery> getAllDeliveries() {
        return deliveryRepository.findAll();
    }
    
    @Override
    public void deleteDelivery(int id) {
        deliveryRepository.deleteById(id);
    }
}

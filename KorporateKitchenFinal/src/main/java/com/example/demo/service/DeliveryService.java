package com.example.demo.service;

import com.example.demo.model.Delivery;
import java.util.List;

public interface DeliveryService {
    Delivery saveDelivery(Delivery delivery);
    Delivery getDeliveryById(int id);
    List<Delivery> getAllDeliveries();
    void deleteDelivery(int id);
}

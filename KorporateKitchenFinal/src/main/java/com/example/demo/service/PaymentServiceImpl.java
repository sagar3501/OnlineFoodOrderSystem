package com.example.demo.service;

import com.example.demo.model.Payment;
import com.example.demo.repository.PaymentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class PaymentServiceImpl implements PaymentService {
    
    @Autowired
    private PaymentRepository paymentRepository;
    
    @Override
    public Payment savePayment(Payment payment) {
        return paymentRepository.save(payment);
    }
    
    @Override
    public Payment getPaymentById(int id) {
        return paymentRepository.findById(id).orElse(null);
    }
    
    @Override
    public List<Payment> getAllPayments() {
        return paymentRepository.findAll();
    }
    
    @Override
    public void deletePayment(int id) {
        paymentRepository.deleteById(id);
    }
}

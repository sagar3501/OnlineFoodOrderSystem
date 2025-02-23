package com.example.demo.service;

import com.example.demo.model.Payment;
import java.util.List;

public interface PaymentService {
    Payment savePayment(Payment payment);
    Payment getPaymentById(int id);
    List<Payment> getAllPayments();
    void deletePayment(int id);
}

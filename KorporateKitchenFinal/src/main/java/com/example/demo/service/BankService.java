package com.example.demo.service;

import com.example.demo.model.Bank;
import java.util.List;

public interface BankService {
    Bank saveBank(Bank bank);
    Bank getBankById(int id);
    List<Bank> getAllBanks();
    void deleteBank(int id);
    
    // New method: Get bank details for a given restaurant ID
    List<Bank> getBankDetailsByRestaurantId(int restaurantId);
}

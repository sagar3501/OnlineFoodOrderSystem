package com.example.demo.service;

import com.example.demo.model.Bank;
import com.example.demo.repository.BankRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class BankServiceImpl implements BankService {

    @Autowired
    private BankRepository bankRepository;
    
    @Override
    public Bank saveBank(Bank bank) {
        return bankRepository.save(bank);
    }
    
    @Override
    public Bank getBankById(int id) {
        return bankRepository.findById(id).orElse(null);
    }
    
    @Override
    public List<Bank> getAllBanks() {
        return bankRepository.findAll();
    }
    
    @Override
    public void deleteBank(int id) {
        bankRepository.deleteById(id);
    }
    
    @Override
    public List<Bank> getBankDetailsByRestaurantId(int restaurantId) {
        return bankRepository.findByRestaurantId(restaurantId);
    }
}


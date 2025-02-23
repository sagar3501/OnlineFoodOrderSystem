package com.example.demo.service;

import com.example.demo.model.Remark;
import com.example.demo.repository.RemarkRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class RemarkServiceImpl implements RemarkService {

    @Autowired
    private RemarkRepository remarkRepository;
    
    @Override
    public Remark saveRemark(Remark remark) {
        return remarkRepository.save(remark);
    }
    
    @Override
    public List<Remark> getRemarksByUserId(int userId) {
        return remarkRepository.findByUser_UserId(userId);
    }
}

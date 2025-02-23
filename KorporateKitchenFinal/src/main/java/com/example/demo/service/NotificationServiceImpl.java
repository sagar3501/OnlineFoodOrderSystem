package com.example.demo.service;

import com.example.demo.model.Notification;
import com.example.demo.repository.NotificationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class NotificationServiceImpl implements NotificationService {
    
    @Autowired
    private NotificationRepository notificationRepository;
    
    @Override
    public Notification saveNotification(Notification notification) {
        return notificationRepository.save(notification);
    }
    
    @Override
    public Notification getNotificationById(int id) {
        return notificationRepository.findById(id).orElse(null);
    }
    
    @Override
    public List<Notification> getNotificationsByUserId(int userId) {
        return notificationRepository.findByUserUserId(userId);
    }
    
    @Override
    public List<Notification> getAllNotifications() {
        return notificationRepository.findAll();
    }
    
    @Override
    public void deleteNotification(int id) {
        notificationRepository.deleteById(id);
    }
}

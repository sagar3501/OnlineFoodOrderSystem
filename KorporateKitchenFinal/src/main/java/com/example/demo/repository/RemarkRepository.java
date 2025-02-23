package com.example.demo.repository;

import com.example.demo.model.Remark;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface RemarkRepository extends JpaRepository<Remark, Integer> {
    List<Remark> findByUser_UserId(int userId);
}

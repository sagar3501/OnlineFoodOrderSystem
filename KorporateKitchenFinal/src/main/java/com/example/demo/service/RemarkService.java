package com.example.demo.service;

import com.example.demo.model.Remark;
import java.util.List;

public interface RemarkService {
    Remark saveRemark(Remark remark);
    List<Remark> getRemarksByUserId(int userId);
}

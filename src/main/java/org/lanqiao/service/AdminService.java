package org.lanqiao.service;

import org.lanqiao.entity.Admin;
import org.lanqiao.util.ResultInfo;

import java.util.List;

public interface AdminService {
    Admin login(Admin admin);
    Integer addAdmin(Admin admin);
    ResultInfo adminList();
    List<Admin> adminListBy(Admin admin);
    Integer deleteAdmin(Integer id);
    Integer updateAdmin(Admin admin);

}

package org.lanqiao.service;

import org.lanqiao.entity.Admin;
import org.lanqiao.util.ResultInfo;

public interface AdminService {
    ResultInfo login(Admin admin);
    ResultInfo addAdmin(Admin admin);
    ResultInfo adminList();
    ResultInfo adminListBy(Admin admin);
    ResultInfo deleteAdmin(Integer id);
    ResultInfo updateAdmin(Admin admin);

}

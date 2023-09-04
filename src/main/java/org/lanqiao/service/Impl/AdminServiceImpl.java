package org.lanqiao.service.Impl;

import org.lanqiao.dao.AdminDao;
import org.lanqiao.entity.Admin;
import org.lanqiao.service.AdminService;
import org.lanqiao.util.ResultInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class AdminServiceImpl implements AdminService {
    @Autowired
    private AdminDao adminDao;
    @Override
    public Admin login(Admin admin) {
        return adminDao.longin(admin);
    }

    @Override
    public Integer addAdmin(Admin admin) {
        int i = adminDao.insertAdmin(admin);
        System.out.println(i);
        if(i == 0) return 500;
        return 200;
    }

    @Override
    public ResultInfo adminList() {
        List<Admin> list = adminDao.selectAllAdmin();
        HashMap hashMap = new HashMap();
        hashMap.put("msg", "");
        hashMap.put("code", 0);
        hashMap.put("count", list.size());
        hashMap.put("data", list);
        return new ResultInfo("200","请求成功",hashMap);
    }

    @Override
    public List<Admin> adminListBy(Admin admin) {
        List<Admin> list = adminDao.selectAllAdminBy(admin);
//        HashMap hashMap = new HashMap();
//        hashMap.put("msg", "");
//        hashMap.put("code", 0);
//        hashMap.put("count", list.size());
//        hashMap.put("data", list);
//        Gson gson = new Gson();
//        String json = gson.toJson(hashMap);
//        System.out.println(json);
        return list;
    }

    @Override
    public Integer deleteAdmin(Integer id) {
        int i = adminDao.deleteAdmin(id);
        if(i == 0) return 500;
        return 200;
    }

    @Override
    public Integer updateAdmin(Admin admin) {
        int i = adminDao.updateAdmin(admin);
        if(i == 0) return 500;
        return 200;
    }
}

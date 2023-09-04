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
    public ResultInfo login(Admin admin) {

        Admin admin1 = adminDao.longin(admin);
        if (admin1 == null) {
            return new ResultInfo(500, "登录失败");
        }
        return new ResultInfo(200, "登录成功", admin1);
    }

    @Override
    public ResultInfo addAdmin(Admin admin) {
        int i = adminDao.insertAdmin(admin);
        System.out.println(i);
        if (i == 0) {
            return new ResultInfo(500, "添加失败");
        }
        return new ResultInfo(200, "添加成功");
    }

    @Override
    public ResultInfo adminList() {
        List<Admin> list = adminDao.selectAllAdmin();
        HashMap hashMap = new HashMap();
        hashMap.put("msg", "");
        hashMap.put("code", 0);
        hashMap.put("count", list.size());
        hashMap.put("data", list);
        return new ResultInfo(200, "请求成功", hashMap);
    }

    @Override
    public ResultInfo adminListBy(Admin admin) {
        List<Admin> list = adminDao.selectAllAdminBy(admin);
        HashMap hashMap = new HashMap();
        hashMap.put("msg", "");
        hashMap.put("code", 0);
        hashMap.put("count", list.size());
        hashMap.put("data", list);
        return new ResultInfo(200, "请求成功", hashMap);
    }

    @Override
    public ResultInfo deleteAdmin(Integer id) {
        int i = adminDao.deleteAdmin(id);
        if (i == 0) {
            return new ResultInfo(500, "删除失败");
        }
        return new ResultInfo(200, "删除成功");
    }

    @Override
    public ResultInfo updateAdmin(Admin admin) {
        int i = adminDao.updateAdmin(admin);
        if (i == 0){
            return new ResultInfo(500, "修改失败");
        }
        return new ResultInfo(200, "修改成功");
    }
}

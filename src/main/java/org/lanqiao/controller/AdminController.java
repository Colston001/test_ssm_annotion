package org.lanqiao.controller;

import org.lanqiao.entity.Admin;
import org.lanqiao.service.AdminService;
import org.lanqiao.util.ResultInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    private AdminService adminService;

    //http://localhost:8080/admin/checklogin.do
    @RequestMapping("/checklogin.do")
    public String login(Admin admin, HttpSession session){
        Admin admin1 = adminService.login(admin);
        System.out.println(admin1);
//        HttpSession session = request.getSession();
        if(admin1 != null) {
            session.setAttribute("admin",admin1);
            return "redirect:/index.jsp";
        }
        return "redirect:/login.jsp";
    }


    //http://localhost:8080/admin/adminadd.do
    @RequestMapping("/adminadd.do")
    public Integer addAdmin(Admin admin){
        Integer addAdmin = adminService.addAdmin(admin);
        System.out.println(addAdmin);
        return addAdmin;
    }

    //http://localhost:8080/admin/getalladmin.do
    @RequestMapping("/getalladmin.do")
    @ResponseBody
//    public HashMap adminList(Integer page, Integer limit){
//        System.out.println("page");
//        System.out.println("limit");
////        PageHelper.startPage(page,limit);
//        List<Admin> list = adminService.adminList();
//        HashMap hashMap = new HashMap();
//        hashMap.put("msg", "");
//        hashMap.put("code", 0);
//        hashMap.put("count", list.size());
//        hashMap.put("data", list);
//        return hashMap;
//    }
    public Object adminList(){
        ResultInfo resultInfo = adminService.adminList();
//        HashMap hashMap = new HashMap();
//        hashMap.put("msg", "");
//        hashMap.put("code", 0);
//        hashMap.put("count", list.size());
//        hashMap.put("data", list);
        return resultInfo.getData();
    }


    //http://localhost:8080/admin/adminsearch.do
    @RequestMapping("/adminsearch.do")
    @ResponseBody
    public HashMap adminListBy(Admin admin,HttpServletRequest request){
//        if(admin.getAccount() == 0){
//            admin.setAccount(null);
//        }
        System.out.println(admin.getAccount().length());
//        PageHelper.startPage(Integer.parseInt(request.getParameter("page")), Integer.parseInt(request.getParameter("limit")));
        List<Admin> list = adminService.adminListBy(admin);
        HashMap hashMap = new HashMap();
        hashMap.put("msg", "");
        hashMap.put("code", 0);
        hashMap.put("count", list.size());
        hashMap.put("data", list);
        return hashMap;
    }
    //http://localhost:8080/admin/admindelete.do
    @RequestMapping("/admindelete.do")
    public Integer deleteAdmin(Integer id){
        return adminService.deleteAdmin(id);
    }

    //http://localhost:8080/admin/adminupdate.do
    @RequestMapping("/adminupdate.do")
    public Integer updateAdmin(Admin admin){
        return adminService.updateAdmin(admin);
    }


    //http://localhost:8080/admin/exit.do
    @RequestMapping("/exit.do")
    public String exit(HttpServletRequest request){
        request.getSession().invalidate();
        return "redirect:login.jsp";
    }
}

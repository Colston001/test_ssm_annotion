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

@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    private AdminService adminService;

    //http://localhost:8080/admin/checklogin.do
    @RequestMapping("/checklogin.do")
    public String login(Admin admin, HttpSession session){
        ResultInfo resultInfo = adminService.login(admin);
        System.out.println(resultInfo);
//        HttpSession session = request.getSession();
        if(resultInfo.getData() != null) {
            session.setAttribute("admin",resultInfo.getData());
            return "redirect:/index.jsp";
        }
        return "redirect:/login.jsp";
    }


    //http://localhost:8080/admin/adminadd.do
    @RequestMapping("/adminadd.do")
    @ResponseBody
    public ResultInfo addAdmin(Admin admin){
        return adminService.addAdmin(admin);
    }

    //http://localhost:8080/admin/getalladmin.do
    @RequestMapping("/getalladmin.do")
    @ResponseBody
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
    public Object adminListBy(Admin admin,HttpServletRequest request){
        ResultInfo resultInfo = adminService.adminListBy(admin);
        return resultInfo.getData();
    }
    //http://localhost:8080/admin/admindelete.do
    @RequestMapping("/admindelete.do")
    @ResponseBody
    public ResultInfo deleteAdmin(Integer id){
        return adminService.deleteAdmin(id);
    }

    //http://localhost:8080/admin/adminupdate.do
    @RequestMapping("/adminupdate.do")
    @ResponseBody
    public ResultInfo updateAdmin(Admin admin){
        return adminService.updateAdmin(admin);
    }


    //http://localhost:8080/admin/exit.do
    @RequestMapping("/exit.do")
    public String exit(HttpServletRequest request){
        request.getSession().invalidate();
        return "redirect:login.jsp";
    }
}

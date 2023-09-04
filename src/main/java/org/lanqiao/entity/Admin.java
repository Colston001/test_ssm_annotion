package org.lanqiao.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Component;

@Component
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Admin {
    private Integer id;
    private String account;
    private String name;
    private String password;
    private String tel;
    private String email;
    private String dept;
    private String intor;

//    public Admin() {
//    }

    public Admin(String account, String password) {
        this.account = account;
        this.password = password;
    }

    public Admin(String account, String name, String dept) {
        this.account = account;
        this.name = name;
        this.dept = dept;
    }

    public Admin(String account, String name, String password, String tel, String email, String dept, String intor) {
        this.account = account;
        this.name = name;
        this.password = password;
        this.tel = tel;
        this.email = email;
        this.dept = dept;
        this.intor = intor;
    }

//    public Admin(Integer id, String account, String name, String password, String tel, String email, String dept, String intor) {
//        this.id = id;
//        this.account = account;
//        this.name = name;
//        this.password = password;
//        this.tel = tel;
//        this.email = email;
//        this.dept = dept;
//        this.intor = intor;
//    }

}

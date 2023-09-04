package org.lanqiao.dao;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.lanqiao.entity.Admin;

import java.util.List;

//@Repository
public interface AdminDao {
    /**
     * 验证登录，通过账号和密码来进行验证
     *
     * @param admin
     * @return
     */
    @Select("select * from web_admin where account=#{account} and password=#{password}")
    Admin longin(Admin admin);

    /**
     * 查询所有用户
     *
     * @return
     */
    @Select("select * from web_admin")
    List<Admin> selectAllAdmin();

    /**
     * 通过查询条件查询所有值
     *
     * @param admin
     * @return
     */
    @Select({
            "<script>",
            "select * from web_admin",
            "<where>",
            "<if test=\"account != null and account !='' \">",
            "and account like concat('%', #{account},'%')",
            "</if>",
            "<if test='name != null and name.length() !=0 '>",
            "and name like concat('%', #{name},'%')",
            "</if>",
            "<if test='dept != null and dept.length() !=0 '>",
            "and dept = #{dept}",
            "</if>",
            "</where>",
            "</script>"})
    List<Admin> selectAllAdminBy(Admin admin);

    /**
     * 添加用户
     *
     * @param admin
     * @return
     */
    @Insert("insert into web_admin(account, name, password, tel, email, dept, intor) " +
            "values (#{account}, #{name}, #{password}, #{tel}, #{email}, #{dept}, #{intor})")
    int insertAdmin(Admin admin);

    /**
     * 删除用户
     *
     * @param id
     * @return
     */
    @Delete("delete from web_admin where id = #{id}")
    int deleteAdmin(Integer id);

    /**
     * 修改用户信息
     *
     * @param admin
     * @return
     */
    @Update({"<script>",
            "update web_admin" +
            "<set>",
            "<if test=\"account !=null and account != '' \">",
                "account = #{account},\n",
            "</if>\n",
            "<if test=\"name !=null and name != '' \">\n",
                "name = #{name},\n",
            "</if>\n",
            "<if test=\"password !=null and password != '' \">\n",
                "password = #{password},\n",
            "</if>\n",
            "<if test=\"tel !=null and tel != '' \">\n",
                "tel = #{tel},\n",
            "</if>\n",
            "<if test=\"email !=null and email != '' \">\n",
                "email = #{email},\n",
            "</if>\n",
            "<if test=\"dept !=null and dept != '' \">",
                "dept = #{dept},\n",
            "</if>\n",
            "<if test=\"intor !=null and intor != '' \">\n" ,
                "intor = #{intor},\n",
            "</if>\n",
            "</set>\n",
            "where id = #{id}",
            "</script>"})
    int updateAdmin(Admin admin);

}

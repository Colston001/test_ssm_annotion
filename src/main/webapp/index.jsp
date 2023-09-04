<%--
  Created by IntelliJ IDEA.
  User: chenrui
  Date: 2023/8/1
  Time: 下午11:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>用户管理系统</title>
    <link rel="stylesheet" href="layui/css/layui.css">
    <link rel="stylesheet" href="css/home.css">

    <script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header" style="background-color: #20222A">
        <div class="layui-logo"
             style="background-color: #393D49;color: white;height: 210px;border-bottom: 1px solid white">
            <div style="background-color: #393D49;color: #009E94;font-weight: bolder">用户管理系统</div>
            <a href="#" id="tip" onmouseenter="tip()">
                <img id="userImg" src="img/admin.jpg"
                     style="width: 90px;height: 90px" class="layui-nav-img">
            </a>
            <div style="font-size: 10px;text-align: center;height: 15px;margin-bottom: 8px;padding-right: 6px">
                ${admin.name}
            </div>
            <div style="font-size: 10px;padding-right: 10px">
                您好，欢迎登录
            </div>
        </div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">

            <li class="layui-nav-item">
                <div id="scrollWrap" style="float: left">
                    <ul id="scrollMsg">
                        <li><a class="scrollText" href="http://www.baidu.com"><i
                                class="layui-icon layui-icon-speaker"></i>让金企信成为企业软件的标杆</a>
                        </li>
                        <li><a class="scrollText" href="http://www.baidu.com"><i
                                class="layui-icon layui-icon-speaker"></i>XXXX技术公司</a>
                        </li>
                        <li><a class="scrollText" href="http://www.baidu.com"><i
                                class="layui-icon layui-icon-speaker"></i>金企文库</a>
                        </li>
                        <li><a class="scrollText" href="http://www.baidu.com"><i
                                class="layui-icon layui-icon-speaker"></i>轻骑兵V8平台，新一代低快速开发平台<img
                                src="img/hot001.gif"></a>
                        </li>
                    </ul>
                </div>
                <div id="time"></div>

            </li>
        </ul>

        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item"><a href="" id="refresh">
                <i class="layui-icon layui-icon-refresh"></i></a>
            </li>

            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="img/admin.jpg" class="layui-nav-img">
                    <span>${admin.name}</span>
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="#" data-id="0" class="site-demo-active"><i class="layui-icon layui-icon-user"></i> 基本资料</a>
                    </dd>
                    <dd><a href="#" data-url="#" data-id="9" data-title="修改密码" class="site-demo-active"><i
                            class="layui-icon layui-icon-set"></i> 修改密码</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="exit.do" onclick="clearCookie()" id="logout"><i
                    class="layui-icon layui-icon-logout"></i>退出</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black" style="padding-top: 150px">
        <div class="layui-side-scroll">
            <ul class="layui-nav layui-nav-tree" lay-filter="test">
                <li class="layui-nav-item" id="userManage" style="text-align: center">
                    <a href="javascript:;"><i class="layui-icon layui-icon-survey"></i> 用户管理</a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="#" data-url="adminAdd.jsp" data-id="10" data-title="用户添加"
                               class="site-demo-active">
                                <i class="layui-icon layui-icon-table"></i> 用户添加
                            </a>
                        </dd>
                        <dd>
                            <a href="#" data-url="adminView.jsp" data-id="11" data-title="用户查询"
                               class="site-demo-active">
                                <i class="layui-icon layui-icon-table"></i> 用户查询
                            </a>
                        </dd>
                    </dl>
                </li>
                <li class="layui-nav-item" id="class" style="text-align: center">
                    <a href="#" data-url="https://www.xxx.com/" data-id="2" data-title="班级管理" class="site-demo-active"
                       data-type="tabAdd">
                        <i class="layui-icon layui-icon-read"></i> 班级管理
                    </a>
                </li>
                <li class="layui-nav-item" id="student" style="text-align: center">
                    <a href="#" data-url="https://www.xxx.com/" data-id="3" data-title="学生管理" class="site-demo-active"
                       data-type="tabAdd">
                        <i class="layui-icon layui-icon-user"></i> 学生管理
                    </a>
                </li>
                <li class="layui-nav-item" id="dept" style="text-align: center">
                    <a href="#" data-url="https://www.xxx.com/" data-id="4" data-title="部门管理" class="site-demo-active"
                       data-type="tabAdd">
                        <i class="layui-icon layui-icon-chart-screen"></i> 部门管理
                    </a>
                </li>
                <li class="layui-nav-item" id="course" style="text-align: center">
                    <a href="#" data-url="https://www.xxx.com/" data-id="5" data-title="课程管理" class="site-demo-active"
                       data-type="tabAdd">
                        <i class="layui-icon layui-icon-read"></i> 课程管理
                    </a>
                </li>
                <li class="layui-nav-item" style="text-align: center">
                    <a href="javascript:;"><i class="layui-icon layui-icon-survey"></i> 评价管理</a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="#" data-url="https://www.xxx.com/" data-id="10" data-title="分项管理"
                               class="site-demo-active">
                                <i class="layui-icon layui-icon-table"></i> 分项管理
                            </a>
                        </dd>
                        <dd>
                            <a href="#" data-url="https://www.xxx.com/" data-id="11" data-title="总评"
                               class="site-demo-active">
                                <i class="layui-icon layui-icon-table"></i> 总评
                            </a>
                        </dd>
                    </dl>
                </li>
                <li class="layui-nav-item" style="text-align: center">
                    <a href="javascript:;"><i class="layui-icon layui-icon-table"></i> 成绩管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="#" data-url="https://www.xxx.com/" data-id="7" data-title="经理评分"
                               class="site-demo-active">
                            <i class="layui-icon layui-icon-table"></i> 经理评分
                        </a>
                        </dd>
                        <dd>
                            <a href="#" data-url="https://www.xxx.com/" data-id="8" data-title="教师评分"
                               class="site-demo-active">
                                <i class="layui-icon layui-icon-table"></i> 教师评分
                            </a>
                        </dd>
                    </dl>
                </li>
            </ul>
        </div>
    </div>

    <div class="layui-body"
         style="background: url(img/bodyBg.jpg) no-repeat ;background-size: 100% 100%    ">
        <!-- 内容主体区域 -->
        <div class="layui-tab layui-tab-card" lay-filter="demo" lay-allowclose="true" style="">
            <ul class="layui-tab-title" style="background-color: rgba(255,255,255,0.1)">
                <li class="layui-this" lay-id="0"><i style="font-size: smaller"
                                                     class="layui-icon layui-icon-circle-dot"></i>首页
                </li>
            </ul>
            <div class="layui-tab-content" style="height:400px">
                <div class="layui-tab-item layui-show">
                    <div style="padding-top: 100px;padding-left:400px;width: 300px">
                        <table class="layui-table" style="background-color:rgba(255,255,255,0.1);font-weight: bolder"
                               lay-skin="line">

                            <tr>
                                <td class="tableC1">用户名：</td>
                                <td class="tableC2">${admin.name}
                                </td>
                            </tr>
                            <tr>
                                <td class="tableC1">联系方式：</td>
                                <td class="tableC2">${admin.tel}
                                </td>

                            </tr>
                            <tr>
                                <td class="tableC1">邮箱：</td>
                                <td class="tableC2">${admin.email}
                                </td>

                            </tr>
                            <tr>
                                <td class="tableC1">备注：</td>
                                <td class="tableC2">${admin.intor}
                                </td>
                            </tr>
                            <tr>
                                <td class="tableC1">所属部门：</td>
                                <td class="tableC2">${admin.dept}
                            </tr>
                            <tr>
                                <td class="tableC1">上次登录时间：</td>
                                <td class="tableC2">2020-7-28
                                </td>
                            </tr>

                        </table>
                    </div>

                </div>
            </div>
        </div>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        <div style="text-align: center">
            <%--      © 欢迎交流讨论--%>
            © 在线人数：${onLineCount}
        </div>
    </div>
</div>
<script src="js/jquery-3.3.1.js"></script>
<script src="layui/layui.js"></script>
<script src="js/home.js"></script>
<style>
    .copyrights {
        text-indent: -9999px;
        height: 0;
        line-height: 0;
        font-size: 0;
        overflow: hidden;
    }
</style>
<div class="copyrights" id="links20210126">
    Collect from <a href="http://www.cssmoban.com/" title="网站模板">模板之家</a>
    <a href="https://www.chazidian.com/" title="查字典">查字典</a>
</div>
</body>
</html>
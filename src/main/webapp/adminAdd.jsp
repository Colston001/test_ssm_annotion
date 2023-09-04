<%--
  Created by IntelliJ IDEA.
  User: chenrui
  Date: 2023/8/4
  Time: 下午3:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Demo</title>
    <!-- 请勿在项目正式环境中引用该 layui.css 地址 -->
    <link href="layui/css/layui.css" rel="stylesheet">
<%--    <script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>--%>
    <script src="js/jquery-3.3.1.js"></script>
</head>
<body>
<!-- 给容器追加 class="layui-form-pane"，即可显示为方框风格 -->
<form class="layui-form layui-form-pane" action="" id="form1">
    <div class="layui-form-item">
        <label class="layui-form-label">账号</label>
        <div class="layui-input-inline">
            <input type="text" name="account" placeholder="请输入" lay-verify="required" autocomplete="off"
                   class="layui-input">
        </div>
        <div class="layui-form-mid layui-text-em">请务必填写账号</div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">真实姓名</label>
        <div class="layui-input-inline">
            <input type="text" name="name" placeholder="请输入" lay-verify="required" autocomplete="off"
                   class="layui-input">
        </div>
        <div class="layui-form-mid layui-text-em">请务必填写真实姓名</div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">密码框</label>
        <div class="layui-input-inline">
            <input type="password" name="password" placeholder="请输入" lay-verify="required|pass" autocomplete="off"
                   class="layui-input">
        </div>
        <div class="layui-form-mid layui-text-em">请务必填写密码，密码3~6位</div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">电话号码</label>
        <div class="layui-input-inline">
            <input type="tel" name="tel" lay-verify="required|phone" autocomplete="off" class="layui-input demo-phone">
        </div>
        <div class="layui-form-mid layui-text-em">请务必填写用电话号码</div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">email</label>
        <div class="layui-input-inline">
            <input type="text" name="email" lay-verify="email" autocomplete="off" class="layui-input">
        </div>
        <div class="layui-form-mid layui-text-em">请务必填写email</div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">部门</label>
        <div class="layui-input-inline">
            <select name="dept" lay-filter="aihao">
                <option value="开发">开发</option>

                <option value="测试" selected>测试</option>
                <option value="运维">运维</option>
                <option value="销售">销售</option>
                <option value="财务">财务</option>
            </select>
        </div>
    </div>

    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">文本域</label>
        <div class="layui-input-block">
            <textarea name="intor" placeholder="请输入内容" class="layui-textarea"></textarea>
        </div>
    </div>
    <div class="layui-form-item">
        <button class="layui-btn" lay-submit lay-filter="demo2">确认</button>
        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
    </div>
</form>

<!-- 请勿在项目正式环境中引用该 layui.js 地址 -->
<script src="layui/layui.js"></script>
<script>
    layui.use(['form'], function () {
        var form = layui.form;
        var layer = layui.layer;
        // 自定义验证规则
        form.verify({
            pass: [
                /^[\S]{3,6}$/,
                '密码必须3到6位，且不能出现空格'
            ]
        });
        // 提交事件
        form.on('submit(demo2)', function (data) {
            var field = data.field; // 获取表单字段值
            // 显示填写结果，仅作演示用
            // layer.alert(JSON.stringify(field), {
            //     title: '当前填写的字段值'
            // });

            // 此处可执行 Ajax 等操作
            $.ajax({
                url: '/admin/adminadd.do',
                type: 'post',
                data: $("#form1").serialize(),
                success: function (data1) {
                    console.log(data1)
                    if (data1 == 200) layer.msg("添加成功")
                    else layer.msg("添加失败")
                }
            })
            return false; // 阻止默认 form 跳转
        });
    });
</script>
</body>
</html>

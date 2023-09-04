<%--
  Created by IntelliJ IDEA.
  User: chenrui
  Date: 2023/8/6
  Time: 上午12:22
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
    <script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
</head>
<body>
<!-- 给容器追加 class="layui-form-pane"，即可显示为方框风格 -->
<form class="layui-form layui-form-pane" action="" id="form1">
    <div class="layui-form-item">
        <label class="layui-form-label">ID</label>
        <div class="layui-input-inline">
            <input type="text" name="id" placeholder="请输入" readonly="readonly" lay-verify="required" autocomplete="off"
                   class="layui-input">
        </div>
        <div class="layui-form-mid layui-text-em">账号ID</div>
    </div>
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
    <div class="layui-form-i">
        <label class="layui-form-label">部门</label>
        <%--        <div class="layui-input-inline">--%>
        <div class="layui-input-block">
            <select name="dept" lay-filter="aihao" id="dept1">
                <%--    <select  id="ksbm" name="dept" lay-filter="ksbm" class="layui-input" placeholder="请选择科室">--%>
                <option value="开发">开发</option>
                <option value="测试">测试</option>
                <option value="运维">运维</option>
                <option value="销售">销售</option>
                <option value="财务">财务</option>
            </select>
        </div>
    </div>

    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">个人简介</label>
        <div class="layui-input-block">
            <textarea name="intor" placeholder="请输入内容" class="layui-textarea"></textarea>
        </div>
    </div>
    <div class="layui-form-item">
        <button class="layui-btn" lay-submit lay-filter="demo2" id="submit">确认</button>
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
                url: '/admin/adminupdate.do',
                type: 'post',
                data: $("#form1").serialize(),
                success: function (data1) {
                    if (data1 == 200) {
                        layer.msg("修改成功");
                    } else layer.msg("修改失败")
                }
            })
            return false; // 阻止默认 form 跳转
        });
    });
    $(function () {
        //刷新表单，不能放在下拉列表的前面，否则下拉列表
        // form.render();

        // 让下拉列表选中值
        var select = 'dd[lay-value=' + "<%=request.getParameter("dept")%>" + ']';
        $('#dept1').siblings("div.layui-form-select").find('dl').find(select).click();

    })

</script>
</body>
</html>


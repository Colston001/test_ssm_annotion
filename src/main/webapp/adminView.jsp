<%--
  Created by IntelliJ IDEA.
  User: chenrui
  Date: 2023/8/4
  Time: 下午3:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>table 组件综合演示 - Layui</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="layui/css/layui.css" rel="stylesheet">
    <script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
</head>
<body>

<form class="layui-form layui-row layui-col-space16">
    <div class="layui-col-md4">
        <div class="layui-input-wrap">
            <div class="layui-input-prefix">
                <i class="layui-icon layui-icon-username"></i>
            </div>
            <input type="text" name="account" value="" placeholder="账号" class="layui-input" lay-affix="clear">
        </div>
    </div>
    <div class="layui-col-md4">
        <div class="layui-input-wrap">
            <input type="text" name="name" placeholder="姓名" lay-affix="clear" class="layui-input">
        </div>
    </div>
    <div class="layui-col-md4">
        <div class="layui-input-wrap">
            <%--            <div class="layui-input-prefix">--%>
            <%--                <i class="layui-icon layui-icon-date"></i>--%>
            <%--            </div>--%>
            <%--            <input type="text" name="C" readonly placeholder="Field C" class="layui-input demo-table-search-date">--%>
            <label class="layui-form-label">部门</label>
            <div class="layui-input-inline">
                <select name="dept" lay-filter="aihao">
                    <option value="" selected></option>
                    <option value="开发">开发</option>
                    <option value="测试">测试</option>
                    <option value="运维">运维</option>
                    <option value="销售">销售</option>
                    <option value="财务">财务</option>
                </select>
            </div>
        </div>
    </div>
    <div class="layui-btn-container layui-col-xs12">
        <button class="layui-btn" lay-submit lay-filter="demo-table-search">Search</button>
        <button type="reset" class="layui-btn layui-btn-primary">Clear</button>
    </div>
</form>
<table class="layui-hide" id="ID-table-demo-search"></table>
<!--
本「综合演示」包含：自定义头部工具栏、获取表格数据、表格重载、自定义模板、单双行显示、单元格编辑、自定义底部分页栏、表格相关事件与操作、与其他组件的结合等相对常用的功能，以便快速掌握 table 组件的使用。
-->

<div style="padding: 16px;">
    <table class="layui-hide" id="test" lay-filter="test"></table>
</div>
<%--<script type="text/html" id="toolbarDemo">--%>
<%--    <div class="layui-btn-container">--%>
<%--        <button class="layui-btn layui-btn-sm" lay-event="getCheckData">获取选中行数据</button>--%>
<%--        <button class="layui-btn layui-btn-sm" lay-event="getData">获取当前页数据</button>--%>
<%--        <button class="layui-btn layui-btn-sm" id="dropdownButton">--%>
<%--            下拉按钮--%>
<%--            <i class="layui-icon layui-icon-down layui-font-12"></i>--%>
<%--        </button>--%>
<%--        <button class="layui-btn layui-btn-sm layui-bg-blue" id="reloadTest">--%>
<%--            重载测试--%>
<%--            <i class="layui-icon layui-icon-down layui-font-12"></i>--%>
<%--        </button>--%>
<%--        <button class="layui-btn layui-btn-sm layui-btn-primary" id="rowMode">--%>
<%--            <span>{{= d.lineStyle ? '多行' : '单行' }}模式</span>--%>
<%--            <i class="layui-icon layui-icon-down layui-font-12"></i>--%>
<%--        </button>--%>
<%--    </div>--%>
<%--</script>--%>
<%--<script type="text/html" id="cityTpl">--%>
<%--    <select id="demoCity1" class="layui-border" lay-ignore>--%>
<%--        <option value="浙江杭州">浙江杭州</option>--%>
<%--        <option value="江西南昌">江西南昌</option>--%>
<%--        <option value="湖北武汉">湖北武汉</option>--%>
<%--        <option value="湖南长沙">湖南长沙</option>--%>
<%--    </select>--%>
<%--</script>--%>
<script type="text/html" id="barDemo">
    <div class="layui-clear-space">
        <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
        <a class="layui-btn layui-btn-xs" lay-event="more">
            更多
            <i class="layui-icon layui-icon-down"></i>
        </a>
    </div>
</script>
<script src="layui/layui.js"></script>
<script>
    layui.use(['table', 'dropdown'], function () {
        var table = layui.table;
        var dropdown = layui.dropdown;

        // 创建渲染实例
        table.render({
            elem: '#test',
            url: '/admin/getalladmin.do', // 此处为静态模拟数据，实际使用时需换成真实接口
            toolbar: '#toolbarDemo',
            defaultToolbar: ['filter', 'exports', 'print', {
                title: '提示',
                layEvent: 'LAYTABLE_TIPS',
                icon: 'layui-icon-tips'
            }],
            height: 'full-35', // 最大高度减去其他容器已占有的高度差
            css: [ // 重设当前表格样式
                '.layui-table-tool-temp{padding-right: 145px;}'
            ].join(''),
            cellMinWidth: 80,
            totalRow: true, // 开启合计行
            page: true,
            cols: [[
                {type: 'checkbox', fixed: 'left'},
                {field: 'id', width: 80, title: 'ID'},
                {field: 'account', width: 120, title: '账号'},
                {field: 'name', width: 80, title: '姓名'},
                {field: 'tel', width: 120, title: '电话号码'},
                {
                    field: 'email',
                    title: '邮箱 <i class="layui-icon layui-icon-tips layui-font-14" lay-event="email-tips" title="该字段开启了编辑功能" style="margin-left: 5px;"></i>',
                    fieldTitle: '邮箱',
                    hide: 0,
                    width: 150,
                    edit: 'text'
                },
                {field: 'dept', width: 80, title: '部门'},
                {field: 'intor', width: 500, title: '个人简介'},
                {fixed: 'right', title: '操作', width: 134, minWidth: 125, toolbar: '#barDemo'}
            ]],
            done: function () {
                var id = this.id;
                // 下拉按钮测试
                dropdown.render({
                    elem: '#dropdownButton', // 可绑定在任意元素中，此处以上述按钮为例
                    data: [{
                        id: 'add',
                        title: '添加'
                    }, {
                        id: 'update',
                        title: '编辑'
                    }, {
                        id: 'delete',
                        title: '删除'
                    }],
                    // 菜单被点击的事件
                    click: function (obj) {
                        var checkStatus = table.checkStatus(id)
                        var data = checkStatus.data; // 获取选中的数据
                        switch (obj.id) {
                            case 'add':
                                layer.open({
                                    title: '添加',
                                    type: 1,
                                    area: ['80%', '80%'],
                                    content: '<div style="padding: 16px;">自定义表单元素</div>'
                                });
                                break;
                            case 'update':
                                if (data.length !== 1) return layer.msg('请选择一行');
                                layer.open({
                                    title: '编辑',
                                    type: 1,
                                    area: ['80%', '80%'],
                                    content: '<div style="padding: 16px;">自定义表单元素</div>'
                                });
                                break;
                            case 'delete':
                                if (data.length === 0) {
                                    return layer.msg('请选择一行');
                                }
                                layer.msg('delete event');
                                break;
                        }
                    }
                });

                // 重载测试
                dropdown.render({
                    elem: '#reloadTest', // 可绑定在任意元素中，此处以上述按钮为例
                    data: [{
                        id: 'reload',
                        title: '重载'
                    }, {
                        id: 'reload-deep',
                        title: '重载 - 参数叠加'
                    }, {
                        id: 'reloadData',
                        title: '仅重载数据'
                    }, {
                        id: 'reloadData-deep',
                        title: '仅重载数据 - 参数叠加'
                    }],
                    // 菜单被点击的事件
                    click: function (obj) {
                        switch (obj.id) {
                            case 'reload':
                                // 重载 - 默认（参数重置）
                                table.reload('test', {
                                    where: {
                                        abc: '123456',
                                        //test: '新的 test2',
                                        //token: '新的 token2'
                                    },
                                    /*
                                    cols: [[ // 重置表头
                                      {type: 'checkbox', fixed: 'left'},
                                      {field:'id', title:'ID', width:80, fixed: 'left', unresize: true, sort: true, totalRowText: '合计：'},
                                      {field:'sex', title:'性别', width:80, edit: 'text', sort: true},
                                      {field:'experience', title:'积分', width:80, sort: true, totalRow: true, templet: '<div>{{= d.experience }} 分</div>'},
                                      {field:'logins', title:'登入次数', width:100, sort: true, totalRow: true},
                                      {field:'joinTime', title:'加入时间', width:120}
                                    ]]
                                    */
                                });
                                break;
                            case 'reload-deep':
                                // 重载 - 深度（参数叠加）
                                table.reload('test', {
                                    where: {
                                        abc: 123,
                                        test: '新的 test1'
                                    },
                                    //defaultToolbar: ['print'], // 重载头部工具栏右侧图标
                                    //cols: ins1.config.cols
                                }, true);
                                break;
                            case 'reloadData':
                                // 数据重载 - 参数重置
                                table.reloadData('test', {
                                    where: {
                                        abc: '123456',
                                        //test: '新的 test2',
                                        //token: '新的 token2'
                                    },
                                    scrollPos: 'fixed',  // 保持滚动条位置不变 - v2.7.3 新增
                                    height: 2000, // 测试无效参数（即与数据无关的参数设置无效，此处以 height 设置无效为例）
                                    //url: '404',
                                    //page: {curr: 1, limit: 30} // 重新指向分页
                                });
                                break;
                            case 'reloadData-deep':
                                // 数据重载 - 参数叠加
                                table.reloadData('test', {
                                    where: {
                                        abc: 123,
                                        test: '新的 test1'
                                    }
                                }, true);
                                break;
                        }
                        layer.msg('可观察 Network 请求参数的变化');
                    }
                });

                // 行模式
                dropdown.render({
                    elem: '#rowMode',
                    data: [{
                        id: 'default-row',
                        title: '单行模式（默认）'
                    }, {
                        id: 'multi-row',
                        title: '多行模式'
                    }],
                    // 菜单被点击的事件
                    click: function (obj) {
                        var checkStatus = table.checkStatus(id)
                        var data = checkStatus.data; // 获取选中的数据
                        switch (obj.id) {
                            case 'default-row':
                                table.reload('test', {
                                    lineStyle: null // 恢复单行
                                });
                                layer.msg('已设为单行');
                                break;
                            case 'multi-row':
                                table.reload('test', {
                                    // 设置行样式，此处以设置多行高度为例。若为单行，则没必要设置改参数 - 注：v2.7.0 新增
                                    lineStyle: 'height: 95px;'
                                });
                                layer.msg('即通过设置 lineStyle 参数可开启多行');
                                break;
                        }
                    }
                });
            },
            error: function (res, msg) {
                console.log(res, msg)
            }
        });

        // 工具栏事件
        table.on('toolbar(test)', function (obj) {
            var id = obj.config.id;
            var checkStatus = table.checkStatus(id);
            var othis = lay(this);
            switch (obj.event) {
                case 'getCheckData':
                    var data = checkStatus.data;
                    layer.alert(layui.util.escape(JSON.stringify(data)));
                    break;
                case 'getData':
                    var getData = table.getData(id);
                    console.log(getData);
                    layer.alert(layui.util.escape(JSON.stringify(getData)));
                    break;
                case 'LAYTABLE_TIPS':
                    layer.alert('自定义工具栏图标按钮');
                    break;
            }
            ;
        });
        // 表头自定义元素工具事件 --- 2.8.8+
        table.on('colTool(test)', function (obj) {
            var event = obj.event;
            console.log(obj);
            if (event === 'email-tips') {
                layer.alert(layui.util.escape(JSON.stringify(obj.col)), {
                    title: '当前列属性配置项'
                });
            }
        });

        // 触发单元格工具事件
        table.on('tool(test)', function (obj) { // 双击 toolDouble
            var form = layui.form;
            var data = obj.data; // 获得当前行数据
            var $ = layui.jquery;
            console.log(obj)
            // console.log(data.tel)
            if (obj.event === 'edit') {
                layer.open({
                    title: '编辑 - id:' + data.id,
                    type: 2,
                    area: ['60%', '95%'],
                    // content: '<div style="padding: 16px;"> </div>'
                    content: '<%=request.getContextPath()%>/' + 'adminUpdate.jsp?dept=' + data.dept,
                    end: function () { // layui 关闭弹框时的回调函数
                        table.reload('test', {
                            url: '/admin/getalladmin.do',
                            page: {
                                curr: 1 // 重新从第 1 页开始
                            },
                            // where: field // 搜索的字段
                        });
                    },
                    success: function (layero, index) {
                        //向layer页面传值，传值主要代码
                        var body = layer.getChildFrame('body', index);

                        //将弹窗页面中属性名name="fixure_id"的标签赋值
                        body.find("[name='id']").val(data.id);
                        body.find("[name='account']").val(data.account);
                        body.find("[name='name']").val(data.name);
                        body.find("[name='tel']").val(data.tel);
                        body.find("[name='email']").val(data.email);
                        body.find("[name='dept']").val(data.dept);
                        body.find("[name='intor']").val(data.intor);

                        form.on('submit(demo2)', function (data) {
                            var field = data.field; // 获得表单字段
                            console.log(field)
                            // 执行搜索重载
                            table.reload('test', {
                                url: 'getalladmin',
                                page: {
                                    curr: 1 // 重新从第 1 页开始
                                },
                                // where: field // 搜索的字段
                            });
                            return false; // 阻止默认 form 跳转
                        });
                    }
                });
            } else if (obj.event === 'more') {
                // 更多 - 下拉菜单
                dropdown.render({
                    elem: this, // 触发事件的 DOM 对象
                    show: true, // 外部事件触发即显示
                    data: [{
                        title: '查看',
                        id: 'detail'
                    }, {
                        title: '删除',
                        id: 'del'
                    }],
                    click: function (menudata) {
                        if (menudata.id === 'detail') {
                            layer.msg('查看操作，当前行 ID:' + data.id);
                        } else if (menudata.id === 'del') {
                            layer.confirm('真的删除行 [id: ' + data.id + '] 么', function (index) {
                                obj.del(); // 删除对应行（tr）的DOM结构
                                layer.close(index);
                                // 向服务端发送删除指令
                                $.ajax({
                                    url: '/admin/admindelete.do',
                                    type: 'post',
                                    data: 'id=' + data.id,
                                    success: function (data1) {
                                        if (data1 == 200) alert("删除成功")
                                        else alert("删除失败")
                                    }
                                })
                            });
                        }
                    },
                    align: 'right', // 右对齐弹出
                    style: 'box-shadow: 1px 1px 10px rgb(0 0 0 / 12%);' // 设置额外样式
                })
            }
        });

        // 触发表格复选框选择
        table.on('checkbox(test)', function (obj) {
            console.log(obj)
        });

        // 触发表格单选框选择
        table.on('radio(test)', function (obj) {
            console.log(obj)
        });

        // 行单击事件
        table.on('row(test)', function (obj) {
            //console.log(obj);
            //layer.closeAll('tips');
        });
        // 行双击事件
        table.on('rowDouble(test)', function (obj) {
            console.log(obj);
        });

        // 单元格编辑事件
        table.on('edit(test)', function (obj) {
            var field = obj.field; // 得到字段
            var value = obj.value; // 得到修改后的值
            var data = obj.data; // 得到所在行所有键值
            // 值的校验
            if (field === 'email') {
                if (!/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/.test(obj.value)) {
                    layer.tips('输入的邮箱格式不正确，请重新编辑', this, {tips: 1});
                    return obj.reedit(); // 重新编辑 -- v2.8.0 新增
                }
            }
            // 编辑后续操作，如提交更新请求，以完成真实的数据更新
            // …
            layer.msg('编辑成功', {icon: 1});

            // 其他更新操作
            var update = {};
            update[field] = value;
            obj.update(update);
        });

        var form = layui.form;
        // 搜索提交
        form.on('submit(demo-table-search)', function (data) {
            var field = data.field; // 获得表单字段

            // console.log(field)

            // 执行搜索重载
            table.reload('test', {
                url: '/admin/adminsearch.do',
                page: {
                    curr: 1 // 重新从第 1 页开始
                },
                where: field // 搜索的字段
            });

            // layer.msg('搜索成功', {
            //     // icon: 1,
            //     time: 2000 //2秒关闭（如果不配置，默认是3秒）
            // }, function(){
            //     //2秒后自动执行这里面的内容
            //     $.ajax({
            //         url:'adminsearch',
            //         type: 'post',
            //         data:field,
            //         success:function (data1) {
            //             if(data1 == 1) alert("修改成功")
            //             else alert("修改失败")
            //         }
            //     })
            // });
            return false; // 阻止默认 form 跳转
        });

    });

</script>
</body>
</html>

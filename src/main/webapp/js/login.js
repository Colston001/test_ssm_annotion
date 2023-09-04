    layui.use(['layer', 'form'], function () {
        var layer = layui.layer,
            form = layui.form;
    });

    var code;

    function createCode() {
        code = new Array();
        var codeLength = 4; //验证码的长度
        var checkCode = document.getElementById("checkCode");
        checkCode.value = "";
        var selectChar = new Array(2, 3, 4, 5, 6, 7, 8, 9, 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'J', 'K', 'L', 'M', 'N', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z');
        for (var i = 0; i < codeLength; i++) {
            var charIndex = Math.floor(Math.random() * 32);
            code += selectChar[charIndex];
        }
        if (code.length != codeLength) {
            createCode();
        }
        checkCode.value = code;
    }
$("#rememberPwd").click(function () {
    var flag = $("#rememberPwd").is(':checked');
    if (flag) {
        layer.open({
            type: 1,
            title: '温馨提示',
            skin: 'layui-layer-molv',
            content: $("#tip"),
            btn: ['哦', '取消'],
            btnAlign: 'c',
            closeBtn: 0,
            anim:6,
            shadeClose: true,
            area: ['300px', '120px'],
            btn1: function () {
                $("#rememberPwd").val("y");
                layer.closeAll();
            },
            btn2: function () {
                $("#rememberPwd").val("n");
                layer.closeAll();
                $("#rememberPwd").prop('checked',false);
            }
        },)
        // var remFlag = layer.confirm(
        //     '公共场所不建议记住密码，以防密码泄露，确认记住密码吗？',
        //     {icon: 3, anim: 6});
        // if (remFlag) {
        //     $("#rememberPwd").val("y");
        // } else {
        //     $("#rememberPwd").prop('checked',false);
        //     $("#rememberPwd").val("n");
        // }
    } else {
        $("#rememberPwd").val("n");
    }
});


    $("#btn_login").click(function () {
        var username = $("#u").val();
        var pwd = $("#p").val();
        var rememberPwd = $("#rememberPwd").val();
        var input = $("#test").val();
        var checkCode = $("#checkCode").val().toLowerCase();

        if (username == "") {
            layer.msg('用户名不能为空！亲', {icon: 5, anim: 6})
        } else {
            if (pwd == "") {
                layer.msg('请填写密码！', {icon: 5, anim: 6})
            } else {
                if (input == "") {
                    layer.msg('验证码不能为空！', {icon: 5, anim: 6})
                } else {

                    if (input == checkCode) {
                        // layer.msg('<i class="layui-icon layui-icon-loading"></i>')
                        layer.load(0,{shade: false});
                        setTimeout(function () {
                            $.ajax({
                                type: 'post',
                                url: '/login',
                                data: {"userName": username, "pwd": pwd, "rememberPwd": rememberPwd},
                                success: function (data) {
                                    if (data == '登录成功') {
                                        layer.msg(data, {icon: 1, anim: 1});
                                        setTimeout(function () {
                                            location.href = "home.html"
                                        }, 1000)
                                    } else {
                                        layer.msg(data, {icon: 5, anim: 6});
                                    }
                                },
                                error: function () {
                                    layer.msg('执行失败');
                                }

                            });
                        }, 500);
                    } else {
                        layer.msg('验证码输入有误！', {icon: 5, anim: 6});
                        createCode();
                    }
                }
            }
        }
    });
    $(function () {
        $("#checkCode").value(createCode());
    })
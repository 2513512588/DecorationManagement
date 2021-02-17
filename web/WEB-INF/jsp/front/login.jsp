<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <script src="${pageContext.request.contextPath}/js/jquery.js" ></script>

    <style>
        @import url(https://fonts.googleapis.com/css?family=Roboto:300);

        .login-page {
            width: 360px;
            padding: 8% 0 0;
            margin: auto;
        }
        .form {
            position: relative;
            z-index: 1;
            background: #FFFFFF;
            max-width: 360px;
            margin: 0 auto 100px;
            padding: 45px;
            text-align: center;
            box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
        }
        .form input {
            font-family: "Roboto", sans-serif;
            outline: 0;
            background: #f2f2f2;
            width: 100%;
            border: 0;
            margin: 0 0 15px;
            padding: 15px;
            box-sizing: border-box;
            font-size: 14px;
        }
        .form button {
            font-family: "Roboto", sans-serif;
            text-transform: uppercase;
            outline: 0;
            background: #4CAF50;
            width: 100%;
            border: 0;
            padding: 15px;
            color: #FFFFFF;
            font-size: 14px;
            -webkit-transition: all 0.3 ease;
            transition: all 0.3 ease;
            cursor: pointer;
        }
        .form button:hover,.form button:active,.form button:focus {
            background: #43A047;
        }
        .form .message {
            margin: 15px 0 0;
            color: #b3b3b3;
            font-size: 12px;
        }
        .form .message a {
            color: #4CAF50;
            text-decoration: none;
        }
        .form .register-form {
            display: none;
        }
        .container {
            position: relative;
            z-index: 1;
            max-width: 300px;
            margin: 0 auto;
        }
        .container:before, .container:after {
            content: "";
            display: block;
            clear: both;
        }
        .container .info {
            margin: 50px auto;
            text-align: center;
        }
        .container .info h1 {
            margin: 0 0 15px;
            padding: 0;
            font-size: 36px;
            font-weight: 300;
            color: #1a1a1a;
        }
        .container .info span {
            color: #4d4d4d;
            font-size: 12px;
        }
        .container .info span a {
            color: #000000;
            text-decoration: none;
        }
        .container .info span .fa {
            color: #EF3B3A;
        }
        body {
            background: #76b852; /* fallback for old browsers */
            background: -webkit-linear-gradient(right, #76b852, #8DC26F);
            background: -moz-linear-gradient(right, #76b852, #8DC26F);
            background: -o-linear-gradient(right, #76b852, #8DC26F);
            background: linear-gradient(to left, #76b852, #8DC26F);
            font-family: "Roboto", sans-serif;
            -webkit-font-smoothing: antialiased;
            -moz-osx-font-smoothing: grayscale;
        }
    </style>
</head>
<body>

    <div class="login-page">
        <div class="form">
            <form class="register-form" onsubmit="return register.call(this)">
                <input type="text" name="username" required placeholder="用户名"/>
                <input type="password" name="password" required placeholder="密码"/>
                <input type="password" name="rePassword" required placeholder="确认密码"/>
                <input type="email" name="email" required placeholder="邮箱"/>
                <label style="display: flex; align-items: center; justify-content: space-between; margin-bottom: 15px">
                    <input type="text" maxlength="4" name="code" required placeholder="验证码" style="margin: 0" />
                    <img src="${pageContext.request.contextPath}/code" alt="验证码" onclick="this.src = '${pageContext.request.contextPath}/code?rd='+ new Date().getTime()">
                </label>
                <button type="submit">注册</button>
                <p class="message">已经注册? <a href="#">登录</a></p>
            </form>
            <form class="login-form" action="${pageContext.request.contextPath}/user/login" method="post">
                <input type="text" name="username" required placeholder="用户名"/>
                <input type="password" name="password" required placeholder="密码"/>
                <button type="submit">登录</button>
                <p class="message" style="color: darkred">${param.error != null ? '账号或密码错误!': ''}</p>
                <p class="message">还没有注册? <a href="#">注册账号</a></p>
            </form>
        </div>
    </div>

    <a href="${pageContext.request.contextPath}/manager/login" style="display: flex; justify-content: center">管理员登录</a>


    <script src="${pageContext.request.contextPath}/js/jquery.js" ></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>

    <script type="text/javascript">
        $('.message a').click(function(){
            $('form').animate({height: "toggle", opacity: "toggle"}, "slow");
        });

        function register(){
            if ($('input[name=password]').val() === $('input[name=rePassword]').val() ){
                $.post('${pageContext.request.contextPath}/user/register',$(this).serialize() , function (res){
                    if (res.success){
                        $.confirm({
                            title: '注册成功!',
                            content: '',
                            type: 'orange',
                            typeAnimated: true,
                            buttons: {
                                tryAgain: {
                                    text: '确定',
                                    btnClass: 'btn-red',
                                    action: function(){
                                        location.reload()
                                    }
                                }
                            }
                        });
                    }else{
                        $.confirm({
                            title: res.message,
                            content: '',
                            type: 'orange',
                            typeAnimated: true
                        });
                    }
                })
            }else{
                $.confirm({
                    title: '两次密码输入不一致!',
                    content: '',
                    type: 'orange',
                    typeAnimated: true
                });
            }
            return false
        }
    </script>

</body>
</html>
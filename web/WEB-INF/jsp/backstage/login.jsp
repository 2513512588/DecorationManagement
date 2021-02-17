<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style type="text/css">
        /* config.css */

        :root {
            --baseColor: #606468;
        }

        /* helpers/align.css */

        .align {
            display: grid;
            -webkit-box-align: center;
            -ms-flex-align: center;
            align-items: center;
            justify-items: center;
            place-items: center;
        }

        /* helpers/grid.css */

        .grid {
            width: 90%;
            margin-left: auto;
            margin-right: auto;
            max-width: 20rem;
        }

        /* helpers/hidden.css */

        .hidden {
            border: 0;
            clip: rect(0 0 0 0);
            height: 1px;
            margin: -1px;
            overflow: hidden;
            padding: 0;
            position: absolute;
            width: 1px;
        }

        /* helpers/icon.css */

        :root {
            --iconFill: var(--baseColor);
        }

        .icons {
            display: none;
        }

        .icon {
            height: 1em;
            display: inline-block;
            fill: #606468;
            fill: var(--iconFill);
            width: 1em;
            vertical-align: middle;
        }

        /* layout/base.css */

        :root {
            --htmlFontSize: 100%;

            --bodyBackgroundColor: #2c3338;
            --bodyColor: var(--baseColor);
            --bodyFontFamily: "Open Sans";
            --bodyFontFamilyFallback: sans-serif;
            --bodyFontSize: 0.875rem;
            --bodyFontWeight: 400;
            --bodyLineHeight: 1.5;
        }

        * {
            -webkit-box-sizing: inherit;
            box-sizing: inherit;
        }

        html {
            -webkit-box-sizing: border-box;
            box-sizing: border-box;
            font-size: 100%;
            font-size: var(--htmlFontSize);
        }

        body {
            background-color: #2c3338;
            background-color: var(--bodyBackgroundColor);
            color: #606468;
            color: var(--bodyColor);
            font-family: "Open Sans", sans-serif;
            font-family: var(--bodyFontFamily), var(--bodyFontFamilyFallback);
            font-size: 0.875rem;
            font-size: var(--bodyFontSize);
            font-weight: 400;
            font-weight: var(--bodyFontWeight);
            line-height: 1.5;
            line-height: var(--bodyLineHeight);
            margin: 0;
            min-height: 100vh;
        }

        /* modules/anchor.css */

        :root {
            --anchorColor: #eee;
        }

        a {
            color: #eee;
            color: var(--anchorColor);
            outline: 0;
            text-decoration: none;
        }

        a:focus,
        a:hover {
            text-decoration: underline;
        }

        /* modules/form.css */

        :root {
            --formFieldMargin: 0.875rem;
        }

        input {
            background-image: none;
            border: 0;
            color: inherit;
            font: inherit;
            margin: 0;
            outline: 0;
            padding: 0;
            -webkit-transition: background-color 0.3s;
            -o-transition: background-color 0.3s;
            transition: background-color 0.3s;
        }

        input[type="submit"] {
            cursor: pointer;
        }

        .form {
            margin: calc(0.875rem * -1);
            margin: calc(var(--formFieldMargin) * -1);
        }

        .form input[type="password"],
        .form input[type="text"],
        .form input[type="submit"] {
            width: 100%;
        }

        .form__field {
            display: -webkit-box;
            display: -ms-flexbox;
            display: flex;
            margin: 0.875rem;
            margin: var(--formFieldMargin);
        }

        .form__input {
            -webkit-box-flex: 1;
            -ms-flex: 1;
            flex: 1;
        }

        /* modules/login.css */

        :root {
            --loginBorderRadus: 0.25rem;
            --loginColor: #eee;

            --loginInputBackgroundColor: #3b4148;
            --loginInputHoverBackgroundColor: #434a52;

            --loginLabelBackgroundColor: #363b41;

            --loginSubmitBackgroundColor: #ea4c88;
            --loginSubmitColor: #eee;
            --loginSubmitHoverBackgroundColor: #d44179;
        }

        .login {
            color: #eee;
            color: var(--loginColor);
        }

        .login label,
        .login input[type="text"],
        .login input[type="password"],
        .login input[type="submit"] {
            border-radius: 0.25rem;
            border-radius: var(--loginBorderRadus);
            padding: 1rem;
        }

        .login label {
            background-color: #363b41;
            background-color: var(--loginLabelBackgroundColor);
            border-bottom-right-radius: 0;
            border-top-right-radius: 0;
            padding-left: 1.25rem;
            padding-right: 1.25rem;
        }

        .login input[type="password"],
        .login input[type="text"] {
            background-color: #3b4148;
            background-color: var(--loginInputBackgroundColor);
            border-bottom-left-radius: 0;
            border-top-left-radius: 0;
        }

        .login input[type="password"]:focus,
        .login input[type="password"]:hover,
        .login input[type="text"]:focus,
        .login input[type="text"]:hover {
            background-color: #434a52;
            background-color: var(--loginInputHoverBackgroundColor);
        }

        .login input[type="submit"] {
            background-color: #ea4c88;
            background-color: var(--loginSubmitBackgroundColor);
            color: #eee;
            color: var(--loginSubmitColor);
            font-weight: 700;
            text-transform: uppercase;
        }

        .login input[type="submit"]:focus,
        .login input[type="submit"]:hover {
            background-color: #d44179;
            background-color: var(--loginSubmitHoverBackgroundColor);
        }

        /* modules/text.css */

        p {
            margin-top: 1.5rem;
            margin-bottom: 1.5rem;
        }

        .text--center {
            text-align: center;
        }
    </style>
    <script src="${pageContext.request.contextPath}/js/jquery.js" ></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>
</head>
<body class="align">

<div class="grid">

    <form action="" onsubmit="return login.call(this)" method="POST" class="form login">

        <div class="form__field">
            <label for="login__username">
                <svg class="icon">
                    <use xlink:href="#icon-user"></use>
                </svg>
                <span class="hidden">用户名</span></label>
            <input autocomplete="username" id="login__username" type="text" name="username" class="form__input"
                   placeholder="Username" value="ADMIN" required>
        </div>

        <div class="form__field">
            <label for="login__password">
                <svg class="icon">
                    <use xlink:href="#icon-lock"></use>
                </svg>
                <span class="hidden">密码</span></label>
            <input id="login__password" type="password" name="password" class="form__input" placeholder="Password"
                  value="123" required>
        </div>

        <div class="form__field">
            <input type="submit" value="Sign In">
        </div>

    </form>

    <script type="text/javascript" >
        function login(){
            $.post('${pageContext.request.contextPath}/manager/login',$(this).serialize() , function (res){
                if (res.success){
                   location.href = '${pageContext.request.contextPath}/backstage'
                }else{
                    $.confirm({
                        title: '账号或密码错误!',
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
                }
            })
            return false
        }
    </script>


</div>


</body>
</html>
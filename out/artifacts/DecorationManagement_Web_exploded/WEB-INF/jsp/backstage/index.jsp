<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>layout 后台大布局 - Layui</title>
    <base href="${pageContext.request.contextPath}/">
    <script type="text/javascript" src="js/jquery.js" ></script>
    <link rel="stylesheet" href="layui/css/layui.css">
    <link rel="stylesheet" href="css/backstage/index.css">
    <link rel="stylesheet" href="css/backstage/admin.css">
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">

    <div class="layui-header custom-header">
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item slide-sidebar" lay-unselect>
                <a href="javascript:void(0);" class="icon-font"><i class="ai ai-menufold"></i></a>
            </li>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:void(0);">BieJun</a>
                <dl class="layui-nav-child">
                    <dd><a href="">帮助中心</a></dd>
                    <dd><a href="login.html">退出</a></dd>
                </dl>
            </li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black custom-admin">
        <div class="layui-side-scroll">
            <div class="custom-logo">
<%--            <img src="http://localhost/mysql/images/server.png" alt="" />--%>
                <h1 style="margin-left: 30px">后台管理</h1>
<%--            <div class="layui-logo">layui 后台布局</div>--%>
            </div>

            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul id="nav" class="layui-nav layui-nav-tree"  lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed">
                    <a href="javascript:void(0);">
                        <i class="layui-icon">&#xe857;</i>
                        <em>用户管理</em>
                    </a>
                    <dl class="layui-nav-child">
                        <dd><a href="views/user/index.html">用户列表</a></dd>
                        <dd><a href="views/user/add.html">添加用户</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:void(0);">
                        <i class="layui-icon">&#xe857;</i>
                        <em>设计师管理</em>
                    </a>
                    <dl class="layui-nav-child">
                        <dd><a href="views/designer/index.html">设计师列表</a></dd>
                        <dd><a href="views/designer/add.html">添加设计师</a></dd>
                    </dl>
                </li>
            </ul>
        </div>
    </div>

    <!-- 主体 -->
    <div class="layui-body">
        <div class="layui-tab app-container" lay-allowClose="true" lay-filter="tabs">
            <ul id="appTabs" class="layui-tab-title custom-tab"></ul>
            <div id="appTabPage" class="layui-tab-content"></div>
        </div>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        © layui.com - 底部固定区域
    </div>
</div>
<script src="layui/layui.js"></script>
<script src="js/backstage/index.js"></script>
<script>
    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;

    });
</script>
</body>
</html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh">
<head>
    <title>Title</title>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <base href="${pageContext.request.contextPath}/"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="css/front/index.css">
</head>
<body>

<nav class="navbar navbar-dark bg-dark">
    <a class="navbar-brand">装修材料网</a>
    <div class="btn-group">
    <c:choose>
        <c:when test="${pageContext.request.userPrincipal.authenticated}">
            <button type="button" class="btn btn-primary">
                <security:authentication property="name"/> <span class="badge badge-light">I</span>
<%--                <span class="sr-only"></span>--%>
            </button>
            <security:authorize access="hasRole('ROLE_DESIGNER')">
                 <a href="${pageContext.request.contextPath}/addMaterial" class="btn btn-info">添加装修材料</a>
            </security:authorize>
            <a href="${pageContext.request.contextPath}/shopping/query" class="btn btn-info">购物车</a>
            <a href="${pageContext.request.contextPath}/order/query" class="btn btn-info">订单</a>
        </c:when>
        <c:otherwise>
            <a href="${pageContext.request.contextPath}/login" class="btn btn-primary">登录</a>
            <a href="${pageContext.request.contextPath}/login" class="btn btn-light">注册</a>
            <a href="${pageContext.request.contextPath}/backstage" class="btn btn-primary">后台管理</a>
        </c:otherwise>
    </c:choose>
</nav>

<div class="main-body">

    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel" style="margin: 20px 0">
        <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="https://cn.bing.com/sa/simg/hpb/LaDigue_EN-CA1115245085_1920x1080.jpg" class="d-block w-100"
                     alt="...">
            </div>
            <div class="carousel-item">
                <img src="https://cn.bing.com/sa/simg/hpb/LaDigue_EN-CA1115245085_1920x1080.jpg" class="d-block w-100"
                     alt="...">
            </div>
            <div class="carousel-item">
                <img src="https://cn.bing.com/sa/simg/hpb/LaDigue_EN-CA1115245085_1920x1080.jpg" class="d-block w-100"
                     alt="...">
            </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>

    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item active" aria-current="page">设计师</li>
        </ol>
    </nav>

    <div class="card-container">
        <c:forEach items="${designersMap.get('rows')}" var="designer">
            <div class="card">
                <img src="${designer.cover}" class="card-img-top" alt="...">
                <div class="card-body">
                    <h5 class="card-title">${designer.name}</h5>
                    <p class="card-text" style="font-size: 13px">${designer.description}</p>
                </div>
            </div>
        </c:forEach>
    </div>

    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item active" aria-current="page">装修材料推荐</li>
        </ol>
    </nav>

    <div class="card-container">
        <c:forEach items="${materialsMap.get('rows')}" var="groupItem" varStatus="status">
            <div class="card">
                <div id="carouselExampleCaptions${status.index}" class="carousel slide" data-ride="carousel">
                    <div class="carousel-inner">
                        <c:forEach items="${groupItem.materials}" var="imageItem" varStatus="status">
                            <div class="carousel-item ${status.index == 0 ? 'active' : ''}">
                                <img src="${imageItem.cover}" class="d-block w-100" alt="...">
                                <div class="carousel-caption d-none d-md-block">
                                    <h5>${imageItem.name}</h5>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    <a class="carousel-control-prev" href="#carouselExampleCaptions${status.index}" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#carouselExampleCaptions${status.index}" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
                <c:forEach items="${groupItem.materials}" var="infoItem">
                    <div class="card-body">
                        <h5 class="card-title">${infoItem.name}</h5>
                        <p class="card-text" style="margin-bottom: 0.3rem">描 述: ${infoItem.description}</p>
                        <p class="card-text" style="margin-bottom: 0.3rem">价 格：${infoItem.price}</p>
                    </div>
                </c:forEach>
                <div class="card-body">
                    <a href="javascript:addOrder(`${groupItem.groupId}`)" class="card-link">立即购买</a>
                    <a href="javascript:addscar(`${groupItem.groupId}`)" class="card-link">加入购物车</a>
                </div>
            </div>
        </c:forEach>
    </div>

    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js" ></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>
    <script type="text/javascript" >

        function addscar(id){
            $.post(`${pageContext.request.contextPath}/shopping/create/`+ id,function (res){
                if (res.success){
                    $.confirm({
                        title: '添加成功',
                        content: '',
                        type: 'orange',
                        typeAnimated: true,
                        buttons: {
                            tryAgain: {
                                text: '确定',
                                btnClass: 'btn-red',
                                action: ()=>{
                                   location.href = '${pageContext.request.contextPath}/shopping/query'
                                }
                            }
                        }
                    });
                }else{
                    $.confirm({
                        title: res.message,
                        type: 'orange',
                        typeAnimated: true,
                        buttons: {
                            tryAgain: {
                                text: '确定',
                                btnClass: 'btn-red',
                                action: ()=>{
                                    location.href = '${pageContext.request.contextPath}/login'
                                }
                            }
                        }
                    });
                }
            })
        }

        function addOrder(id){
            $.post(`${pageContext.request.contextPath}/order/create/`+ id,function (res){
                if (res.success){
                    $.confirm({
                        title: '购买成功',
                        content: '',
                        type: 'orange',
                        typeAnimated: true,
                        buttons: {
                            tryAgain: {
                                text: '确定',
                                btnClass: 'btn-red',
                                action: ()=>{
                                    location.href = '${pageContext.request.contextPath}/order/query'
                                }
                            }
                        }
                    });
                }else{
                    $.confirm({
                        title: res.message,
                        type: 'orange',
                        typeAnimated: true,
                        buttons: {
                            tryAgain: {
                                text: '确定',
                                btnClass: 'btn-red',
                                action: ()=>{
                                    location.href = '${pageContext.request.contextPath}/login'
                                }
                            }
                        }
                    });
                }
            })
        }

    </script>

</div>

<div class="jumbotron jumbotron-fluid" style="margin-bottom: 0; margin-top: 2rem; background-color:#474C4B;">
    <div class="container">
        <h1 class="display-4">装修材料网</h1>
        <p class="lead">(c) Copyright 2021 HHY. All Rights Reserved. </p>
    </div>
</div>

</body>
</html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <a class="navbar-brand">Navbar</a>
    <div class="btn-group">
        <a href="login.html" class="btn btn-primary">登录</a>
        <a href="login.html" class="btn btn-light">注册</a>
    </div>
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

        <c:forEach items="${materialsMap.get('rows')}" var="material">
            <div class="card">
                <div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
                    <div class="carousel-inner">
                        <c:forEach items="${material.materials}" var="imageItem">
                            <div class="carousel-item">
                                <img src="${imageItem.cover}" class="d-block w-100" alt="..." width="100%">
                                <div class="carousel-caption d-none d-md-block">
                                    <h5>${imageItem.name}</h5>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
                <c:forEach items="${material.materials}" var="infoItem">
                    <div class="card-body">
                        <h5 class="card-title">${infoItem.name}</h5>
                        <p class="card-text" style="margin-bottom: 0.3rem">描 述: ${infoItem.description}</p>
                        <p class="card-text" style="margin-bottom: 0.3rem">价 格：${infoItem.price}</p>
                    </div>
                </c:forEach>
                <div class="card-body">
                    <a href="#" class="card-link">立即购买</a>
                    <a href="#" class="card-link">加入购物车</a>
                </div>
            </div>
        </div>
    </c:forEach>


</div>

<div class="jumbotron jumbotron-fluid" style="margin-bottom: 0; margin-top: 2rem; background-color:#474C4B;">
    <div class="container">
        <h1 class="display-4">Fluid jumbotron</h1>
        <p class="lead">This is a modified jumbotron that occupies the entire horizontal space of its parent.</p>
    </div>
</div>

</body>
</html>

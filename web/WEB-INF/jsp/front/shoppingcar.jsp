<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" ></script>
    <style>
        body{
            margin: 0;
            font-family: microsoft JhengHei,sans-serif !important;
        }

        table, tr, td, th{
            /* border: 1px solid blue; */
            padding: 5px;
            text-align: center;
            box-sizing: content-box;
        }
        table{
            width: 100% !important;
            table-layout: fixed;
        }
        .shoppingCar th{
            background-color: #E5B280;
        }
        th,td{
            overflow: hidden;
            text-overflow: ellipsis;
            nowrap: false;
        }
        tr{
            box-shadow: 1px 2px 2px 2px #cccccc;
        }

        td button[type="button"]{
            background-color: transparent;
            border:2px blue none; outline:none;
        }

        .productName{
            color: black;
        }

        .noItem{
            position: absolute;
            /* top: 50%; */
            left: 50%;
            margin: 0 0 0 -240px;
        }

        .noItemCar{
            margin: 100px;
        }

        .quantity input{
            width: 100%;
        }

        .shoppingCar{
            padding: 0 !important;
        }

        .spc input{
            width: 100%;
        }

        select{
            width: 100%;
        }

        .img_area{
            background-color: black;
            height: 130px;
            display: flex;
            align-items: center;
        }
        .img_Preview{
            width: 120%;
        }
        input[type="checkbox"]{
            position: relative;
            top: 5px;
            font-size: 20px;
            width: 18px;
            height: 18px;
        }

        .removeArea{
            margin: 50px 0;
        }

        .removeSelect{
            background-color: #556FFF;
            width: 150px;
            height: 30px;
            border: none;
            border-radius: 4px;
            color: white;
        }

        .checkout{
            background-color: #E6903B;
            width: 120px;
            height: 40px;
            color: white;
            border: none;
            border-radius: 4px;
        }


        /* ===失效=== */
        .failureArea th{
            background-color: lightgray;
        }
        .removeFailure{
            background-color: lightgray;
            width: 150px;
            height: 30px;
            margin: 50px 0;
            border: none;
            border-radius: 4px;
        }


        /* ====================搜尋列的css起點==================== */
        .search_area{
            width: 90%;
            vertical-align: middle;
            white-space: nowrap;
            position: relative;
            display: inline-block;
            margin-left: 5%;
            margin-bottom: 50px;
            margin-top: 50px;
        }
        .search_area input#search{
            width: 100%;
            height: 40px;
            font-size: 10pt;
            float: left;
            color: #63717f;
            padding-left: 10px;
            border-radius: 20px;
            display: block;
            border: solid 1px;
            transition: background .55s ease;
        }
        .search_area input#search::-webkit-input-placeholder {
            color: #65737e;
        }
        .search_area input#search:-moz-placeholder { /* Firefox 18- */
            color: #65737e;
        }
        .search_area input#search::-moz-placeholder {  /* Firefox 19+ */
            color: #65737e;
        }
        .search_area input#search:-ms-input-placeholder {
            color: #65737e;
        }
        .search_area .searchIcon{
            max-width: auto;
            display: fixed;
            position: absolute;
            right: 10px;
            top: 8px;
            z-index: 1;
            color: #4f5b66;
        }
        .search_area input#search:hover, .search_area input#search:focus, .search_area input#search:active{
            outline:none;
            background: #f0f0f0;
        }
        /* ====================搜尋列的css終點=============================== */

    </style>

    <script src="${pageContext.request.contextPath}/js/jquery.js" ></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>
    <!-- Font Awesome CSS-->
    <link href="https://cdn.bootcss.com/font-awesome/5.13.0/css/all.css" rel="stylesheet">


</head>
<body>


<div class="container">
    <div class="row">
        <div class="col-md-6">
            <div class="search_area">
                <h3><i class="fas fa-shopping-cart" style="font-size:2em"></i>购物车</h3>
            </div>
        </div>
    </div>


    <div class="row itemTable justify-content-center">
        <div class="col-12 shoppingCar">
            <table>
                <tr>
                    <th style="width: 6%;"><input class="selectAll" type="checkbox" name="" value=""></th>
                    <th>预览图</th>
                    <th>材料名称</th>
                    <th>数量</th>
                    <th>小计</th>
                    <th style="width: 7%;">刪除</th>
                </tr>

                <!-- =======================商品======================= -->
               <c:forEach items="${scars}" var="shoppingItem" varStatus="status">
                   <tr>
                       <td><input class="selectOne" type="checkbox" name="" value=""></td>
                       <td>
                           <div class="img_area">
                               <div id="carouselExampleCaptions${status.index}" class="carousel slide" data-ride="carousel">
                                   <div class="carousel-inner">
                                       <c:forEach items="${shoppingItem.materialVO.materials}" var="imageItem" varStatus="status">
                                           <div class="carousel-item ${status.index == 0 ? 'active' : ''}">
                                               <img src="${imageItem.cover}" class="d-block w-100" alt="...">
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
<%--                               <a href="#"><img class="img_Preview" src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRlHYMzh5mYwX_ag7DrgR2NrWYb8PGvDd2gkM2OW4AoO2VDVmbY&usqp=CAU" alt=""></a>--%>
                           </div>
                       </td>
                       <td>
                           <ul class="list-group">
                               <c:forEach items="${shoppingItem.materialVO.materials}" var="materialItem">
                                   <li class="list-group-item">
                                       <a class="productName" data-product_ID="${materialItem.groupId}" href="#">${materialItem.name}</a>
                                   </li>
                               </c:forEach>
                           </ul>
                       </td>
                       <td>
                           <div class="quantity">
                              <span>${shoppingItem.total}</span>
                           </div>
                       </td>
                       <td class="subtotal">${shoppingItem.price * shoppingItem.total}</td>
                       <td>
                           <button class="removeOne" type="button" name="button">
                               <i class="fas fa-trash-alt" style="font-size:1.5em"></i>
                           </button>
                       </td>
                   </tr>
               </c:forEach>

            </table>
        </div>
    </div>

    <div class="row clearItem justify-content-center">
        <div class="col">
            <div class="removeArea">
                <button class="removeSelect" type="button" name="button">刪除勾选的商品</button>
                <hr>
            </div>
        </div>
    </div>
    <div class="row checkoutArea justify-content-end">
        <div class="col-md-4">
            <div class="">
                <a>购买(</a>
                <a class="sumQuantity"></a>
                <a>)个商品</a>
                <a>，统计&yen; </a>
                <a class="sumPrice"></a>
            </div>
        </div>
        <div class="col-md-2">
            <div class="">
                <button class="checkout" type="button" name="button">确认结账</button>
                <hr>
            </div>
        </div>
    </div>

</div>

<script type="text/javascript">

    //結帳
    $(".checkout").on("click", function(){
        if($(".selectOne:checked").length === 0){
            $.confirm({
                position: 'top-end',
                icon: 'warning',
                title: '请选选中需要结算的商品',
                showConfirmButton: false,
                timer: 1500
            });
        }else {
            $(".selectOne:checked").each(function(index, item){
                let product_ID = $(this).closest("tr").find(".productName").attr("data-product_ID");
                $.post('${pageContext.request.contextPath}/order/create/' + product_ID)
            });
            location.href = '${pageContext.request.contextPath}/order/query'
        }
    });

    // 刪除勾選的商品
    $(".removeSelect").on("click", function(){
        if($(".selectOne:checked").length>0){
            $.confirm({
                title: '确定删除勾选的商品吗?',
                content: '',
                type: 'orange',
                typeAnimated: true,
                buttons: {
                    tryAgain: {
                        text: '确定',
                        btnClass: 'btn-red',
                        action: function(){
                            $(".selectOne:checked").each(function(){
                                removeProduct($(this).closest('tr').find('.productName').attr('data-product_ID'), ()=>{
                                    $(this).closest("tr").remove();
                                    reverseCheckbox();
                                })
                            });
                            location.reload()
                        }
                    },
                    close: function () {
                    }
                }
            });
        }
    });

    //刪除單一商品
    $(".removeOne").on("click", function(){
        $.confirm({
            title: '确定删除勾选的商品吗?',
            content: '',
            type: 'orange',
            typeAnimated: true,
            buttons: {
                tryAgain: {
                    text: '确定',
                    btnClass: 'btn-red',
                    action: ()=>{
                        removeProduct($(this).closest('tr').find('.productName').attr('data-product_ID'), ()=>{
                            $(this).closest("tr").remove();
                            if($(".failureItem").length<1){
                                // $(".failureArea").remove();
                                // $(".gap").remove();
                                location.reload()
                            }
                        })
                    }
                },
                close: function () {
                }
            }
        });

    });



    // checkbox全選
    $(".selectAll").on("click", function(){
        $(".selectOne").each(function(){
            $(".selectOne").prop("checked", $(".selectAll").prop("checked"))
        });
    });

    // reverseCheckbox
    function reverseCheckbox(){
        if($(".selectOne").length>0){
            if($(".selectOne").length === $(".selectOne:checked").length){
                $(".selectAll").prop("checked", true);
            }else {
                $(".selectAll").prop("checked", false);
            }
        }else {
            $(".selectAll").prop("checked", false);
        }
    }



    $(document).on("change", function(){
        prepareCheckout();
        reverseCheckbox();
    });


    // 選中的商品結算
    function prepareCheckout(){
        let price = 0;
        let count = 0;
        $(".sumPrice").html(0);
        $(".sumQuantity").html(0);
        $(".selectOne:checked").each(function(){
            price += parseInt($(this).closest("tr").find(".subtotal").html());
            count += parseInt($(this).closest("tr").find(".quantity>span").html());
            $(".sumPrice").html(price);
            $(".sumQuantity").html(count);
        });
    }

    function removeProduct(id, fn){
        $.post(`${pageContext.request.contextPath}/shopping/remove/`+ id , function (res){
            if (res.success){
                fn && fn()
            }
        })
    }


</script>


</body>
</html>
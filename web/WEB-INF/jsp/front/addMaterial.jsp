<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <base href="${pageContext.request.contextPath}/" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" ></script>
    <link rel="stylesheet" href="css/front/index.css">
    <script type="text/javascript" src="js/jquery.js" ></script>
</head>
<body>

 <div class="main-body">
     <nav aria-label="breadcrumb">
         <ol class="breadcrumb">
             <li class="breadcrumb-item active" aria-current="page">添加材料组</li>
         </ol>
     </nav>

     <form onsubmit="return submitForm.call(this)" enctype="multipart/form-data">
         <button type="submit" class="btn btn-primary">保存</button>
         <button type="button" class="btn btn-primary" onclick="addItem(this)">添加材料</button>
         <div style="margin: 20px 0">
             <div class="form-group">
                 <label>材料名字</label>
                 <input name="name" type="text" required class="form-control" >
             </div>
             <div class="form-group">
                 <label>材料价格</label>
                 <input name="price" type="number" required class="form-control">
             </div>
             <div class="form-group">
                 <label>材料描述</label>
                 <input name="description" type="text" required class="form-control">
             </div>
             <div class="form-group">
                 <label>材料封面</label>
                 <input name="file" type="file" required class="form-control-file">
             </div>
         </div>
     </form>
 </div>

    <script type="text/javascript" >
        function addItem(e){
            let button = document.createElement('button')
            button.innerText = "删除此材料"
            button.classList.add('btn')
            button.classList.add('btn-danger')
            button.type = 'button'
            button.onclick = function (){
                this.parentNode.parentNode.removeChild(this.parentNode)
            }
            let form = e.parentNode.querySelector('div').cloneNode(true)
            form.querySelectorAll('input').forEach(item => item.value = '')
            form.appendChild(button)
            e.parentNode.appendChild(form)
        }

        function submitForm(){
            $.ajax({
                url: "./material/create",
                type: "POST",
                data: new FormData(this),
                processData: false,  // 不处理数据
                contentType: false,   // 不设置内容类型
                success: function (res){
                    if (res.success){

                    }
                }
            });
            return false
        }

    </script>

</body>
</html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>🐟的员工管理后台</title>
    <link rel="Shortcut Icon" href="/static/img/fish.png" />
    <meta name="_csrf" th:content="${_csrf.token}"/>
    <meta name="_csrf_header" th:content="${_csrf.headerName}"/>

    <!-- Bootstrap Core CSS -->
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.4/css/bootstrap.min.css">
    <link rel="stylesheet" href="http://cdn.bootcss.com/font-awesome/4.4.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="http://cdn.bootcss.com/ionicons/2.0.1/css/ionicons.min.css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script src="//cdn.bootcss.com/jquery/2.1.4/jquery.min.js"></script>
    <script src="//cdn.bootcss.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>

    <style>
        .login-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        form {
            background-color: #f2f2f2;
            border-radius: 5px;
            padding: 20px;
            box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.1);
            height: 50%;
            width: 60%;
        }

        h1 {
            text-align: center;
            margin-bottom: 20px;
            color: #555;
        }

        .input-field {
            margin: 20px auto;
            width: 80%;
        }

        label {
            display: block;
            margin-bottom: 5px;
            color: #333;
        }

        input[type=text], input[type=password] {
            width: 100%;
            padding: 10px;
            border-radius: 5px;
            border: none;
            background-color: #e6ffff;
            color: #555;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }

        button[type=submit] {
            display: block;
            margin: 0 auto;
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: all 0.3s ease-in-out;
        }

        #login_btn {
            background-color: #007bff;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
        }

        .loading {
            display: none;
            width: 20px;
            height: 20px;
            margin-left: 10px;
            border-radius: 50%;
            border: 2px solid rgba(255, 255, 255, .3);
            border-top-color: #fff;
            animation: spin 1s linear infinite;
        }

        @keyframes spin {
            to { transform: rotate(360deg); }
        }


    </style>

</head>
<body>

<div class="login-container">
    <form action="${pageContext.request.contextPath}/login" method="post" id="login_form">
        <h1>✨Login✨</h1>
        <div class="input-field">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" placeholder="default:admin" value="${sessionScope.user.username}">
        </div>
        <div class="input-field">
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" placeholder="default:fish" value="${sessionScope.user.password}">
        </div>
        <button type="submit" id="login_btn">Sign in</button>
        <span class="loading"></span>
    </form>
</div>


<script type="text/javascript">
    $(document).ready(function() {
        $("#login_btn").click(function () {
            var $btn = $(this);
            console.log("clicked!!");

            // 禁用登录按钮和表单
            $btn.prop('disabled', true);
            // $('#login_form input').prop('disabled', true);

            // 显示 loading 图标
            $btn.siblings('.loading').show();

            // 修改按钮文本
            $btn.html('Loading...');

            // 延迟 2 秒后进行登录操作
            setTimeout(function() {
                $.ajax({
                    url: "/hrms/dologin",
                    type: "POST",
                    data: $("#login_form").serialize(),
                    headers: { "X-Requested-With": "XMLHttpRequest" }, // 设置header
                    success: function (result, status, xhr) {
                        console.log(result); // 在控制台中输出返回的 result 对象
                        if (result.code == 100) { // 操作成功，跳转到主页
                            window.location.href = "/hrms/main";
                        } else if (result.code == 200) { // 操作失败，继续停留在登录页面
                            alert(result.msg);
                        }
                    },
                    error: function(xhr, status, error) {
                        if (xhr.status == 401) {
                            alert("您还未登录，请先登录！");
                            window.location.href = "/hrms/login"; // 跳转到登录页
                        } else {
                            console.log("An error occurred: " + error);
                        }
                    },
                    complete: function() {
                        // 隐藏 loading 图标
                        $btn.siblings('.loading').hide();

                        // 修改按钮文本
                        $btn.html('登录');

                        // 启用登录按钮和表单
                        $btn.prop('disabled', false);
                        $('#login_form input').prop('disabled', false);
                    }
                });
            }, 2000);
        });
    });

</script>


</body>
</html>

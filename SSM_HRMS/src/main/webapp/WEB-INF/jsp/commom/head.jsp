<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    <link rel="Shortcut Icon" href="/static/img/fish.png" />
    <!-- Above 3 meta tags *must* be placed first in the head; any other head content must come *after* these tags -->
    <title>🐟的员工管理后台</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <style>
        .hrms_brand_nav {
            margin-bottom: 1%;
        }

        .navbar {
            background-color: #198754;
            border: none;
        }


        .navbar-brand {
            display: inline-block;
            vertical-align: middle;
            font-size: 26px;
            font-weight: bold;
            margin-top: 5px;
        }
        .dropdown-menu img {
            display: inline-block;
            vertical-align: middle;
            margin-right: 5px;
        }



    </style>
</head>
<body>
<div class="hrms_brand_nav">
    <nav class="navbar navbar-inverse navbar-static-top">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#hrms-navbar-collapse-1" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" id="company_logo" href="#" style="color: white; display: inline-block; vertical-align: middle; margin-top: 5px;">🐟の员工管理后台</a>
            </div>

            <div class="collapse navbar-collapse" id="hrms-navbar-collapse-1">

                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false" style="color: white">账号管理 <span class="caret"></span></a>
                        <ul class="dropdown-menu nav nav-pills nav-stacked">
                            <li class="active">
                                <a href="#">
                                     <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> ${sessionScope.user.username}
                                    <img src="https://q2.qlogo.cn/headimg_dl?dst_uin=${sessionScope.user.email}&spec=100&amp;spec=100" alt="Avatar" width="20" height="20" style="border-radius: 50%; margin-right: 5px;">
                                </a>
                            </li>
                            <li><a href="#" id="image_update" class="edit-email-btn"><span class="glyphicon glyphicon-user" aria-hidden="true" data-toggle="modal" data-target=".edit-email-modal"></span> 头像更换</a></li>
                            <li><a href="#" id="hrms_logout"><span class="glyphicon glyphicon-off" aria-hidden="true"></span> 账号退出</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</div>
<!-- 引入模态框页面 -->
<%@ include file="../emailUpdate.jsp"%>

<script type="text/javascript">
    //主页面
    $("#company_logo").click(function () {
        $(this).attr("href", "/hrms/main");
    });
    //账号退出
    $("#hrms_logout").click(function () {
        window.location.href = "/hrms/logout";
    });
</script>
</body>
</html>

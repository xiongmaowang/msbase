<!DOCTYPE html>
<html>
<head>
    <title> 艋顺科技</title>
    <meta name="layout" content="main">
</head>

<body class="fixed-sidebar full-height-layout gray-bg" style="overflow:hidden">
<!--全部内容都在wrapper 容器内-->
<div id="wrapper">
    <!--左侧导航开始-->
    <nav class="navbar-default navbar-static-side" role="navigation">
        <div class="nav-close">
            <i class="fa fa-times-circle"></i>
        </div>
        <div class="sidebar-collapse">
            <ul class="nav" id="side-menu">
                <li class="nav-header">
                    <div class="dropdown profile-element">
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                            <span class="clear">
                                <span class="block m-t-xs" style="font-size:20px;">
                                    <i class="fa fa-area-chart"></i>
                                    <strong class="font-bold">${user.getFormattedName()}</strong>
                                </span>
                            </span>
                        </a>
                    </div>
                    <div class="logo-element">
                        ${user.getFormattedName()}
                    </div>
                </li>
                <li class="hidden-folded padder m-t m-b-sm text-muted text-xs">
                    <span class="ng-scope">分类</span>
                </li>
                <ms:menu/>

            </ul>
        </div>
    </nav>
    <!--左侧导航结束-->
    <!--右侧部分开始-->
    <div id="page-wrapper" class="gray-bg dashbard-1">
        <!--右侧悬浮导航条-->
        <div class="row border-bottom">
            <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0" id="set_color" data-color="">
                <div class="navbar-header navbar_define">
                    <a class="navbar-minimalize minimalize-styl-2 btn btn-info navbar-text" href="#">
                        <i class="fa fa-bars"></i>
                    </a>
                    <!--面包线导航-->
                    <ol class="breadcrumb pull-left">
                        <li>主页</li>
                    </ol>
                </div>
                <ul class="nav navbar-top-links navbar-right">
                    <!--信箱-->
                    <li class="dropdown">
                        <a class="dropdown-toggle count-info" data-toggle="dropdown" href="#">
                            <i class="fa fa-envelope"></i>
                            <span class="label label-warning">16</span>
                        </a>
                        <ul class="dropdown-menu dropdown-messages">
                            <li class="m-t-xs">
                                <div class="dropdown-messages-box">
                                    <a href="profile.html" class="pull-left">
                                        <img alt="image" class="img-circle" src="${request.getContextPath()}/assets/a7.jpg">
                                    </a>
                                    <div class="media-body">
                                        <small class="pull-right">46小时前</small>
                                        <strong>小四</strong> 是不是只有我死了,你们才不骂爵迹
                                        <br>
                                        <small class="text-muted">3天前 2014.11.8</small>
                                    </div>
                                </div>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <div class="dropdown-messages-box">
                                    <a href="profile.html" class="pull-left">
                                        <img alt="image" class="img-circle" src="${request.getContextPath()}/assets/a4.jpg">
                                    </a>
                                    <div class="media-body ">
                                        <small class="pull-right text-navy">25小时前</small>
                                        <strong>二愣子</strong> 呵呵
                                        <br>
                                        <small class="text-muted">昨天</small>
                                    </div>
                                </div>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <div class="text-center link-block">
                                    <a class="J_menuItem" href="mailbox.html">
                                        <i class="fa fa-envelope"></i>
                                        <strong> 查看所有消息</strong>
                                    </a>
                                </div>
                            </li>
                        </ul>
                    </li>
                    <!--心想提示-->
                    <li class="dropdown remind">
                        <a class="dropdown-toggle count-info" data-toggle="dropdown" href="#">
                            <i class="fa fa-bell"></i>
                            <span class="label label-primary total">0</span>
                        </a>
                        <ul class="dropdown-menu dropdown-alerts">
                            <li class="ms-message">
                                <a href="mailbox.html">
                                    <div>
                                        <i class="fa fa-envelope fa-fw"></i> 您有<span class="count">16</span>条未读消息
                                        <span class="pull-right text-muted small time-difference"></span>
                                    </div>
                                </a>
                            </li>
                            <li class="divider"></li>
                            <li class="reply">
                                <a href="profile.html">
                                    <div>
                                        <i class="fa fa-qq fa-fw"></i> <span class="count">16</span>条新回复
                                        <span class="pull-right text-muted small time-difference"></span>
                                    </div>
                                </a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <div class="text-center link-block">
                                    <a class="J_menuItem" href="notifications.html" data-iframe-btn="notifications">
                                        <strong>查看所有 </strong>
                                        <i class="fa fa-angle-right"></i>
                                    </a>
                                </div>
                            </li>
                        </ul>
                    </li>
                </ul>
            </nav>
            <div class="width_js">
                <!--可关闭的按钮-->
                <div class="tab_box">
                </div>
            </div>
        </div>
        <!--右侧切换内容区域-->
        <div class="row J_mainContent" id="content-main">

        </div>
    </div>
    <!--右侧部分结束-->
%{--    <div class="set">
        <a class="animated bounceInUp set_color">
            <i class="fa fa-wrench"></i>
        </a>
    </div>
    <div class="set_skin">
        <i class="fa fa-hand-o-right hand_close fa-lg"></i>
        <ul id="set_skin_box" class="list-unstyled clearfix J_setSkins" data-set='{"show_items":3,"define_items":["#fba","#afc","#fac"],"define_title":["淡粉","淡绿","未知"]}'>
            <h2 class='control-sidebar-heading no-margin'>Skins</h2>
        </ul>
    </div>--}%
</div>
</body>
</html>

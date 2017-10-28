<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>文档管理</title>
    <meta name="keywords" content="文档,管理,文档管理" />
    <meta name="description" content="让文档管理变得简单" />
	<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE11" />
    <meta name="renderer" content="webkit"/>
	<asset:link rel="shortcut icon" href="logo.ico" type="images/x-icon" />
	<asset:link rel="icon" href="logo.ico" type="images/x-icon" />
	<asset:link href="index.css" rel="stylesheet"/>
</head>

<body>
<!--首页展示背景图-->
    <div id="login">
		<img src="${request.getContextPath()}/assets/index.jpg" alt=""/>
    </div>
    <!--首页登录框-->
    <div class="login_container">
    <form action='${postUrl}' method='POST' id='loginForm' class='login-form' autocomplete='off'>
	        <div class="login_user">
	            <span class="login_left">用&nbsp;&nbsp;户&nbsp;&nbsp;名:</span>
	            <span class="login_right">
	                <input type='text' name='j_username' id='username' class="login_input"  placeholder="请输入用户名"  required/>
	            </span>
	        </div>
	        <div class="login_pwd">
	            <span class="login_left">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码:</span>
	             <span class="login_right">
	             <input type='password'  name='j_password' id='password' class="login_pwd" placeholder="请输入密码" required />
	             </span>
	        </div>
		<p class="login_title"> ${flash.message?flash.message:""}</p>
	        <p class="login_btn"> 
	            <input type='submit' id="submit" value='登录' class="login_control"  />
				<input  type='button' class="login_set" value="重置" onclick="reset()">
	        </p>
	  </form>
	  </div>
	<asset:javascript  src="jquery.min.js"/>
	<asset:javascript  src="jquery.fullbg.js"/>
	<script type="text/javascript">
		reset = function () {
			$("#password").val("")
			$("#username").val("")
		}
		$(window).load(function() {
			$("#login img").fullBg();
		});
	</script>
</body>
</html>

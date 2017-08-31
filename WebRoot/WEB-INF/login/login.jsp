<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>京东-欢迎登录</title>
    
	<link rel="stylesheet" type="text/css" href="bootstrap/css/login.css">
	<script src="bootstrap/js/jquery.min.js" type="text/javascript"></script>
	<script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	
<script>
	$(document).ready(function(e) {
// 		$(".login-tab")click(function(){
// 		});
		$("#imagecode").click(function(){
			$(this).attr("src","randomImage?" + Math.random());
		});
		$(":button").click(function(e){
			$.ajax({
				type:"post",
				url:"doLogin",
				data:$("#form").serialize(),
				dataType:"text",
				success:function(data){
					if(data == "success"){
						window.location.href = "index" ;
					} else if(data == "showDetail"){
						window.location.href = "showDetail" ;
					} else{
						alert(data);
						$("#imagecode").attr("src","randomImage?" + Math.random());
					}
				}
			});
		});
	});
</script>
		
  </head>
  <style>
		#logo b{
			width: 110px;
			height: 40px;
			position: absolute;
			right: 0;
			top: 10px;
			background: url(image/login/welcome.png) no-repeat;
			display: block;
		}
		#logo-right b{
			width: 18px;
			height: 14px;
			margin: 0 5px;
			background: url(image/login/q-icon.png) no-repeat;
			display: inline-block;
			overflow: hidden;
			vertical-align: middle;
		}
	</style>
	<body>
		<!-- 第一层：logo -->
		<div id="frist-head">
			<div class="w">
				<!-- 第一层：左侧logo -->
				<div id="logo">  
					<a href="//www.jd.com/">
						<img src="image/login/jd-logo.png" alt="京东"/>
					</a>
					<b></b>
				</div>
				<div id="logo-right">
					<a href="#" target="_blank">
						<b></b> 登录页面，调查问卷
					</a>
				</div>
			</div>
		</div>
		<!-- 第二层：主体内容 -->
		<div id="second-content">
			<div id="content">
				<div class="content-bg" style="background-color: #F2F2F2">
					<div class="w">
						<div id="bg-img">
							<img src="image/login/content-bg.jpg" alt="手机京东"/>
						</div>
					</div>
				</div>
				<div class="w">
					<div class="content-form">
						<div class="login-tab  login-table-left">  	<!-- 登录表单顶部 -->
							<a href="javascript:void(0)" >扫码登录</a>
						</div>
						<div class="login-tab login-table-right">
							<a href="javascript:void(0)" >账户登录</a>
						</div>
						
						<div class="form-input">			<!-- 登录表单中部 -->
							<form id="form"   >
								<div class="row" >
									<div class="login-info">用户名：</div>
									<input type="text" name="username" id="userName" class="i-txt" placeholder="邮箱/用户名/已验证手机" />
								</div>
								<div class="row">
									<div class="login-info">密&nbsp;&nbsp;码：</div>
									<input type="password" name="password" id="pwd" class="i-txt" placeholder="密码" />
								</div>
								<div class="row" >
									<div class="login-info"> 验证码：</div>
									<input type="text" name="iRand" id="image-input" class="i-txt"  placeholder="请输入验证码" style="width:100px" />
									<div id="randomImage">
										<img src="randomImage" id="imagecode" />
									</div>
								</div>
								<div id="safe-forget">
									<a href="#">忘记密码？</a>
								</div>
								<input type="button" value="登&nbsp;&nbsp;&nbsp;&nbsp;录" id="user-login"/>
							</form>
						</div>
						
						<div class="from-bottom">			<!-- 登录表单底部 -->
							<ul>
								<li>
									<a href="#"  class="QQ-link">
										<img src="image/login/QQ-icon.jpg" class="QQ-icon"/>
										<span>  QQ </span>
									</a>
									<span class="div-line"> | </span>
								</li>
								<li>
									<a href="#" class="weixin-link">
										<img src="image/login/weixin.png" class="weixin-icon"/>
										<span>&nbsp; 微信 </span>
									</a>
								</li>
								<li class="regist">
									<a href="register" class="regist-link">
										<img src="image/login/register.png" class="regist-icon"/>
										<span> 立即注册 </span>
									</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 第一层：统一信息 -->
		<div id="third-footer">
			<div class="w">
				<div class="links">
					<a href="#">关于我们</a>
					|
					<a href="#">联系我们</a>
					|
					<a href="#">人才招聘</a>
					|
					<a href="#">商家入驻</a>
					|
					<a href="#">广告服务</a>
					|
					<a href="#">手机京东</a>
					|
					<a href="#">友情链接</a>
					|
					<a href="#">销售联盟</a>
					|
					<a href="#">京东社区</a>
					|
					<a href="#">京东公益</a>
					|
					<a href="#">English Site</a>
				</div>
			</div>
			
			<div class="copyright">
            	Copyright © 2004-2017  京东JD.com 版权所有
			</div>
		</div>
	</body>
</html>

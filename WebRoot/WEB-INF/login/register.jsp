<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>个人注册</title>
    
	<link rel="stylesheet" type="text/css" href="bootstrap/css/register.css">
	<script src="bootstrap/js/jquery.min.js" type="text/javascript"></script>
	<script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<%
	String sRand = (String) request.getSession().getAttribute("sRand");
 %>	
<script>
$(document).ready(function(e) {
	$("#imgAuthCode").click(function(){
		$(this).attr("src","randomImage?" + Math.random());
	});
	$("#sumbit").click(function(e){
		$.ajax({
			type:"post",
			url:"doRegister",
			data:$("#register-form").serialize(),
			dataType:"text",
			success:function(data){
				if(data == "success"){
					alert("注册成功！");
					window.location.href = "index" ;
				} else{
					alert(data);
					$("#imagecode").attr("src","randomImage?" + Math.random());
				}
			}
		});
	});
	$("form").submit(function(e){
		var username = $("#form-account").val();
		if(username == "") {
			alert("用户名不能为空！");
			return false;
		}
		var pwd = $("#form-pwd").val();
		if(pwd == ""){
			alert("密码不能为空！");
			return false;
		} 
		if(pwd.length < 6){
			alert("密码必须大于或等于6位！");
			return false;
		}
		var repwd = $("#form-equalTopwd").val();
		if(repwd != pwd){
			alert("两次输入的密码不一致！");
			return false;
	   }
	   var phone = $("#form-phone").val();
       if(phone.length==0) { 
          alert('请输入手机号码！'); 
          return false; 
       }     
       if(phone.length!=11) { 
           alert('请输入有效的手机号码！'); 
           return false; 
       } 
       var iRand = $("#authCode").val();
       if(iRand == "") {
			alert("请输入验证码！");
			return false;
	   }
// 	   var reg = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/; 
// 	   if(!reg.test(phone)) { 
// 	      alert('请输入有效的手机号码！'); 
// 	      return false; 
// 	  } 
			return true;
		});
	});
</script>
<style>
.header .logo, .i-company, .i-def, .i-error, .i-error1, .i-global, .i-suc {
  background: url(image/register/icon.png) no-repeat;
}
.form-item-phone .arrow {
    background: url(image/register/icon.png) no-repeat;
    width: 15px;
    height: 15px;
    display: inline-block;
    margin-top: 15px;
    margin-left: 5px;
    background-position: -2px -151px;
}
.i-company {
   background: url(image/register/icon.png) no-repeat;
}
.i-company {
    background-position: 0 -50px;
}
.i-global {
    background-position: -50px -50px;
}
</style>	
  </head>

<body>
	<!-- 第一层：logo -->		
	<div id="form-header" class="header" style="background: url(image/register/headbg.jpg) repeat-x left bottom;">
	    <div class="logo-con w clearfix">
	        <a href="//www.jd.com" class="logo">
	        </a>
	        <div class="logo-title">欢迎注册</div>
	        <div class="have-account">已有账号？
	         <a href="login">请登录</a>
	         </div>
	    </div>
	</div>
	<!-- 第二层：内容 -->		
	<div class="container w">
		<div class="main clearfix" id="form-main">
			<div class="reg-form fl">
				<form action="doRegister" id="register-form" method="post" onsubmit="return">
					<input type="hidden" name="new" value="new_person_reg" />
					 <input type="hidden" id="localmisc" name="localmisc" value="" /> 
					 <input type="hidden" name="regType" id="regType" value="person" />
					 <input type="hidden" name="uuid" id="uuid" value="3430ab19-4f7d-4d61-8e73-e8a5d0fd67ff" />
					 <input type="hidden" name="verifymc" id="verifymc" value="" /> 
					 <input type="hidden" name="emailMg" id="emailMg" /> 
					 <input type="hidden" name="authcodeMg" id="authcodeMg" /> 
					 <input type="hidden" name="state" id="state" value="" /> 
					 <input type="hidden" name="tgId" id="tgId" value="" />
					 <input type="hidden" name="eid" id="eid" value="" />
					 <input type="hidden" name="fp" id="sessionId" value="" /> 
					 <input type="hidden" id="jcloud" name="jcloud" value="" /> 
					 <input type="hidden" id="ucJcloud" name="ucJcloud" value="" /> 
					 <input type="hidden" id="jcloud2" name="jcloud2" value="jcloud21497769625856" /> 
					 <input type="hidden" value="-1" id="hnschool" class="hide" /> 
					 <input type="hidden" id="schoolid" name="schoolid" class="hide" /> 
					 <input type="hidden" name="jYpGlnHtDL" value="YisAe" />
					 <!--chrome autocomplete off bug hack-->
					 <input style="display:none" name="hack" /> 
					 <input type="password" style="display:none" name="hack1" />

					<div class="form-item form-item-account" id="form-item-account">
						<label>用 户 名</label>
					    <input type="text" id="form-account" name="username" class="field" autocomplete="off" maxlength="20"
							placeholder="您的账户名和登录名" default='<i class="i-def"></i>支持中文、字母、数字、“-”“_”的组合，4-20个字符' /> 
						<i class="i-status"></i>
					</div>
					<div class="input-tip">
						<span></span>
					</div>
					<div class="form-item">
						<label>设 置 密 码</label> 
						<input type="password" name="password" id="form-pwd" class="field" maxlength="20" 
						placeholder="建议至少使用两种字符组合" default="<i class=i-def>
						</i>建议使用字母、数字和符号两种及以上的组合，6-20个字符" />
						<i class="i-status"></i>
					</div>
					<div class="input-tip">
						<span></span>
					</div>
					<div class="form-item">
						<label>确 认 密 码</label>
						<input type="password" name="pwdRepeat" id="form-equalTopwd" class="field"
							placeholder="请再次输入密码" maxlength="20" default='<i class="i-def"></i>请再次输入密码' />
						 <i class="i-status"></i>
					</div>
					<div class="input-tip">
						<span></span>
					</div>
					<div class="item-phone-wrap">
						<div class="form-item form-item-phone">
							<label class="select-country" id="select-country" country_id="0086">
								中国 0086
								<a href="javascript:void(0) " tabindex="-1" class="arrow"></a>
							</label>
							 <input type="text" id="form-phone" name="phone" class="field" 
								placeholder="建议使用常用手机" autocomplete="off" maxlength="11"
								default='<i class="i-def"></i>完成验证后，你可以用该手机登录和找回密码' />
								<i class="i-status"></i>
						</div>
						<div class="input-tip">
							<span></span>
						</div>
					</div>
					<div class="form-item form-item-authcode">
						<label>验 证 码</label> 
						<input type="text" autocomplete="off" name="iRand" id="authCode" maxlength="6"
							class="field form-authcode" placeholder="请输入验证码" default='<i class="i-def"></i>看不清？点击图片更换验证码' />
						<img src="randomImage" class="img-code" title="换一换" id="imgAuthCode"  />
					</div>
					<div class="input-tip">
						<span></span>
					</div>
					<div class="form-item form-item-phonecode">
						<label>手机验证码</label> 
						<input type="text" name="mobileCode" maxlength="6" id="phoneCode" class="field phonecode"
							placeholder="请输入手机验证码" autocomplete="off" />
						<button id="getPhoneCode" class="btn-phonecode" type="button">获取验证码</button>
						<i class="i-status"></i>
					</div>
					<div class="input-tip">
						<span></span>
					</div>
					<div class="form-agreen">
						<div>
							<input type="checkbox" name="agreen" checked="" />
								阅读并同意
							<a href="javascript:;" id="protocol">《京东用户注册协议》</a>
							<a href="javascript:;" class="blue" id="privacyProtocolTrigger">《隐私政策》</a>
						</div>
						<div class="input-tip">
							<span></span>
						</div>
					</div>
					<div>
						<button type="button" class="btn-register" id="sumbit">立即注册</button>
					</div>
				</form>
			</div>
			<div id="form-company" class="reg-other">
				<div class="company-reg">
					<a href="../reg/company" target="_blank" clstag="pageclick|keycount|201612011|3">
						<i class="i-company"></i>
						<span>企业用户注册</span>
					</a>
				</div>
				<div class="inter-cust">
					<a href="//reg.joybuy.com/reg/person.html" target="_blank"
						clstag="pageclick|keycount|201612011|4">
						 <i class="i-global"></i>
						<span>INTERNATIONAL<br />CUSTOMERS</span> 
					</a>
				</div>
			</div>
		</div>
	</div>
	<!-- 底层：统一信息 -->
	<div id="form-footer" class="footer w">
	    <div class="links">
	        <a rel="nofollow" target="_blank" href="//www.jd.com/intro/about.aspx"> 关于我们</a>|
	        <a rel="nofollow" target="_blank" href="//www.jd.com/contact/">联系我们</a>|
	        <a rel="nofollow" target="_blank" href="//zhaopin.jd.com/">人才招聘</a>|
	        <a rel="nofollow" target="_blank" href="//www.jd.com/contact/joinin.aspx">商家入驻</a>|
	        <a rel="nofollow" target="_blank" href="//www.jd.com/intro/service.aspx">广告服务</a>|
	        <a rel="nofollow" target="_blank" href="//app.jd.com/">手机京东</a>|
	        <a target="_blank" href="//club.jd.com/links.aspx">友情链接</a>|
	        <a target="_blank" href="//media.jd.com">销售联盟</a>|
	        <a href="//club.jd.com/" target="_blank">京东社区</a>|
	        <a href="//gongyi.jd.com" target="_blank">京东公益</a>|
	        <a target="_blank" href="//en.jd.com/" clstag="pageclick|keycount|20150112ABD|9">English Site</a>
	    </div>
	    <div class="copyright">
	        Copyright&copy;2004-2016&nbsp;&nbsp;京东JD.com&nbsp;版权所有
	    </div>
	</div>
   </body>
</html>

<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>main-左侧</title>
    
	<script src="bootstrap/js/jquery.min.js" type="text/javascript"></script>
	<script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" type="text/css"></link>

	<style>
	*{
  		margin:0;
  		padding:0;
 	 }
  	.nav-left{
  		margin:0 10px;
		width:400px;
		height:400px;
  	}
  	.panel-heading{
  		text-align:center;
  	}
  	.panel-title{
  		font-size:22px;
  		font-weight:700;
  		font-family:"楷体";
  	}
  	.panel-body{
  		font-size:18px;
  		font-weight:400;
  		font-family:"宋体";
  		text-align:center;
  	}
  	.container .a{
  		text-decoration: none;
  	}
  	.panel-group .panel{
  		width:280px;
  	}
  </style>
  </head>
  
  <body>
	<div class="nav-left">
	<div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column" style="border:1px solid #ccc">
				<div class="panel-group" id="panel-172668">
					<div class="panel panel-default">
						<div class="panel-heading">
							 <a class="panel-title" data-toggle="collapse" data-parent="#panel-172668" 
							 href="#user">
								用户管理
							</a>
						</div>
						<div id="user" class="panel-collapse collapse in">
							<div class="panel-body">
								<a href="user" target="right">查看用户</a>
							</div>
						</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading">
							 <a class="panel-title" data-toggle="collapse" data-parent="#panel-172668" href="#product">
							 	商品管理
							 </a>
						</div>
						<div id="product" class="panel-collapse collapse">
							<div class="panel-body">
								<a href="searchProduct" target="right">查看商品</a>
							</div>
						</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading">
							 <a class="panel-title" data-toggle="collapse" data-parent="#panel-172668" href="#order">
							 	订单管理
							 </a>
						</div>
						<div id="order" class="panel-collapse collapse">
							<div class="panel-body">
								<a href="order" target="right">查看订单</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
  </body>
</html>

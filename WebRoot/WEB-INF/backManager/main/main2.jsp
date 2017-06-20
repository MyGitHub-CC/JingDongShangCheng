<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>京东商城后台管理信息系统</title>
    
	<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" type="text/css"></link>
    <script src="bootstrap/js/jquery.min.js" type="text/javascript"></script>
	<script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
  </head>
  <style>
  	*{
  		margin:0;
  		padding:0;
 	 }
  	#head {
  		width:100%;
  		height:100px;
  		background-color:#4B9DDD;
  	}
  	.w{
  		width:1000px;
  		margin:0 auto;
  	}
  	.title{
  		font-size:46px;
  		font-weight:700;
  		font-family:"楷体";
  		color:#fff;
  		padding: 10px;
  		letter-spacing:8px;
  		text-align:center;
  	}
  	.nav-left{
		width:400px;
		height:800px;
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
  </style>
  <body>
  	<!-- 顶部标题 -->
  	<div id="head">
  		<div class="w">
	  		<div class="title">
	  			京东商城信息管理系统
	  		</div>
  		</div>
  	</div>
    <!-- 中间内容 -->
    <div id="container" style="background-color:#fff;" >
    		<div class="nav-left">
    				<div class="container">
						<div class="row clearfix">
							<div class="col-md-3 column" style="border:1px solid blue">
								<div class="panel-group" id="panel-172668">
									<div class="panel panel-default">
										<div class="panel-heading">
											 <a class="panel-title" data-toggle="collapse" data-parent="#panel-172668" href="#panel-element-933794">
												用户管理
											</a>
										</div>
										<div id="panel-element-933794" class="panel-collapse collapse in">
											<div class="panel-body">
												查看用户
											</div>
										</div>
									</div>
									<div class="panel panel-default">
										<div class="panel-heading">
											 <a class="panel-title" data-toggle="collapse" data-parent="#panel-172668" href="#panel-element-951351">
											 	商品管理
											 </a>
										</div>
										<div id="panel-element-951351" class="panel-collapse collapse">
											<div class="panel-body">
												查看商品
											</div>
										</div>
									</div>
								</div>
							</div>
							
							<div class="col-md-9 column" style="border:1px solid blue">
								<div style="line-height:30px;" >
									<ul class="breadcrumb" >
										<li>
											 <a href="#">Home</a>
										</li>
										<li>
											 <a href="#">Library</a>
										</li>
										<li class="active">
											Data
										</li>
									</ul>
								</div>
								<div class="jumbotron">
									<table class="table table-bordered table-hover table-condensed  table-striped">
										<thead>
											<tr class="info">
												<th>编号</th>
												<th>产品</th>
												<th>交付时间</th>
												<th>状态 </th>
											</tr>
										</thead>
										<tbody>
											<%for(int i = 0; i < 10; i++){%>
											<tr>
												<td><%=i+1 %></td>
												<td> TB - Monthly </td>
												<td> 01/04/2012 </td>
												<td> Default </td>
											</tr>
											<% } %>
										</tbody>
									</table>
										<div  style="margin-left:180px;">	
											<ul class="pagination" >
												<li>
													 <a href="#">首页</a>
												</li>
												<li>
													 <a href="#">上一页</a>
												</li>
												<%for(int i = 0; i < 5; i++){%>
												<li>
													 <a href="#"><%=i+1 %></a>
												</li>
												<% } %>
												<li>
													 <a href="#">下一页</a>
												</li>
												<li>
													 <a href="#">尾页</a>
												</li>
											</ul>
										</div>
									  </div>
										<div class="btn-group" style="margin-left:620px;">
											 <button class="btn btn-primary" type="button">
												新增
											</button> 
											 <button class="btn btn-primary" type="button">
											 	修改
											 </button> 
											 <button class="btn btn-primary" type="button">
											 	删除
											 </button> 
											 <button class="btn btn-primary" type="button">
											 	查询
											 </button>
										</div>
								   </div>
								</div>
							</div>
    		
    		
    		
    		
    				
    				
    	</div>
    </div>		
  </body>
</html>

<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>添加商品</title>
    
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" type="text/css"></link>
	<script src="bootstrap/js/jquery.min.js" type="text/javascript"></script>
	<script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>

  </head>
  <style>
  .col-md-5 {
  	text-align:right;
  	line-height:30px;
  	letter-spacing: 3px;
  }
  </style>
  <body>
	<div class="row clearfix" >
		<div class="col-md-8 column" >
				<form action="userAdd" method="post" enctype="multipart/form-data" class="form-horizontal" role="form">
					<div class="form-group">
						<div class="col-md-5 column" >
						 	<label>名称 :</label>
						 </div>
					 	<div class="col-md-7 column" >
						 	<input type="text" name="name" class="form-control" id="exampleInputEmail1" />
						 </div>
					</div>
						<div class="form-group">
						<div class="col-md-5 column" >
						 	<label>价格：</label>
						 </div>
						<div class="col-md-7 column" >
							 <input type="text" name="password" class="form-control" id="exampleInputPassword1" />
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-5 column" >
							<label>作者 ：</label>
						</div>
						<div class="col-sm-7 radio">
							 <input type="text" name="password" class="form-control" id="exampleInputPassword1" />
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-5 column" >
						 	<label>库存：</label>
						 </div>
						<div class="col-md-7 column" >
							 <input type="text" name="phone" class="form-control" id="exampleInputPassword1" />
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-5 column" style="text-align:right;" >
							 <label>种类：</label>
						</div>
						<div class="col-md-7 column" >
							<input type="text" name="address" class="form-control" id="exampleInputPassword1" />
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-5 column" >
						 	<label>出版社：</label>
						 </div>
						<div class="col-md-7 column" >
							 <input type="text" name="address" class="form-control" id="exampleInputPassword1" />
						</div>
					</div>
						<div class="form-group">
						<div class="col-md-5 column" >
						 	<label>介绍：</label>
						 </div>
						<div class="col-md-7 column" >
							 <input type="text" name="address" class="form-control" id="exampleInputPassword1" />
						</div>
					</div>
						<div class="form-group">
						<div class="col-md-5 column" >
						 	<label>详图：</label>
						 </div>
						<div class="col-md-7 column" >
							 <input type="text" name="address" class="form-control" id="exampleInputPassword1" />
						</div>
					</div>
					<div style="margin-left:300px;">
						<div class="checkbox">
							 <label><input type="checkbox" />我同意 </label>
						</div> 
						<br/>
						<button type="submit" class="btn btn-primary">保 存</button>
					</div>
				</form>
			</div>
		</div>
  </body>
</html>

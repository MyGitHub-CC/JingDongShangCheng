<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>添加用户</title>
    
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
		<div class="col-md-8 column" style="margin:10px 0px;">
				<form action="userAdd" method="post" enctype="multipart/form-data" class="form-horizontal" role="form">
					<div class="form-group">
						<div class="col-md-5 column" >
						 	<label>用户名 :</label>
						 </div>
					 	<div class="col-md-7 column" >
						 	<input type="text" name="username" class="form-control" id="exampleInputEmail1" />
						 </div>
					</div>
						<div class="form-group">
						<div class="col-md-5 column" >
						 	<label>密 码：</label>
						 </div>
						<div class="col-md-7 column" >
							 <input type="password" name="password" class="form-control" id="exampleInputPassword1" />
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-5 column" >
								<label>性 别 ：</label>
						</div>
						<div class="col-sm-7 radio">
							<label style="margin-right: 20px;">
							<input type="radio" name="sex" value="男" checked="checked" />男
							</label>
							<label>
							<input type="radio" name="sex" value="女" />女
							</label>
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-5 column" >
						 	<label>手机号码：</label>
						 </div>
						<div class="col-md-7 column" >
							 <input type="text" name="phone" class="form-control" id="exampleInputPassword1" />
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-5 column" style="text-align:right;" >
							 <label>照 片：</label>
						</div>
						<div class="col-md-7 column" >
							 <input type="file" name="myfile" id="File" class="form-control" />
						</div>
						<p class="help-block">
							  Example block-level help text here.
						</p>
					</div>
					<div class="form-group">
						<div class="col-md-5 column" >
						 	<label>联系地址：</label>
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

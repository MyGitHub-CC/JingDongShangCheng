<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>京东商城信息管理系统</title>
    
	<script src="bootstrap/js/jquery.min.js" type="text/javascript"></script>
	<script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" type="text/css"></link>

  <style>
 	*{
  		margin:0;
  		padding:0;
 	 }
 	 #main {
 	 	height:80px;
 	 }
  	#left, #right{
		height:490px;
  	}
  	
  </style>
  </head>
  <body>
    	<div id="main" class="row"> 
    		<iframe src="mainHeader" id="header" class="col-sm-12" scrolling="no" frameborder="0" style="height:110px;">
    		</iframe>
    	</div>
    	
    	<div class="row"> 
    	 	<div id="container" style="background-color:#ccc;" >
		    		<iframe src="mainLeft" id="left" class="col-sm-3" scrolling="no" frameborder="0">
		    		</iframe>
		    	
					<iframe src="user" id="right" name="right" class="col-sm-9" scrolling="no" frameborder="0">
					</iframe>   
   			</div> 	
    	</div>
    	
    	<div class="row"> 
    		<iframe src="mainFooter" id="footer" class="col-sm-12" scrolling="no" frameborder="0">
    		</iframe>
    	</div>
  </body>
</html>

<%@ page language="java" import="java.util.*,entity.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>我的订单</title>
    
	<link rel="stylesheet" type="text/css" href="bootstrap/css/userOrder.css">
	<script src="bootstrap/js/jquery.min.js" type="text/javascript"></script>
	<script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>

  </head>
  <%
  	List<Order> orders = (List<Order>) request.getAttribute("orders");
  	User user = (User)session.getAttribute("user");
  	String username = "";
    if(user != null){
    	username = user.getUsername();
    }
   %>
   
   <script>
   	$().ready(function(){
   		$(".send").click(function(){
   			var sId = $(this).attr("id");
   			var pId = "#pay" + sId;
   			var send = $(this).data("sendid");
   			var payment = $(pId).data("payid");
   			if(payment == 0 && send == 0){
   				location.href="payOrder?id=" + sId;
   			}else if(payment == 1 && send == 0){
   				payment = 0;
   			}else if(payment == 1 && send == 1){
   				send = 2;
   			}else if(payment == 1 && send == 2){
   				//send = 3;
   			}
   			$.ajax({
   				type:"post",
   				url:"ModifyOrderById",
   				data:"id=" + sId + "&payment="+payment+"&send="+send,
   				dateType:"text",
   				success: function(data){
   					if(data == "success"){
   						location.href="showOrder";
   					}
   				}
   			});
   		});
   	});
   </script>
  <body>
     <div id="frist-line">
		<div class="w">
			<div class="first-left">
				<ul>
					<li>送至：北京  &gt; </li>
				</ul>
			</div>
			<div class="first-right">
				<ul>
					<li class="fore1">
						<%
						if(username != ""){
					 %>
						<a href="login" class="fr-cursor" style="color:#F10215"><%=username %> ,</a>
					<% 
						} else { 
					%>
						<a href="login" class="fr-cursor">你好，请登录</a>
					<% } %>
						<a class="regist" href="register">免费注册</a>
					</li>
					<li class="space">&nbsp;|&nbsp;</li>
					<li class="fore2" >
						<a href="showOrder">我的订单</a>
					</li>
					<li class="space">&nbsp;|&nbsp;</li>
					<li class="fore3"><a>我的京东 &gt; </a></li>
					<li class="space">&nbsp;|&nbsp;</li>
					<li class="fore4"><a>京东会员</a></li>
					<li class="space">&nbsp;|&nbsp;</li>
					<li class="fore5"><a>企业采购</a></li>
					<li class="space">&nbsp;|&nbsp;</li>
					<li class="fore6">
						<img src="image/cart/logo-JD/phone-black.png"  style="float: left;"/> 
						<a style="float: left;">
							手机京东 &gt; 
						</a>
					</li>
					<li class="space">&nbsp;|&nbsp;</li>
					<li class="fore7"><a>关注京东  &gt; </a></li>
					<li class="space">&nbsp;|&nbsp;</li>
					<li class="fore8"><a>客户服务  &gt; </a></li>
					<li class="space">&nbsp;|&nbsp;</li>
					<li class="fore9"><a>网站导航  &gt; </a></li>
				</ul>
			</div>
		</div>
	</div>
	<div id="second-logo" style="background-image:url(image/userOrder/logo.jpg)">
		<div class="w2">
		</div>
	</div>
	<div id="container">
		<div class="w2">
			<div id="left">
				<dl class="fore1">
					<dt id="_MYJD_order">订单中心</dt>
					<dd class="fore" id="myOrder">
						<a href="" target="_self">我的订单</a>
					</dd>
					<dd class="fore" id="myActive">
						<a href="" target="_self">我的活动</a>
					</dd>
					<dd class="fore" id="_myComment">
						<a href="" target="_self">评价晒单</a>
					</dd>
			        <dd class="fore" id="myAlwaysbuy">
						<a href="" target="_self">我的常购商品</a>
					</dd>
				</dl>
				
				<dl class="fore1">
					<dt id="_MYJD_order">关注中心</dt>
					<dd class="fore" id="myOrder">
						<a href="#" target="_self">关注的商品</a>
					</dd>
					<dd class="fore" id="myActive">
						<a href="#" target="_self">关注的店铺</a>
					</dd>
					<dd class="fore" id="_myComment">
						<a href="#" target="_self">关注的专辑</a>
					</dd>
			        <dd class="fore" id="myAlwaysbuy">
						<a href="#" target="_self">关注的内容</a>
					</dd>
					<dd class="fore" id="myAlwaysbuy">
						<a href="" target="_self">关注的活动</a>
					</dd>
					<dd class="fore" id="myAlwaysbuy">
						<a href="#" target="_self">浏览历史</a>
					</dd>
				</dl>
			</div>
			<div id="right">
				<div class="title">
					<h3>我的订单</h3>
				</div>
				<div class="main">
					<div class="mt">
						<ul>
							<li><a class="allOrder">全部订单</a></li>
							<li>待付款</li>
							<li>待收货</li>
							<li>待评价</li>
						</ul>
					</div>
					<div class="md" >
						<div class="order-table" >
							<div>
								<div class="th" >
									<div style="width:300px;">&nbsp;&nbsp;&nbsp;我的订单</div>
									<div style="width:270px;">订单详情</div>
									<div style="width:110px;">收货人</div>
									<div style="width:128px;">金额</div>
									<div style="width:120px;">全部状态</div>
									<div style="width:120px;">操作</div>
								</div>
							</div>
							<%
								for(int i=0; i<orders.size();i++ ){
									List<Product> products = orders.get(i).getProducts();
							 %>
							<div>
								<div class="th th-td" >
									<div style="width:300px;">&nbsp;&nbsp;&nbsp;订单时间：</div>
									<div style="width:270px;">订单号：<%=orders.get(i).getOrderNum() %>
									&nbsp;&nbsp;&nbsp;京东</div>
									<div style="width:110px;"></div>
									<div style="width:128px;"></div>
									<div style="width:120px;"></div>
									<div style="width:120px;"></div>
								</div>
								<%
									for(int j = 0;j < products.size();j++){
								 %>
								<div class="content">
									<div style="width:300px;">
										<div class="p-img"><img src="photo/<%=products.get(j).getPhoto() %>"></div>
										<div class="p-msg">
											<div class="p-name"><%=products.get(j).getName() %></div>
											<div class="p-extra"><%if(products.get(j).getAuthor()!=null){
												out.print(products.get(j).getAuthor());}%></div>
											</div>
									</div>
									<div style="width:270px;">
										<div class="pro-num"><%=products.get(j).getNum() %></div>
									</div>
									<div style="width:110px;">
										<div class="pro-user"><%=user.getUsername() %></div>
									</div>
									<div style="width:123px;">
										<div class="pro-money"><%=products.get(j).getPrice() %></div>
									</div>
									<% 
									int payment = orders.get(i).getPayment();
									int send = orders.get(i).getSend();
									String status = "";
									String operate = "";
									if( payment == 0){
										status = "等待付款";
										operate = "立即付款";
									}else if(payment == 1){
										if( send == 0){
											status = "等待发货";
											operate = "取消订单";
										}else if(send == 1){
											status = "等待收货";
											operate = "确认收货";
										}else if(send == 2){
											status = "已完成";
											operate = "评价";
										}
									}
									%>
									<div style="width:120px;">
										<div class="pro-status" data-payid="<%=payment %>" 
												id="pay<%=orders.get(i).getId() %>" >
											<%=status %>
										</div>
									</div>
									<div style="width:120px;">
										<div class="pro-operate" >
											<a><button class="send"  data-sendid="<%=send %>"
											 id="<%=orders.get(i).getId() %>">
											<%=operate %></button></a>
										</div>
									</div>
								</div>
								<% } %>
							</div>
							<% } %>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
  </body>
</html>

<%@ page language="java" import="java.util.*,entity.*,java.text.DecimalFormat" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>购物车</title>
    
	<link rel="stylesheet" type="text/css" href="bootstrap/css/cart.css">
	<script src="bootstrap/js/jquery.min.js" type="text/javascript"></script>
	<script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	 <%
  		List<Cart> carts =(List<Cart>) request.getAttribute("carts");
  		User user = (User) session.getAttribute("user");
    	String username = "";
    	if(user != null){
    		username = user.getUsername();
    	}
  	 %>
	<script>
	$(document).ready(function(){
	   $("#toggle-all").click(
			function () {
				var ch = $("#toggle-all").is(':checked');
				var sum = 0;
				if(ch){
					$("[name='choose']").prop("checked", "checked");
					$("#").prop("checked", "checked");
					$("[name='choose']").each(function(index,element){
						if($(element).prop("checked") == true){
							var cellSum1 = $(this).parents("#cart-warp").children("#cart-list").children(".item-list").children(".item-list-dd").children(".cell-sum").children("strong").html();
							var cellSum = cellSum1.substr(1);
							sum = sum + parseInt(cellSum);
						}
					});
					$(".sumPrice").html(sum.toFixed(2));
					$(".amount-sum").children("em").html(<%=carts.size()%>);
				}else{
					$("[name='choose']").prop("checked", null);
					$("#toggle-checkboxes-down").prop("checked", null);
					$(".sumPrice").html(sum.toFixed(2));
					$(".amount-sum").children("em").html(0);
				}
			}
		);
		
		function sumPrice(){
			var sum = 0;
			var count = 0;
			$("[name='choose']").each(function(index,element){
				if($(element).prop("checked") == true){
					var cellSum1 = $(this).parents(".item-list").children(".item-list-dd").children(".cell-sum").children("strong").html();
					var cellSum = cellSum1.substr(1);
					sum = sum + parseInt(cellSum);
					count++;
				}
			});
			$(".sumPrice").html(sum.toFixed(2));
			$(".amount-sum").children("em").html(count);
		}
		
		$("[name='choose']").click(function () {
			sumPrice();
			
			if($(this).prop("checked") == false){
				$("#toggle-all").prop("checked", false);
				$("#toggle-checkboxes-down").prop("checked", false);
			} else {
				var flag = true;
				$("[name='choose']").each(function(index,element){
					if($(element).prop("checked")== false){
						flag = false;
						return;
					}
				});
				if(flag == true){
					$("#toggle-all").prop("checked","true");
					$("#toggle-checkboxes-down").prop("checked","true");
				}
			}
		});
		/*购物车加减商品*/
		$(".jia").click(
			function(){
				var obj = "#pro" + $(this).attr("data-pId");
				var num = $(obj).val() - 0 + 1;
				if(num >= 200){
					num = 199;
				}
				$(obj).val(num);
				
				var price1 = $(this).parents(".item-list").children(".item-list-dd").children(".cell-price").children("strong").html();
				price = price1.substr(1);
				var cellSum = parseInt(price) * parseInt(num);
				$(this).parents(".item-list").children(".item-list-dd").children(".cell-sum").children("strong").html("￥" + cellSum.toFixed(2));
				sumPrice();
				
				var proId = $(this).attr("data-pId");
				$.ajax({
					type:"post",
					url:"updateCart",
					data:"proId="+ proId+"&num="+num,
					dataType:"text",
					success:function(data){
						
					}
				});
			}
		);
		$(".jian").click(
			function(){
				var obj = "#pro" + $(this).attr("data-pId");
				var num = $(obj).val()- 0 - 1;
				if(num < 1){
					num = 1;
				}
				$(obj).val(num);
				
				var price1 = $(this).parents(".item-list").children(".item-list-dd").children(".cell-price").children("strong").html();
				price = price1.substr(1);
				var cellSum = parseInt(price) * parseInt(num);
				$(this).parents(".item-list").children(".item-list-dd").children(".cell-sum").children("strong").html("￥" + cellSum.toFixed(2));
				sumPrice();
				var proId = $(this).attr("data-pId");
				$.ajax({
					type:"post",
					url:"updateCart",
					data:"proId="+ proId+"&num="+num,
					dataType:"text",
					success:function(data){
						
					}
				});
			}
		);
		
		var oldNum = "";
		$(".buy-quantity").focus(
			function(){
			oldNum = $(this).val();
		});
		$(".buy-quantity").blur(function(){
			var newNum = $(this).val();
			var reg = /^[0-9]+$/;
			if(reg.test(newNum)== false) {
				$(this).val(1);
				return;
			}
			if(newNum < 1){
				newNum = 1;
			}
			if(newNum >= 200){
				newNum = 199;
			}
			$(this).val(newNum);
			var price1 = $(this).parents(".item-list").children(".item-list-dd").children(".cell-price").children("strong").html();
			price = price1.substr(1);
			var cellSum = parseInt(price) * parseInt(newNum);
			$(this).parents(".item-list").children(".item-list-dd").children(".cell-sum").children("strong").html("￥" + cellSum.toFixed(2));
			sumPrice();
		
			var proId = $(this).attr("data-pId");
			$.ajax({
				type:"post",
				url:"updateCart",
				data:"proId="+ proId+"&num="+newNum,
				dataType:"text",
				success:function(data){
				
				}
			});
		});
		
		/*点击a标签删除指定商品，并隐藏该层的div*/
		$(".deteleCart").click(function(){
			 var msg = "您真的确定要删除吗？"; 
			 if (confirm(msg) !=true){ 
			  	return false; 
			 }
			var sum = 0;
			  
			var obj = $(this).parents(".item-list");
			var proId = obj.attr("data-pId");
            $.ajax({
	           	type:"post",
	           	url:"deleteCart",
	           	data:"proId="+ proId,
	           	dataType:"text",
	           	success:function(data){
	           		if(data == "success"){
	           			$(obj).hide();
	           		}
	           	}
            });
        });
			/*鼠标移上变颜色事件*/
		$(".fr-cursor").hover(
			function(){
				$(this).css("cursor","pointer");
				$(this).css("color","#C81623");
			},
			function (){
				$(this).css("cursor","default");
				$(this).css("color","#666");
			}
		);
	
		$("#settle-btn").click(function(){
			var proIds = new Array();
			var i = 0;
			$("[name='choose']").each(function(index,element){
				if($(element).prop("checked") == true){
					proIds[i] = parseInt($(this).parents(".item-list").attr("data-pId"));
					i++;
				}
			});
			location.href="order?proIds=" + proIds;
		});
	
	});
	</script>
  </head>

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
						<a class="regist">免费注册</a>
					</li>
					<li class="space">&nbsp;|&nbsp;</li>
					<li class="fore2"><a>我的订单</a></li>
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
	<div id="second-line">
		<div class="w">
			<div id="logo-jd">
				<a><img src="image/cart/logo-JD/logo.png"/></a>
			</div>
			<div id="search">
				<div class="search-hide">
				</div>
				<input type="text" id="key" />
				<button >搜索</button>
			</div>
		</div>
	</div>
	<div id="clear"><span class="clr"></span></div>
	
	<div id="container">
		<div id="container-titile">
			<ul>
				<li>
					<a href="#">
						<h4>全部商品</h4>
						<span><%=carts.size() %></span>
					</a>
				</li>
			</ul>
		</div>
		
		<div id="cart-warp">
			<div class="cart-head">
				<div class="checkAll">
					<input type="checkbox"  id="toggle-all" checked="checked"/> 全选
				</div>
				<div class="column-goods">
					商品
				</div>
				<div class="column-price" >
					单价
				</div>
				<div class="column-quantity">
					数量
				</div>
				<div class="column-sum">
					小计
				</div>
				<div class="column-action">
					操作
				</div>
			</div>
			<div id="cart-list">
				<div class="shop">
					<div class="shop-left">
					</div>
					<div class="shop-left-2">
						<a id="shop-jd">
							<button>京东自营</button>
						</a>
					</div>
				</div>
				<!-- 购买物品1-->
				<% 
					DecimalFormat df = new DecimalFormat("######0.00");   
					for (Cart cart : carts) {
				 %>
				<div class="item-list" data-pId=<%=cart.getProduct().getId() %> >
					<div class="item-list-dt">
						<input type="checkbox" class="checked" name="choose" checked="checked"/>
					</div>
					<div class="item-list-dd">
						<div class="cell-book-img">
							<div class="p-cell-img">
								<a><img src="photo/<%=cart.getProduct().getPhoto()%>"/></a>
							</div>
							<div class="p-cell-text">
								<div class="text-top">
									<a><%=cart.getProduct().getIntroduce() %></a>
								</div>
								<div class="text-bottom">
									<br/>
									<img src="image/cart/shop-settle/seven-day.png"/><a>支持7天无理由退货</a>
									<br/>
									<img src="image/cart/shop-settle/libao.png"/>
									<span>选包装</span>
								</div>
							</div>
						</div>
						<div class="cell-color">
							颜色：蓝色
						</div>
						<div class="cell-price">
						<strong>￥<%=(cart.getProduct().getPrice()) %></strong>
						</div>
						<div class="cell-quantity">
							<a ><button class="jian" data-pId=<%=cart.getProduct().getId() %>>-</button></a>
							<input type="text" class="buy-quantity" value="<%=cart.getNum() %>" 
							id="pro<%=cart.getProduct().getId() %>" data-pId=<%=cart.getProduct().getId()%> />
							<a><button class="jia" data-pId=<%=cart.getProduct().getId() %>>+</button></a>
						</div>
						<div class="cell-sum">
							&nbsp;&nbsp; <strong style="font-size:14px;font-weight:700;">￥<%=df.format(cart.getProduct().getPrice() * cart.getNum()) %></strong>
						</div>
						<div class="cell-ops">
							<a data-proId="<%=cart.getProduct().getId() %>" class="deteleCart fr-cursor" >删除</a>
							<br/>
							<a>移动到我的关注</a>
							<br/>
							<a>加到我的关注</a>
						</div>
					</div>
				</div>
				<% } %>
			</div>
		</div>
			<div id="cart-floatbar">
				<div class="select-all">
					<input type="checkbox" checked="checked" id="toggle-checkboxes-down" />
					 &nbsp;全选
				</div>
				<div class="operation">
					<a>删除选中的商品</a>
					&nbsp;&nbsp;
					<a>移到我的关注</a>
					&nbsp;&nbsp;
					<a>清除下柜商品</a>
				</div>
				<div class="floatbar-right">
					<div class="commit-btn">
						<a>
							<input type="submit" name="settlement" id="settle-btn" value="去结算" />
						</a>
					</div>
					<div class="price-sum">
						总价：￥
						<span class="sumPrice">
							<%
								double sumPrice = 0;
								for(Cart cart : carts){
									sumPrice = sumPrice + (cart.getProduct().getPrice() * cart.getNum());
								}
							%>
							<%=df.format(sumPrice) %>
							
						</span>
						<br/>
						<span>已节省：-￥0.00</span>
					</div>
					<div class="amount-sum">
						已选择
						<em  style="font-size:14px;font-weight:700;"><%=carts.size() %></em>
						件商品	
					</div>
				</div>
			</div>
		</div>
	
	
	<div id="footer">
		<div class="slogen">
			<div class="item-fores">
				<div class="item-fore">
					<b>多</b>
					品类齐全  轻松购物
				</div>
				<div class="item-fore">
					<b>快</b>
					多仓直发 极速配送
				</div>
				<div class="item-fore">
					<b>好</b>
					正品行货 精致服务
				</div>
				<div class="item-fore">
					<b>省</b>
					天天低价 畅选无忧
				</div>
			</div>
		</div>
		<div class="w3">
			<dl class="fore1">
				<dt>购物指南</dt>
				<dd>
					<div>
						<a>购物流程</a>
					</div>
					<div>
						<a>会员介绍</a>
					</div>
					<div>
						<a>生活旅行/团购</a>
					</div>
					<div>
						<a>常见问题</a>
					</div>
					<div>
						<a>大家电</a>
					</div>
					<div>
						<a>联系客服</a>
					</div>
				</dd>
			</dl>
			<dl class="fore2">
				<dt>配送方式</dt>
				<dd>
					<div>
						<a>上门自提</a>
					</div>
					<div>
						<a>211限时达</a>
					</div>
					<div>
						<a>配送服务查询</a>
					</div>
					<div>
						<a>配送费收取标准</a>
					</div>
					<div>
						<a>海外配送</a>
					</div>
				</dd>
			</dl>
			<dl class="fore3">
				<dt>支付方式</dt>
				<dd>
					<div>
						<a>货到付款</a>
					</div>
					<div>
						<a>在线支付</a>
					</div>
					<div>
						<a>分期付款</a>
					</div>
					<div>
						<a>邮局汇款</a>
					</div>
					<div>
						<a>公司转账</a>
					</div>
				</dd>
			</dl>
			<dl class="fore4">
				<dt>售后服务</dt>
				<dd>
					<div>
						<a>售后政策</a>
					</div>
					<div>
						<a>价格保护</a>
					</div>
					<div>
						<a>退款说明</a>
					</div>
					<div>
						<a>返修/退换货</a>
					</div>
					<div>
						<a>取消订单</a>
					</div>
				</dd>
			</dl>
			<dl class="fore5">
				<dt>特色服务</dt>
				<dd>
					<div>
						<a>夺宝岛</a>
					</div>
					<div>
						<a>DIY装机</a>
					</div>
					<div>
						<a>延保服务</a>
					</div>
					<div>
						<a>京东E卡</a>
					</div>
					<div>
						<a>京东通信</a>
					</div>
					<div>
						<a>京东JD+</a>
					</div>
				</dd>
			</dl>
			
			
		</div>
		<div id="bottom">
			<div class="w2">
				<div class="links">
					<a href="#">关于我们</a>
					|
					<a href="#">联系我们</a>
					|
					<a href="#">联系客服</a>
					|
					<a href="#">合作招商</a>
					|
					<a href="#">商家帮助</a>
					|
					<a href="#">营销中心</a>
					|
					<a href="#">手机京东</a>
					|
					<a href="#">友情链接</a>
					|
					<a href="#">销售联盟</a>
					|
					<a href="#">京东社区</a>
					|
					<a href="#">风险监测</a>
					|
					<a href="#">隐私政策</a>
					|
					<a href="#">京东公益</a>
					|
					<a href="#">English Site</a>
					|
					<a href="#">Contact Us</a>
				</div>
				<div class="copyright">
					<a>
						<img src="image/xiaotu/gongan.png"/>
						 京公网安备 11000002000088号
					</a>
					<a>&nbsp;&nbsp;|&nbsp;&nbsp;京ICP证070359号&nbsp;&nbsp;|&nbsp;&nbsp;</a>
					<a>互联网药品信息服务资格证编号(京)-经营性-2014-0008</a>
					&nbsp;&nbsp;|&nbsp;&nbsp;新出发京零 字第大120007号
					<br/>
					互联网出版许可证编号新出网证(京)字150号&nbsp;&nbsp;|&nbsp;&nbsp;
					<a>出版物经营许可证</a>&nbsp;&nbsp;|&nbsp;&nbsp;
					<a>网络文化经营许可证京网文[2014]2148-348号</a>
					&nbsp;&nbsp;|&nbsp;&nbsp;违法和不良信息举报电话：4006561155
					<br/>
					Copyright © 2004-2017  京东JD.com 版权所有&nbsp;&nbsp;|&nbsp;&nbsp;消费者维权热线：4006067733    
					<a>经营证照</a>
					<br/>
					京东旗下网站：
					<a>京东钱包</a>
				</div>
				<div class="athentication">
					<a>
						<img src="image/bottom/diceng01.png"/>
					</a>
					<a>
						<img src="image/bottom/diceng02.png"/>
					</a>
					<a>
						<img src="image/bottom/diceng03.jpg"/>
					</a>
					<a>
						<img src="image/bottom/diceng04.png"/>
					</a>
					<a>
						<img src="image/bottom/diceng05.jpg"/>
					</a>
					<a>
						<img src="image/bottom/diceng06.jpg"/>
					</a>
				</div>
			</div>
		</div>
	</div>

  </body>
</html>

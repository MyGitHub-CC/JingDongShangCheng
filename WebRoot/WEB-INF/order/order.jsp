<%@ page language="java" import="java.util.*,entity.*,java.text.DecimalFormat" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>订单结算页 -京东商城</title>
    
    <link rel="stylesheet" type="text/css" href="bootstrap/css/order.css">
	<script src="bootstrap/js/jquery.min.js" type="text/javascript"></script>
	<script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<%
		List<Cart> carts = (List<Cart>) request.getAttribute("carts");
		String[] proIdArr = (String[]) request.getAttribute("proIds");
	 %>
	<script>
	$(document).ready(function(){
	    $("#order-submit").click(
			function () {
			var proIds = new Array();
			var i = 0;
			$("[name='proId']").each(function(index,element){
					proIds[i] = $(this).attr("data-id");
					i++;
			});
			location.href="addOrder?proIds="+ proIds;
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
						<a>你好，请登录</a>
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
		<div class="w">
			<div class="checkout-tit">
				<span class="tit-txt">
					填写并核对订单信息
				</span>
			</div>
			<div class="checkout-steps" >
				<div class="step-tit">
					<h3>收货人信息</h3>
					<div class="extra-r">
						<a href="#none" class="">新增收货地址</a>
						<input type="hidden" id="del_consignee_type" value="0" />
					</div>
				</div>
			
				<div class="step-cont">
					<div id="consignee-addr" class="consignee-content">
						<div class="consignee-scrollbar">
							<div class="ui-scrollbar-main">
								<div class="consignee-scroll">
									<div id="consignee1" class="consignee-cont" style="height: 42px;">
										<ul id="consignee-list">
											<li class="ui-switchable-panel ui-switchable-panel-selected" style="display: list-item;" id="consignee_index_138638579" selected="selected" style="cursor: pointer;" c_li_custom_label="consignee_li">
												<div class="consignee-item item-selected" style="float:left;margin-right:20px;font-size:14px;">
													<span>常住地:</span><b></b>
												</div>
												<div class="addr-detail">
													<span class="addr-name">陈晨</span>
													<span class="addr-info">山东 青岛市 城阳区 城阳街道前旺疃社区27号楼2单元602室</span>
													<span class="addr-tel">187****2361</span>
												</div>
											</li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			
		 <div class="hr">
		 </div>
		
		<div id="shipAndSkuInfo">
					<div id="payShipAndSkuInfo">
						<div class="step-tit">
							<h3>支付方式</h3>
						</div>
						<div class="step-cont">
							<div class="payment-list">
								<div class="list-cont">
									<ul id="payment-list">
										<li style="cursor: pointer;">
											<div class="payment-item online-payment payment-item-disabled">
												<b></b>
												货到付款
											</div>
										</li>
										<li style="cursor: pointer;">
											<div class="payment-item item-selected online-payment">
												<b></b>
												<em class="payment-promo">惠</em>
												在线支付
											</div>
										</li>
										<li style="cursor: pointer;">
											<div class="hide payment-item  online-payment ">
												<b></b>
												公司转账
											</div>
										</li>
										<li id="payment-more">
											<div class="payment-item-off">
												<span>更多</span>
												<b></b>
											</div>
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
				<br/><br/>
				<div class="hr">
				</div>
				<div class="step-tit">
					<h3>送货清单</h3>
				</div>
				
			<!-- 购买物品1-->
				<% 
  					User user = (User) session.getAttribute("user");
					DecimalFormat df = new DecimalFormat("######0.00");
					double sum = 0;
					for (int i = 0; i < carts.size();i++) {
						Cart cart = carts.get(i);
						sum += cart.getProduct().getPrice() * cart.getNum();
				 %>
				<div class="item-list">
				<input type="hidden" name="proId" data-id="<%=cart.getProduct().getId()%>">
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
						<strong>￥<%=cart.getProduct().getPrice() %></strong>
						</div>
						<div class="cell-quantity">
							<%=cart.getNum() %>
						</div>
						<div class="cell-sum">
							&nbsp;&nbsp; <strong>￥<%=df.format(cart.getProduct().getPrice() * cart.getNum())%></strong>
						</div>
					</div>
				</div>
				<% } %>
			</div>
		</div>
		<div id="sumbit-order">
			<div class="w">
				<div>
				<span class="price-tit">应付总额：</span>
				<span class="price-num" id="sumPrice">￥<%=df.format(sum) %> </span>
				</div>
				<div>
				<span class="address-user">寄送至： 山东 青岛市 城阳区 城阳街道  前旺疃社区27号楼2单元602室</span>
				</div>
			</div>
			<div class="w2">
				<div class="w2-sumbit">
					<button id="order-submit"  class="checkout-submit"> 提交订单</button>
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
		<div class="footer-w3">
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
			<div class="footer-w2">
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

<%@ page language="java" import="java.util.*,entity.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>商品列表页</title>
    
	<link rel="stylesheet" type="text/css" href="bootstrap/css/list.css">
	
  </head>
  <%
  	List<Product> products = (List<Product>)request.getAttribute("products");
  	int maxPage = (Integer)request.getAttribute("maxPage");
  	int ye = (Integer)request.getAttribute("page");
   %>
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
					<li class="fore3"><a>我的京东  &gt; </a></li>
					<li class="space">&nbsp;|&nbsp;</li>
					<li class="fore4"><a>京东会员</a></li>
					<li class="space">&nbsp;|&nbsp;</li>
					<li class="fore5"><a>企业采购</a></li>
					<li class="space">&nbsp;|&nbsp;</li>
					<li class="fore6">
						<img src="image/list/phone-black.png" style="float: left;" /> 
						<a style="float: left;">
							手机京东  &gt; 
						</a>
					</li>
					<li class="space">&nbsp;|&nbsp;</li>
					<li class="fore7"><a>关注京东 &gt; </a></li>
					<li class="space">&nbsp;|&nbsp;</li>
					<li class="fore8"><a>客户服务 &gt; </a></li>
					<li class="space">&nbsp;|&nbsp;</li>
					<li class="fore9"><a>网站导航 &gt; </a></li>
				</ul>
			</div>
		</div>
	</div>
	<div id="second-line">
		<div class="w">
			<div id="logo-jd">
				<a><img src="image/list/logo.png"/></a>
			</div>
			<div id="search">
				<div class="search-hide"></div>
					<input type="text" id="key" value="" />
					<button onclick="">搜索</button>
					<div id="hotwords">
						<a>图书钜惠</a>
						<a>文学奖</a>
						<a>非虚构</a>
						<a>每150减50</a>
						<a>思维导图</a>
						<a>每49减15</a>
						<a>高考三轮</a>
						<a>Python</a>
					</div>
			</div>
			<div id="shop-car">
				<div id="settleup">
				<img src="image/list/shop-car.png"/>
				<a class="a-shop" href="cart">我的购物车</a>&nbsp;&nbsp;&nbsp;
				&gt;
				</div>
			</div>
			
		</div>
	</div>
	<div id="clear"><span class="clr"></span></div>
	<div id="nav">
		<div class="w">
			<div id="catagorys">
				<div class="cata-left">
					<a>全部商品分类</a>
				</div>
				<div class="cata-right">
					<a style="font-size: 20px;line-height: 30px;">  &gt; </a>
				</div>
			</div>
			<div id="nav-select">
				<div class="nav-select-left">
					<ul id="nav-group1">
						<li class="fore1"><a>首页</a></li>
						<li class="fore2"><a>服装城</a></li>
						<li class="fore3"><a>美妆馆</a></li>
						<li class="fore4"><a>京东超市</a></li>
						<li class="fore5"><a>生鲜</a></li>
						<li class="fore1"><a>全球购</a></li>
						<li class="fore1"><a>闪购</a></li>
						<li class="fore2"><a>拍卖</a></li>
						<li class="fore3"><a>金融</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	
	<div id="p-box-list">
		<div id="content-list">
			<ul class="book-list">
			<%
				for(int i = 0; i < products.size(); i++){
			%>
				<li>
					<div class="p-img">
						<a href="showDetail?proId=<%=products.get(i).getId() %>" >
							<img src="photo/<%=products.get(i).getPhoto() %>"/>
						</a>
					</div>
					<div class="p-price">
						<strong>￥<%=products.get(i).getPrice() %></strong>
					</div>
					<div class="p-name">
						<a><%=products.get(i).getIntroduce() %></a>
					</div>
					<div class="p-publishing">
						<%
						  Publishing publishing = products.get(i).getPublishing();
						  if(publishing != null){
						%>
							<a><%=publishing.getName() %></a>
						<% } %>
					</div>
				</li>
			<% } %>
			</ul>
		</div>
	</div>
	
	<div id="turn-page">
		<a href="showList?ye=1" >
			<input type="button" class="turn-page-pre" value="首页" />
		</a>
		<a href="showList?page=<%=ye-1 %>" >
			<input type="button" class="turn-page-pre" value="&lt 上一页" />
		</a>
		<%
			for (int i = 0; i < maxPage; i++) {
		 %>
		 <a href="showList?ye=<%=i+1 %>" >
			<input type="button" class="page-item" value="<%=i+1 %>" />
		</a>
		 <% } %>
		&nbsp;...&nbsp;
		<a href="showList?ye=<%=ye+1 %>" >
			<input type="button" class="turn-page-next" value="下一页  &gt" />
		</a>
		<a href="showList?ye=<%=maxPage %>" >
			<input type="button" class="turn-page-next" value="尾页" />
		</a>
	</div>
	
	<div id="footer">
		<div class="slogen">
			<span class="item-fore1">
				<b>多</b>
				品类齐全  轻松购物
			</span>
			<span class="item-fore2">
				<b>快</b>
				多仓直发 极速配送
			</span>
			<span class="item-fore3">
				<b>好</b>
				正品行货 精致服务
			</span>
			<span class="item-fore4">
				<b>省</b>
				天天低价 畅选无忧
			</span>
		</div>
		<div class="w">
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
			<div class="w">
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

<%@page import="entity.Product"%>
<%@ page language="java" import="java.util.*,entity.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>商品详情页</title>
    
	<link rel="stylesheet" type="text/css" href="bootstrap/css/details.css">
	<script src="bootstrap/js/jquery.min.js" type="text/javascript"></script>
	<script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	
	<%
	  Product product = (Product) request.getAttribute("product");
	  int uId = 0;
	  if(session.getAttribute("user") != null){
		  User user = (User) session.getAttribute("user");
		  uId = user.getId();
	  }
    %>
	<script>
	$().ready(function(){
		/*购物车加减商品*/
		$("#jia").click(
			function(){
				var num = $("#shopNum").val()- 0 + 1;
				if(num >= 200){
					num = 199;
				}
				$("#shopNum").val(num);
			}
		);
		$("#jian").click(
			function(){
				var num = $("#shopNum").val()- 0 - 1;
				if(num < 1){
					num = 1;
				}
				$("#shopNum").val(num);
			}
		);
		var oldNum = "";
		$("#shopNum").focus(
			function(){
			oldNum = $(this).val();
		
		});
		$("#shopNum").blur(function(){
			var newNum = $(this).val();
			var reg = /^[0-9]+$/;
			if(reg.test(newNum)== false) {
				$(this).val(1);
				return;
			}
			if(newNum < 1){
				$(this).val(1);
			}
			if(newNum >= 200){
				$(this).val(199);
			}
		});
		/*加入购物车*/
		$("#choose-append").click(
			function(){
				var num = $("#shopNum").val();
			    $.ajax({
		           type: "post",
		           url: "addCart",
		           data: "proId=" + <%=product.getId()%> + "&num=" + num
		           		  + "&uId=" + <%=uId%>,
		           dataType:"text",
		           success: function(data){
			           if(data == "success"){
			              location.href="cart";
			           }else{
			           	  alert(data);
			           	  location.href="login";
			           }
		           }
				});
			});
	});
	
	</script>
  </head>
  <%
    	User user = (User) session.getAttribute("user");
    	String username = "";
    	if(user != null){
    		username = user.getUsername();
    	}
     %>
  <body>
		<div id="frist-line">
			<div class="w">
				<div class="first-left">
					<ul>
						<li> 送至：北京  &gt; </li>
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
						<li class="fore3"><a>我的京东 &gt;</a></li>
						<li class="space">&nbsp;|&nbsp;</li>
						<li class="fore4"><a>京东会员</a></li>
						<li class="space">&nbsp;|&nbsp;</li>
						<li class="fore5"><a>企业采购</a></li>
						<li class="space">&nbsp;|&nbsp;</li>
						<li class="fore6">
							<img src="image/detail/phone-black.png" style="float: left;"/> 
							<a style="float: left;">
								 &nbsp;&nbsp;手机京东  &gt;
							</a>
						</li>
						<li class="space">&nbsp;|&nbsp;</li>
						<li class="fore7">
							<a>关注京东 &gt;</a>
							
						</li>
						<li class="space">&nbsp;|&nbsp;</li>
						<li class="fore8">
							<a>客户服务</a>  &gt;
						</li>
						<li class="space">&nbsp;|&nbsp;</li>
						<li class="fore9">
							<a>网站导航 &gt;</a> 
						</li>
					</ul>
				</div>
			</div>
		</div>
		<div id="second-line">
			<div class="w">
				<div id="logo-jd">
					<a><img src="image/detail/logo.png"/></a>
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
							<img src="image/detail/shop-car.png"/>
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
						<a style="font-size: 20px;line-height: 30px;"> > </a>
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
		<div id="root-nav">
			<div class="w">
				<strong><a style="font-size: 20px;">图书</a></strong>
				&nbsp;
				<span>&nbsp;>&nbsp;&nbsp;<a href="#">计算机互联网</a></span>
				<span>&nbsp;>&nbsp;&nbsp;<a href="#">计算机理论、基础知识</a></span>
				<span>&nbsp;>&nbsp;&nbsp;<a href="#">Broadview</a></span>
				<span>&nbsp;>&nbsp;&nbsp;&nbsp;<a href="#">编码：隐匿在计算机软硬件背后的语言</a></span>
			</div>	
		</div>
		<div id="p-box">
			<div class="w">
				<div id="box-preview">
					<div id="box-preview-book">
						<img src="photo/<%=product.getImage().getBigImg() %>"/>
					</div>
					<div id="book-list">
						  <ul id="list-ul1">
						    <div class="arrow" id="arrow-left"> 
						   		 <li class="left">&lsaquo; </li> 
						    </div>
 							<div class="arrow" id="arrow-right"> 
 								<li class="right"> &rsaquo; </li>
 							</div>
   							</ul>
   							<ul id="list-ul2">
   							<%
   								for(int i = 0; i < 4; i++){
   							 %>
   								<li><img src="photo/<%=product.getImage().getSmallImg() %>"/></li>
   							<% } %>
   							</ul>
					</div>
					<div id="btn-def">
						<a href="#"><button>企业批量购书</button></a>
					</div>
					<div id="short-share">
						<a href="#"><img src="image/detail/box/xiaotubiao/share.png"/><em>分享</em></a>
						<a href="#"><img src="image/detail/box/xiaotubiao/guanzhu.png"/><em>关注商品</em></a>
					</div>
				
				</div>
				<div id="box-preview-middle">
					<div id="book-name">
						<h1><%=product.getIntroduce() %></h1>
						<div id="p-author">
							<a>
								<%
									if(product.getAuthor() != null) {
										out.print(product.getAuthor());
									}
								%>
							</a>
						</div>
					</div>
					<div id="book-summary">
						<div id="summary-price">
							<div class="dt">
								京  东  价：
							</div>
							<div class="dd">
								<strong>￥<%=product.getPrice() %></strong>
								<span>[7.9折]</span>
								<span>[定价：<del>￥990.00</del>]</span>
								<a>(降价通知)</a>
							</div>
							<div id="summary-info">
								<div id="comment-count">
									<p>累计评价</p><a>+6100</a>
								</div>
							</div>
						</div>
						<div id="summary-support">
							<div class="dt">
							支  &nbsp;持：
							</div>
							<div class="dd">
								<img src="image/detail/box/xiaotubiao/lipin.png"/>
								<a href="#">礼品包装</a>
							</div>
						</div>
						<div id="compare">
							<div id="qd-compare2">
								<div class="compare2-logo">
									<img src="image/detail/box/xiaotubiao/compare2.png"/>
								</div>
								<div id="compare2-content">
									<div class="dt">
										<a>&nbsp; 商城价 <span> ￥977.8 </span> &darr; </a>
									</div>
									<div class="dd">
										<a>&nbsp;&nbsp; | &nbsp;&nbsp; 淘宝价 <span> ￥980.00 </span></a> 
										&nbsp;|
									</div>
								</div>
								<div id="compare2-butn">
									价格平稳
								</div>
							</div>
						</div>
						<div id="summary-order">
							<div class="dt">
								排 &nbsp;&nbsp; 名：
							</div>
							<div class="dd">
								自营&nbsp; <a>计算机与互联网销量榜</a>
								&nbsp;
								第 <font style="color: red;">80</font> 位
							</div>
						</div>
						<div id="summary-stock">
							<div class="dt">
								配 送 至：
							</div>
							<div class="dd">
								<span>北京市朝阳区管庄  99</span>
								有货，支持 99元免基础运费  |  货到付款
							</div>
						</div>
						<div id="summary-service">
							<div class="dt">
								服  &nbsp;务：
							</div>
							<div class="dd">
								由 <span> 京东 </span>
								 发货，并提供售后服务。23:00前下单,预计明天(05月12日)送达
							</div>
						</div>
					</div>
					<div id="choose" >
						<div class="choose-dt">
						<img src="image/detail/box/xiaotubiao/choose.png"/>
						</div>
						<div id="choose-btn">
							<div class="choose-amount">
								<input type="text" id="shopNum" value="1" />
								<a>
									<button class="jia" id="jia" >+</button>
								</a>
								<a>
									<button class="jian" id="jian">-</button>
								</a>
							</div>
							<div id="choose-append">
								<img src="image/detail/box/xiaotubiao/shop-append.png"/>
								<a href="javascript:void(0);" >
									加入购物车
								</a>
							</div>
						</div>
					</div>				
					<div id="summary-tips">
						<div class="dt">
							温馨提示：
						</div>
						<div class="dd">
							<p>支持7天无理由退货</p>
						</div>
					</div>
				</div>
				<div id="box-preview-right">
					<img src="image/detail/box/right/box-right.png"/>
				</div>
			</div>
		</div>
		<div id="box-root">
			<div class="w">
				<div id="box-root-top">
					<span>
						人气单品
					</span>
				</div>
				<div id="box-preview-book-list">
					<ul class="book-list">
						<li>
							<div class="p-img">
								<img src="image/detail/book/b01.jpg"/>
							</div>
							<div class="p-name">
								<a>计算机是怎样跑起来的</a>
							</div>
							<div class="p-price">
								<strong>￥31.50</strong>
							</div>
						</li>
						<li>
							<div class="p-img">
								<img src="image/detail/book/b02.jpg"/>
							</div>
							<div class="p-name">
								<a>编程珠玑 （第2版 修订版）</a>
							</div>
							<div class="p-price">
								<strong>￥30.80</strong>
							</div>
						</li>
						<li>
							<div class="p-img">
								<img src="image/detail/book/b03.jpg"/>
							</div>
							<div class="p-name">
								<a>深入理解计算机系统（原书第3版）</a>
							</div>
							<div class="p-price">
								<strong>￥109.80</strong>
							</div>
						</li>
						<li>
							<div class="p-img">
								<img src="image/detail/book/b04.jpg"/>
							</div>
							<div class="p-name">
								<a>技术之瞳 阿里巴巴技术笔试心得</a>
							</div>
							<div class="p-price">
								<strong>￥54.50</strong>
							</div>
						</li>
						<li>
							<div class="p-img">
								<img src="image/detail/book/b05.jpg"/>
							</div>
							<div class="p-name">
								<a>计算机科学丛书：计算机程序的构造和解释</a>
							</div>
							<div class="p-price">
								<strong>￥40.10</strong>
							</div>
						</li>
						<li>
							<div class="p-img">
								<img src="image/detail/book/b06.jpg"/>
							</div>
							<div class="p-name">
								<a>数学之美（第二版）</a>
							</div>
							<div class="p-price">
								<strong>￥36.60</strong>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<div id="products-intro">
			<div class="w">
				<div class="intro-top">
					<ul>
						<li><a>商品介绍</a></li>
					</ul>
				</div>
				<div id="datail-content">
					<div class="datail-tag-id">
						<div class="item-mt" >
							<h3>编辑推荐</h3>
						</div>
						<div class="item-mc">
							<p>
								透过现象进而探索本质可以发现新事物；将复杂的事物简单化，可以发现解决问题的新方法。
								《编码：隐匿在计算机软硬件背后的语言》作者佩措尔德将那些看似复杂的理论转换成我们熟悉的诸多景象，
								使读者不由自主地跟随他的思路打造这台只有电线、电灯泡和触发器组构成的庞大的计算机系统。
							</p>
						</div>
					</div>
					<div class="datail-tag-id">
						<div class="item-mt">
							<h3>内容简介</h3>
						</div>
						<div class="item-mc">
							<p>
								《编码：隐匿在计算机软硬件背后的语言》是一本讲述计算机工作原理的书。
								不过，你千万不要因为“工作原理”之类的字眼就武断地认为，它是晦涩而难懂的。
								作者用丰富的想象和清晰的笔墨将看似繁杂的理论阐述得通俗易懂，你丝毫不会感
								到枯燥和生硬。更重要的是，你会因此而获得对计算机工作原理较深刻的理解。
								这种理解不是抽象层面上的，而是具有一定深度的，这种深度甚至不逊于“电气工程师
								”和“程序员”的理解。
							</p>
							<p>不管你是计算机高手，还是对这个神奇的机器充满敬畏之心的菜鸟，
								都不妨翻阅一下本书，读一读大师的经典作品，必然会有收获。
							</p>
						</div>
					</div>
					<div class="datail-tag-id" id="datail-author">
						<div class="item-mt">
							<h3>作者简介</h3>
						</div>
						<div class="item-mc">
							<p>
								Charles Petzold是Windows编程界的一位大师，当今世界项级技术作家。
								1994年5月，Petzold作为仅有的七个人之一（并且是的作家）被《视窗杂志》
								和Microsoft公司联合授予Windows Pioneer奖，以表彰他对Microsoft 
								Windows所做出的贡献。
　　								Petzold从1984年开始编写个人计算机程序，从1985年开始编写Microsoft 
								Windows程序。	1986年他在Microsoft Systems Journal的1 2月号上
								发表了一篇关于Windows程序设计的论文。
							</p>
							<p>从1986年到1995年，Petzold为PC Magazine撰写专栏文章，向读者介绍Windows
								和OS/2程序设计等方面的知识。直到今天他依然保持着WindowsGDI程序设计首席技术
								作家的地位。其大作Programming Windows（Windows程序设计）是尽人皆知的
								Windows编程经典，曾深深地影响过一代程序员，该书目前已出至第5版。
							</p>
							<p>
								左飞，技术作家、译者，除本书外他还翻译了《代码阅读》和《代码质量》两部计算机领
								域的经典著作（两书分别荣获第14届和第17届美国Jolt图书震撼大奖），其所著的
								《代码揭秘》一书繁体版在中国台湾地区出版发行。2011年，在国家示范软件学院成立
								10周年庆祝大会上，他被国家示范软件学院院长联席会和大会组委会共同授予“国家示范
								软件学院成立10周年全国十佳出色毕业生”称号，以表彰他在专业领域中所做出的突出成绩。
　　
　　								薛佟佟，在南京航空航天大学取得工学硕士学位后加入中国移动通信集团，长期专注于云计算
								及分布式存储技术的研究与应用。他是中国移动公众服务云与一级私有云的核心推动者，同时是
								《提高C++性能的编程技术》（收录于电子工业出版社“传世经典书丛”）一书的译者。
							</p>
						</div>
					</div>
				</div>
			</div>
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

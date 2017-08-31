<%@ page language="java" import="java.util.*,entity.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>京东(JD.COM)-正品低价、品质保障、配送及时、轻松购物！</title>
    
	<link rel="stylesheet" type="text/css" href="bootstrap/css/JD-Home.css"/>
	<script src="bootstrap/js/jquery.min.js" type="text/javascript"></script>
	<script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<script type="text/javascript">
	<%
		int pId = 0;
		String pName = "北京";
		if(request.getAttribute("pId") != null){
			pId = Integer.parseInt((String)request.getAttribute("pId"));
		}
		if(request.getAttribute("pName") != null){
			pName = (String) request.getAttribute("pName");
		}
	%>
	$(document).ready(function(){
		/*顶部广告点击关闭事件*/
		$("#top-gg .close").click(function(){
			$("#top-gg").toggle();
		});
		/*鼠标移入移出地址栏显示与隐藏*/
		$(".dropdown").hover(
			function(){
				var a = $("#" + $(this).data("dt"));
				var b = $("#"+ $(this).data("hide"));
				b.show();
				a.css("background-color","#fff");
				/*用ajax返回省份集合的函数*/
				$.ajax({
					type:"post",
					url:"searchProvince",
					dataType:"json",
					success:function(data){
						var lis = "<ul id='address'>";
						$.each(data,function(index, element){
							if(element.id == <%=pId%> || (<%=pId%> == 0 && index ==0)){
								lis += "<li value='" + element.id + "'  class='address-item address-item1' >"
								 + " <a href='index?pId=" + element.id +"&pName=" + element.name +"' style='color: #fff;'>"+element.name+ "</a></li>";
							}else{
								lis +="<li class='address-item' value='" + element.id + "'>"
								+ "<a href='index?pId=" + element.id + "&pName=" + element.name +"'>"+element.name+ "</a></li>";
							}
						});
						lis += "</ul>";
						$("#address-hide").html(lis);
					}
				});
			},
			function(){
				var a = $("#" + $(this).data("dt"));
				var b = $("#"+ $(this).data("hide"));
				b.hide();
				a.css("background-color","#e3e4e5");
			}
		);
		/*轮播特效*/
		var imgs = $("#lunbo-ul .lb-img");
		var nums = $("#lunbo-nums .lb-num");
		nums.eq(0).css("background","#db192a");
		imgs.hide();
		imgs.eq(0).show();
		var i = 0;
		function show(){
			imgs.hide();
			imgs.eq(i).fadeOut(500);
			imgs.eq(i).fadeIn(500);
			nums.css("background","#FFFFFF");
			nums.css("color","#000");
			nums.eq(i).css("background","#db192a");
			nums.eq(i).css("color","#fff");
		}
		function change(){
			i++;
			if(i == imgs.length){
				i = 0;
			}
			show();
		}
		var timer = setInterval(change, 2000);
		var arrows = $(".arrow");
		arrows.hide();
		arrows.hover(
			function(){
				$(this).css("background-color", "#5A330A");
				
			},
			function(){
				$(this).css("background-color", "#8B8E9D");
			}
		);
		$("#arrowleft").click(function(){
			i--;
			if(i < 0){
				i = imgs.length -1;
			}
			show();
		});
		$("#arrowright").click(function(){
			i++;
			if(i > imgs.length -1){
				i = 0;
			}
			show();
		});
		$("#lb-box").hover(
			function(){
				clearInterval(timer);
				arrows.show();
			},
			function(){
				timer = setInterval(change, 2000);
				arrows.hide();
			}
		);
		nums.click(function(){
			i = $(this).index() -1;
			change();
		});
		
		/*鼠标移上变颜色事件*/
		$(".fr-cursor").hover(
			function(){
				$(this).css("cursor","pointer");
				$(this).css("color","#C81623");
			},
			function (){
				$(this).css("cursor","default");
				$(this).css("color","#999");
			}
		);
		$(".fr-cursor-nav").hover(
			function(){
				$(this).css("cursor","pointer");
				$(this).css("color","#C81623");
			},
			function (){
				$(this).css("cursor","default");
				$(this).css("color","#555");
			}
		);
		$(".fr-cursor-list").hover(
			function(){
				$(this).css("cursor","pointer");
				$(this).css("color","#C81623");
			},
			function (){
				$(this).css("cursor","default");
				$(this).css("color","#FFFFFF");
			}
		);
		$(".fr-cursor-dd").hover(
			function(){
				$(this).css("cursor","pointer");
				
				$(this).addClass(".menu-detail .detail-books .change");
				//$(this).attr("color","#C81623");
			},
			function (){
				$(this).css("cursor","default");
				//$(this).attr("color","#666666");
			}
		);
		/*鼠标点击搜索框*/
		var clickNum = $("#searchInput").val();
		var obj;
		$("#searchInput").val("计算机");
		$("#searchInput").focus(function(){
			obj = $(this).val();
			if(clickNum == 0 || obj.equals(clickNum)) {
				$(this).val("");
				obj = $(this).val();
			}
		});
		$("#searchInput").blur(function(){
			$(this).val(obj);
		});
		
		/*详细列表显示与隐藏*/
		var li = "";
		
	 	$(".left-menu-item").hover(function (){ 
			var cId = $(this).data("cid");
            $(".left-menu-item").css("background","#6e6568");
			$(this).css("background","#999395");
			li = ".menu-detail-item" + $(this).attr("data-li");
			var str = "";
			$.ajax({
				type:"post",
				url:"searchMenu",
				data:"cId=" + cId,
				dataType:"json",
				success:function(data){
					$.each(data,function(index, element){
						str += "<dl class='detial-content-item'><dt class='item-dt'><a target='_blank' class='fr-cursor-dd'  href=showList?cId=" + cId + ">"+
 						element.name+"&nbsp; &gt;</a></dt>";
						$.each(element.clazzs,function(i, e){
							str+="<dd class='item-dd item-dd-li'><a target='_blank' class='fr-cursor-dd'  href=showList?cId=" + cId + ">"+ e.name+"</a></dd>";
						});
						str+="</dl></div>";
					});
					$(li).show();
					$(".detial-content").html(str);
				}
			});
        },function (){  
 			$(li).delay(300).hide(0);
            $(this).css("background","#6e6568");
         }); 
		
		});
</script>
  </head>
  
  <body>
    <%
    	List<Category> categories = (List<Category>) request.getAttribute("categories");
    	//List<Kind> kinds = (List<Kind>) request.getAttribute("kinds");
    	User user = (User) session.getAttribute("user");
    	String username = "";
    	if(user != null){
    		username = user.getUsername();
    	}
     %>
     	<div id="top-gg">					   <!-- 顶部广告01 -->
			<div class="top-w">
				<a><img src="image/JD-Home/top-gg2.jpg"/></a>
				<span class="close">
					×
				</span>
			</div>
		</div>
		
		<div id="frist-line">				  <!-- 标题栏信息02 -->
		<div class="w">											<!-- 首层主体  -->
			<ul class="fr-left">								<!-- 首层左侧  -->
				<li id="address-list" class="dropdown" data-hide="address-hide" data-dt="address-dt">
					<div class="dt cw-icon" id="address-dt">
						<i class="ci-right">
							<s>◇</s>
						</i>
						<i class="ci-left"></i>
						<div> 
							<div style="float:left;">&nbsp;&nbsp;&nbsp;送至：</div>
							<div><%=pName %> &gt;</div>
						</div>
					</div>
					<div class="dd-dropdown" id="address-hide" >
					</div>
				</li>
			</ul>
			<ul class="fr-right">						     	<!-- 首层右侧*/ -->
				<li class="froe1">
					<%
						if(username != ""){
					 %>
						<a href="login" class="fr-cursor" style="color:#F10215"><%=username %> ,</a>
					<% 
						} else { 
					%>
						<a href="login" class="fr-cursor">你好，请登录</a>
					<% } %>
					
					&nbsp;
					<a id="free-regist" href="register" >免费注册</a>
					&nbsp;|&nbsp;
				</li>
				
				<li class="froe2">
					<a href="showOrder" class="fr-cursor">我的订单</a>
					&nbsp;|&nbsp;
				</li>
				<li class="froe3 dropdown" data-hide="my-JD-hide" data-dt="my-JD-dt">
					<div class="dt cw-icon" id="my-JD-dt">
						<i class="ci-right">
							<s>◇</s>
						</i>
						<i class="ci-left"></i>
						<a href="#" class="fr-cursor">我的京东 &gt;</a>
					</div>
					<div class="dd-dropdown" id="my-JD-hide">
						<ul id="my-JD">
							<li><a href="#">待处理订单</a></li>
							<li><a href="#">消息</a></li>
							<li><a href="#">返修退换货</a></li>
							<li><a href="#">我的问答</a></li>
							<li><a href="#">降价商品</a></li>
							<li><a href="#">我的关注</a></li>
						</ul>
							<span class="div-line"></span>
						<ul>
							<li><a href="#">我的京东</a></li>
							<li><a href="#">我的优惠劵</a></li>
							<li><a href="#">我的白条</a></li>
							<li><a href="#">我的理财</a></li>
						</ul>
					</div>
				</li>
				<li class="froe4">
					|&nbsp;&nbsp;
					<a href="#" class="fr-cursor">京东会员</a>
					&nbsp;|&nbsp;
				</li>
				<li class="froe5">
					<a href="#" class="fr-cursor">企业采购</a>
					&nbsp;|&nbsp;
				</li>
				<li class="froe6">
					<a href="#" class="fr-cursor">手机京东</a>
					&nbsp;|&nbsp;
				</li>
				<li class="froe7">
					<a href="#" class="fr-cursor">关注京东</a>
					&nbsp;|&nbsp;
				</li>
				<li class="froe8 dropdown" data-hide="service-hide" data-dt="service-dt">
					<div class="dt cw-icon" id="service-dt">
						<i class="ci-right">
							<s>◇</s>
						</i>
						<i class="ci-left"></i>
						<a href="#" class="fr-cursor">客户服务 &gt;</a>
					&nbsp;|&nbsp;
					</div>
					<div class="dd-dropdown" id="service-hide">
						<ul id="service">
							<li>
								<a href="#"><b>客户</b></a>
							</li><br/>
							<li><a href="#">帮助中心</a></li>
							<li><a href="#">售后服务</a></li>
							<li><a href="#">在线服务</a></li>
							<li><a href="#">意见建议</a></li>
							<li><a href="#">电话客服</a></li>
							<li><a href="#">客服邮箱</a></li>
							<li><a href="#">金融咨询</a></li>
						</ul>
							<span class="div-line"></span>
						<ul>
							<li>
								<a href="#"><b>商户</b></a>
							</li>
							<br/>
							<li><a href="#">合作招商</a></li>
							<li><a href="#">京东商学院</a></li>
							<li><a href="#">商家后台</a></li>
							<li><a href="#">京麦工作台</a></li>
							<li><a href="#">商家帮助</a></li>
							<li><a href="#">规则平台</a></li>
						</ul>
					</div>
				</li>
				<li class="froe9 dropdown" data-hide="nav-hide" data-dt="nav-dt">
					<div class="dt cw-icon" id="nav-dt">
						<i class="ci-right">
							<s>◇</s>
						</i>
						<i class="ci-left"></i>
						<a href="#" class="fr-cursor">网站导航 &gt;</a>
					</div>
					<div class="dd-dropdown" id="nav-hide">
						<ul id="nav">
							<div class="nav-web">
								<li>
									<a href="#"><b>特色主题</b></a>
								</li>
								</br>
								<li><a href="#">品牌头条</a></li>
								<li><a href="#">发现好货</a></li>
								<li><a href="#">京东预售</a></li>
								<li><a href="#">京东金融</a></li>
								<li><a href="#">京东试用</a></li>
								<li><a href="#">港澳售</a></li>
							</div>
							<div class="div-line-vert"></div>
							<div class="nav-web">
								<li>
									<a href="#"><b>行业频道</b></a>
								</li>
								</br>
								<li><a href="#">服装城</a></li>
								<li><a href="#">家用电器</a></li>
								<li><a href="#">电脑办公</a></li>
								<li><a href="#">手机</a></li>
								<li><a href="#">美妆馆</a></li>
								<li><a href="#">食品</a></li>
								<li><a href="#">智能数码</a></li>
								<li><a href="#">母婴</a></li>
								<li><a href="#">家装城</a></li>
							</div>
							<div class="div-line-vert"></div>
							<div class="nav-web">
								<li>
									<a href="#"><b>生活服务</b></a>
								</li>
								<li><a href="#">京东众筹</a></li>
								<li><a href="#">白条</a></li>
								<li><a href="#">京东金融APP</a></li>
								<li><a href="#">京东小金库</a></li>
								<li><a href="#">理财</a></li>
								<li><a href="#">话费</a></li>
								<li><a href="#">旅行</a></li>
								<li><a href="#">彩票</a></li>
								<li><a href="#">游戏</a></li>
							</div>
							<div class="div-line-vert"></div>
							<div class="nav-web">
								<li>
									<a href="#"><b>更多精选</b></a>
								</li>
								<li><a href="#">京东社区</a></li>
								<li><a href="#">京东通信</a></li>
								<li><a href="#">在线读书</a></li>
								<li><a href="#">京东E卡</a></li>
								<li><a href="#">智能社区</a></li>
								<li><a href="#">游戏社区</a></li>
								<li><a href="#">京友邦</a></li>
							</div>
						</ul>
					</div>
				</li>
			</ul>
		</div>
	</div>
	
	<div id="second-head">						<!-- 第二层：LoGo -->
		<div class="w">
			<div id="logo-JD">
				<a><img src="image/JD-Home/logo-02.gif"/></a>
			</div>
			<div id="search-form">
				<input type="text" id="searchInput" class="text"  />
				<a target="_blank" href="#">
					<button class="button">搜 索</button>
				</a>
			</div>
			<div id="settleup">
				<div class="cw-icon">
					<img src="image/JD-Home/shop-car.png"/>
					&nbsp;&nbsp;
					<a href="cart">我的购物车</a>
					&gt;
				</div>
			</div>
			<div id="hotwords">
				<a class="color-red">买1送1</a>
				<a>感恩母亲</a>
				<a>低至5折</a>
				<a>阿玛尼</a>
				<a>2件199</a>
				<a>打底裤女秋</a>
				<a>头盔</a>
				<a>吃货嘉年华</a>
				<a>鲜花</a>
			</div>
			<div id="nav-items">
				<ul class="nav-items-group1">
					<li>
						<a class="fr-cursor-nav">秒杀</a>
					</li>
					<li>
						<a class="fr-cursor-nav">优惠劵</a>
					</li>
					<li>
						<a class="fr-cursor-nav">闪购</a>
					</li>
					<li>
						<a class="fr-cursor-nav">拍卖</a>
					</li>
				</ul>
				<div class="space"></div>
				<ul class="nav-items-group2">
					<li>
						<a class="fr-cursor-nav">服装城</a>
					</li>
					<li>
						<a class="fr-cursor-nav">京东超市</a>
					</li>
					<li>
						<a class="fr-cursor-nav">生鲜</a>
					</li>
					<li>
						<a class="fr-cursor-nav">全球购</a>
					</li>
				</ul>
				<div class="space"></div>
				<ul class="nav-items-group3">
					<li>
						<a class="fr-cursor-nav">京东金融</a>
					</li>
				</ul>
			</div>
			<div id="treasure">
				<a><img src="image/JD-Home/yaonixinfu.jpg"/></a>
			</div>
		</div>
	</div>
	
	<div id="third-shuf">
		<div class="beijing" style="background: url(image/JD-Home/celan-02.png) no-repeat 50% 0;" >
		</div>
		<div id="shuf-inner" class="w">
			<div class="inner-left">
				<ul class="left-menu">
					<%
						for(int i = 0; i < categories.size(); i++){
						    List<Species> species = categories.get(i).getSpecies();
						    if(species == null){
						 		continue;
						 	}
					 %>
						 	<li class="left-menu-item" data-li="<%=i %>" data-cid="<%=categories.get(i).getId()%>">
						 	<%
						 	for(int j = 0; j < species.size(); j++){
						 		if(species.get(j) == null){
						 			continue;
						 		}
					 			if(j != species.size() -1) {
							 	 %>		
						 	 		<a target="_blank" class="cate_menu_lk fr-cursor-list"  href="showList?cId=<%=categories.get(i).getId() %>" >
						 	 		<%=species.get(j).getName() %></a><span>/</span>
							 	<% } else { %>
							 		<a target="_blank" class="cate_menu_lk fr-cursor-list" href="showList?cId=<%=categories.get(i).getId() %>" >
							 			<%=species.get(j).getName() %>
							 		</a>
							 	<% } %>	
						 	<% } %>
				 		<div class="menu-detail menu-detail-item<%=i %>" >						<!-- 图书层详细列表 -->
					 		<div class="detail-books">
								<div class="detial-top">
									<ul>
									<%
										for(int k = 0; k<species.size();k++){
									 %>
										<li class="detail-box">
											<a><%=species.get(k).getName() %>&nbsp; &gt;</a>
										</li>
									 <%} %>
										<li class="detail-box">
											<a>邮币商城 &nbsp; &gt;</a>
										</li>
										<li class="detail-box">
											<a>音像 &nbsp;&gt;</a>
										</li>
										<li class="detail-box">
											<a>电子书 &nbsp; &gt;</a>
										</li>
										<li class="detail-box">
											<a>图书榜 &nbsp; &gt;</a>
										</li>
										<li class="detail-box">
											<a>娱乐圈&nbsp;  &gt;</a>
										</li>
									</ul>
								</div>
								<div class="detial-content">
								
								</div>		
							</div>
				 		</div>
				 	</li>
				 <% } %>
				</ul>
			</div>
			
			<div class="inner-middle">
				<div class="lunbo" id="lb-box">
					<ul id="lunbo-ul">
					<% 
						for (int i = 0; i < 8; i++) {
					%>
						<li class="lb-img"><a><img src="image/JD-Home/lunbo-020<%=i+1 %>.jpg"/></a></li>
					<% } %>
					</ul>
					<ul id="lunbo-nums">
					<% 
						for (int i = 0; i < 8; i++) {
					%>
						<li class="lb-num"><%=i+1 %></li>
					<% } %>
					</ul>
					<ul>
						<li id="arrowleft">
							<div class="arrow">
								&lsaquo;
							</div>
						</li>
						<li id="arrowright">
							<div class="arrow">
								&rsaquo;
							</div>
						</li>
					</ul>
					
				</div>
				<div class="lunbo-down">
					<div class="lunbo-down">
						<a><img src="image/JD-Home/lbdownleft.jpg"/></a>
					</div>
					<div class="lunbo-down">
						<a><img src="image/JD-Home/lbdownright.jpg"/></a>
					</div>
				</div>
			</div>
			<div class="inner-right">
				<div class="right-user">
					<div class="user-info">
						<div class="user-info-left">
							<a><img src="image/JD-Home/touxiang.jpg"/></a>
						</div>
						<div class="user-info-right">
							<p>Hi，欢迎来到京东！</p>
							<p>
								<a>登录</a>
								<a>注册</a>
							</p>
						</div>
					</div>
					<div class="user-profit">
						<a class="profit-box">新人福利</a>
						<a class="profit-box">PLUS会员</a>
					</div>
				</div>
				<div class="right-news">
					<div class="news-title">
						<a>促销</a>
						&nbsp;|&nbsp;
						<a>公告</a>
						&nbsp;|&nbsp;
						<a>更多</a>
					</div>
					<div class="news-content">
						<ul>
							<li class="news-item"><a>爆款秒杀 低至五折</a></li>
							<li class="news-item"><a>京东健康母亲节关爱不打折</a></li>
							<li class="news-item"><a>抢4999，爆款手机买1送1</a></li>
							<li class="news-item"><a>抢4999，爆款手机买1送1</a></li>
							<li class="news-item"><a>母亲节，有爱就“购”了</a></li>
						</ul>
					</div>
				</div>
				<div class="right-service">
					<ul id="service-items">
						<li class="service-item">
							<a>
								<span class="service-span">话费</span>
							</a>
						</li>
						<li class="service-item">
							<a>
								<span class="service-span">机票</span>
							</a>
						</li>
						<li class="service-item">
							<a>
								<span class="service-span">酒店</span>
							</a>
						</li>
						<li class="service-item">
							<a>
								<span class="service-span">游戏</span>
							</a>
						</li>
						<li class="service-item">
							<a>
								<span class="service-span">企业购</span>
							</a>
						</li>
						<li class="service-item">
							<a>
								<span class="service-span">加油卡</span>
							</a>
						</li>
						<li class="service-item">
							<a>
								<span class="service-span">电影票</span>
							</a>
						</li>
						<li class="service-item">
							<a>
								<span class="service-span">火车票</span>
							</a>
						</li>
						<li class="service-item">
							<a>
								<span class="service-span">众筹</span>
							</a>
						</li>
						<li class="service-item">
							<a>
								<span class="service-span">理财</span>
							</a>
						</li>
						<li class="service-item">
							<a>
								<span class="service-span">礼品卡</span>
							</a>
						</li>
						<li class="service-item">
							<a>
								<span class="service-span">白条</span>
							</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	
	<div id="box-root">
		<div class="w">
			<div class="box-root-top">
			</div>
			<div class="box-preview-book-list">
				<ul class="book-list">
					<li>
						<div class="p-img">
							<img src="image/JD-Home/book/b01.jpg"/>
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
							<img src="image/JD-Home/book/b02.jpg"/>
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
							<img src="image/JD-Home/book/b03.jpg"/>
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
							<img src="image/JD-Home/book/b04.jpg"/>
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
							<img src="image/JD-Home/book/b05.jpg"/>
						</div>
						<div class="p-name">
							<a>计算机科学丛书：计算机程序的构造和解释</a>
						</div>
						<div class="p-price">
							<strong>￥40.10</strong>
						</div>
					</li>
				</ul>
			</div>
		</div>
		<div class="w">
			<div class="box-root-top">
			</div>
			<div class="box-preview-book-list">
				<ul class="book-list">
					<li>
						<div class="p-img">
							<img src="image/JD-Home/book/b03.jpg"/>
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
							<img src="image/JD-Home/book/b04.jpg"/>
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
							<img src="image/JD-Home/book/b05.jpg"/>
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
							<img src="image/JD-Home/book/b01.jpg"/>
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
							<img src="image/JD-Home/book/b02.jpg"/>
						</div>
						<div class="p-name">
							<a>编程珠玑 （第2版 修订版）</a>
						</div>
						<div class="p-price">
							<strong>￥30.80</strong>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</div>
	
	<div id="footer">						<!-- 第五层：底部 -->
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

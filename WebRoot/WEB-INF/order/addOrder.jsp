<%@ page language="java" import="java.util.*, entity.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>京东支付-请选择支付方式</title>
    
    <link rel="stylesheet" type="text/css" href="bootstrap/css/addOrder.css">
	<script src="bootstrap/js/jquery.min.js" type="text/javascript"></script>
	<script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script>

</script>
  </head>
  
  <body>
  	   <div class="shortcut">
		    <div class="w">
		        <div class="s-logo">
		            <img width="170" height="28" alt="京东 收银台" src="image/addOrder/logo.png">
		        </div>
		        <ul class="s-right">
		            <li id="loginbar" class="s-item fore1">
		            <% User user = (User) session.getAttribute("user");
		            out.print(user.getUsername()); %></li>
		            <li class="s-div">|</li>
		            <li class="s-item fore2">
		                <a class="op-i-ext" href="//order.jd.com/center/list.action" >我的订单</a>
		            </li>
		            <li class="s-div">|</li>
		            <li class="s-item fore3">
		                <a class="op-i-ext" target="_blank" href="//help.jd.com/user/issue/list-173-224.html" >支付帮助</a>
		            </li>
		        </ul>
		        <span class="clr"></span>
		    </div>
		</div>
  	<div>
 </div>
 
  	<div class="main">
	    <div class="w">
	       <div class="order clearfix">
	  		 <div class="o-qrcode"><a class="oq-img" href="javascript:;">
	        	<img src="image/addOrder/erweima.jpg"  alt=""></a>
	    	 </div>
		     <!-- 订单信息 -->
		     <div class="o-left">
				 <h3 class="o-title">
				    <%
				    	String msg = (String) request.getAttribute("msg");
				    	String orderNum = (String) request.getAttribute("orderNum");
				    %>
				    <%=msg %>
				     <%if("订单提交成功！".equals(msg)){%>
				  	   	，请尽快付款！订单号：<%=orderNum%>
				    <% } %>
				 </h3>
		        <p class="o-tips" id="deleteOrderTip">
		        </p>
		     </div>
		     <!-- 订单信息 end --><!-- 订单金额 -->
		     <div class="o-right">
		        <div class="o-price">
		        	<em>应付金额</em>
			         <%
			        	double sumPrice = 0.00;
			        	if(request.getAttribute("sumPrice") != null){
			        		sumPrice = (Double)request.getAttribute("sumPrice");
			        	}
			        %>
			        <strong><%=sumPrice %></strong><em>元</em>
		        </div>
		       <div class="o-detail">
		         	<a onclick="payOrder.toggleDetail(this);" href="javascript:;">订单详情<i></i></a>
		       </div>
		    </div>
	            
       		<div class="payment pay-load" >
    			<div style="float:left;margin:20px 280px;">
    				<div style="width:200px; height:30px;margin:10px;text-align:center;">
    					<strong>微信支付</strong>
    				</div>
	       			<img src="image/addOrder/payment.jpg" >
    			<a href="ModifyOrder?orderNum=<%=orderNum %>&payment=1">
    			<input type="button" id="paySuccess" value="支付完成" 
    			style="width:200px;height:60px;margin-left:20px;font-weight:700;"/>
    			</a>
    			</div>
     		  </div>
	     	</div>
	    </div>
	</div>
	
	<div style="width:100%;height:100px;float:left;">
	</div>
	
  </body>
</html>

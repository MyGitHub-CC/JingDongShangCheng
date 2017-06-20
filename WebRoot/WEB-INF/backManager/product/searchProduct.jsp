<%@ page language="java" import="java.util.*,entity.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>商品管理</title>
    
	<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" type="text/css"></link>
	<script src="bootstrap/js/jquery.min.js" type="text/javascript"></script>
	<script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>

	<style>
	*{
  		margin:0;
  		padding:0;
 	 }
  	.panel-heading{
  		text-align:center;
  	}
  	.panel-title{
  		font-size:22px;
  		font-weight:700;
  		font-family:"楷体";
  	}
  	.panel-body{
  		font-size:18px;
  		font-weight:400;
  		font-family:"宋体";
  		text-align:center;
  	}
  	.container a{
  		text-decoration: none;
  	}
 	.photo {
		width:30px;
		height:30px;
	}
	#BigPhoto{
		display:none;
		position:absolute;
		width:100px;
		height:100px;
		z-index:10;
	}
	#BigPhoto img{
		width:100px;
		height:100px;
	}
	td{
		max-width:50px;
		max-height:22px;
		line-height:22px;
		overflow:hidden;
		white-space:nowrap;
		text-overflow:ellipsis;
	}
  </style>
  </head>
  <%
  	List<Product> products= (List<Product>) request.getAttribute("products");
  	int maxPage = (Integer) request.getAttribute("maxPage");
  	int ye = (Integer) request.getAttribute("ye");
   %>
   <script>
   	$(document).ready(function(){
  	var selectId = 0;
	$("tr").click(function(){
		$("tr").removeClass("info");
		$(this).addClass("info");
		selectId = $(this).data("id");
	});
	$("#add").click(function(){
			window.location.href="productShowAdd";
	});
	$("#modify").click(function(){
		if(selectId != 0){
			window.location.href="productShowModify?uId=" + selectId;
		} else{
			alert("请选择要修改的商品！");
		}
	});
	$("#delete").click(function(){
		if(selectId != 0){
			if(confirm("是否确认删除")){
				window.location.href="productDelete?uId=" + selectId;
			}
		} else{
			alert("请选择要删除的商品！");
		}
	});
	$(".photo").hover(function (event){
		$("#BigPhoto").children("img").attr("src",$(this).attr("src"));
		$("#BigPhoto").toggle();
		$("#BigPhoto").offset({
			left:event.pageX-100,
			top:event.pageY,
		});
	});
	});
   </script>
  <body>
	<div class="container">
		<div class="row clearfix">
		<div class="col-md-12 column" style="border:1px solid #ccc">
			<div style="line-height:30px;" >
				<ul class="breadcrumb" >
					<li> <a href="#">Home</a> </li>
					<li>  <a href="#">Library</a> </li>
					<li class="active"> Data </li>
				</ul>
			</div>
			<div class="jumbotron">
				<div id="BigPhoto"><img src="" /></div>
				<table class="table table-bordered table-hover table-condensed  table-striped">
					<thead>
						<tr class="info">
							<th>编号</th>
							<th>名称</th>
							<th>价格</th>
							<th>作者</th>
							<th>库存 </th>
							<th>种类</th>
							<th>出版社</th>
							<th>照片</th>
							<th>介绍</th>
							<th>详图</th>
						</tr>
					</thead>
					<tbody>
						<%for(int i = 0; i < products.size(); i++){
							Product product = products.get(i);
						%>
						<tr data-id="<%=product.getId()%>" class="td" >
							<td><%=product.getId() %></td>
							<td><%=product.getName() %></td>
							<td><%=product.getPrice() %></td>
							<td><%=product.getAuthor() %></td>
							<td><%=product.getRepertory() %></td>
							<td><%=product.getKind() %></td>
							<td><%=product.getPublishing() %></td>
							<td><%=product.getPhoto() %></td>
							<td><%=product.getIntroduce() %></td>
							<td><%=product.getImage() %></td>
						</tr>
						<% } %>
					</tbody>
				</table>
					<div  style="margin-left:180px;">	
						<ul class="pagination" >
							<li>
								 <a href="searchProduct?ye=<%=1 %>">首页</a>
							</li>
							<li>
								 <a href="searchProduct?ye=<%=ye-1 %>">上一页</a>
							</li>
							<%
								int begin = ye;
								int end = ye + 4;
								if (end > maxPage) {
									end = maxPage;
									begin = end - 4;
								}
								if (begin < 1){
									begin = 1;
								}
								for(int i = begin; i <= end; i++){
							%>
							<li>
								 <a href="searchProduct?ye=<%=i %>"><%=i %></a>
							</li>
							<% } %>
							<li>
								 <a href="searchProduct?ye=<%=ye+1 %>">下一页</a>
							</li>
							<li>
								 <a href="searchProduct?ye=<%=maxPage %>">尾页</a>
							</li>
						</ul>
					</div>
				<div class="btn-group" style="margin-left:550px;float:left;">
					 <button id="add" class="btn btn-primary" type="button">
						新增
					</button> 
					 <button id="modify" class="btn btn-primary" type="button">
					 	修改
					 </button> 
					 <button id="delete" class="btn btn-primary" type="button">
					 	删除
					 </button> 
					 <button id="search" class="btn btn-primary" type="button">
					 	查询
					 </button>
				</div>
				  </div>
			 </div>
		</div>
	</div>
  </body>
</html>

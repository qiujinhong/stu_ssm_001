<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() +"/";
%>
<!DOCTYPE html>
<html>
<head>
<%--	<base href="${pageContext.request.contextPath}/book/findAllBook">--%>
	<base href="<%=basePath%>">
<meta charset="UTF-8">
<link href="jquery/bootstrap_3.3.0/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="jquery/jquery-1.11.1-min.js"></script>
<script type="text/javascript" src="jquery/bootstrap_3.3.0/js/bootstrap.min.js"></script>
<script type="text/javascript">

	//页面加载完毕
	$(function(){
		
		//导航中所有文本颜色为黑色
		$(".liClass > a").css("color" , "black");
		
		//默认选中导航菜单中的第一个菜单项
		$(".liClass:first").addClass("active");
		
		//第一个菜单项的文字变成白色
		$(".liClass:first > a").css("color" , "white");
		
		//给所有的菜单项注册鼠标单击事件
		$(".liClass").click(function(){
			//移除所有菜单项的激活状态
			$(".liClass").removeClass("active");
			//导航中所有文本颜色为黑色
			$(".liClass > a").css("color" , "black");
			//当前项目被选中
			$(this).addClass("active");
			//当前项目颜色变成白色
			$(this).children("a").css("color","white");
		});
		
		
		window.open("workbench/main/index.jsp","workareaFrame");
		//location.href = "${pageContext.request.contextPath}/book/findAllBook"
	});
	
</script>

</head>
<body>
	

	
	<!-- 退出系统的模态窗口 -->
	<div class="modal fade" id="exitModal" role="dialog">
		<div class="modal-dialog" role="document" style="width: 30%;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span>
					</button>
					<h4 class="modal-title">离开</h4>
				</div>
				<div class="modal-body">
					<p>您确定要退出系统吗？</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button type="button" class="btn btn-primary" data-dismiss="modal" onclick="window.location.href='login.jsp';">确定</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 顶部 -->
	<div id="top" style="height: 50px; background-color: #3C3C3C; width: 100%;">
		<div style="position: absolute; top: 5px; left: 0px; font-size: 30px; font-weight: 400; color: white; font-family: 'times new roman'">图书管理 &nbsp;<span style="font-size: 12px;">&copy;&nbsp;后台系统</span></div>
		<div style="position: absolute; top: 15px; right: 15px;">
			<ul>
				<li class="dropdown user-dropdown">
					<a href="javascript:void(0)" style="text-decoration: none; color: white;" class="dropdown-toggle" data-toggle="dropdown">
						<span class="glyphicon glyphicon-user"></span> ${user.name} <span class="caret"></span>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</a>
					<ul class="dropdown-menu">
						<li><a href="javascript:void(0);" data-toggle="modal" data-target="#exitModal"><span class="glyphicon glyphicon-off"></span> 退出</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</div>
	
	<!-- 中间 -->
	<div id="center" style="position: absolute;top: 50px; bottom: 30px; left: 0px; right: 0px;">
	
		<!-- 导航 -->
		<div id="navigation" style="left: 0px; width: 18%; position: relative; height: 100%; overflow:auto;">
		
			<ul id="no1" class="nav nav-pills nav-stacked">
<%--				<li class="liClass"><a href="workbench/activity/index.jsp" target="workareaFrame"><span class="glyphicon glyphicon-play-circle"></span> 市场活动</a></li>--%>
				<li class="liClass"><a href="${pageContext.request.contextPath}/book/findAllBook" target="workareaFrame"><span class="glyphicon glyphicon-play-circle"></span> 主页</a></li>
				<li class="liClass">
					<a href="#no2" class="collapsed" data-toggle="collapse"><span class="glyphicon glyphicon-stats"></span> 后台系统</a>
					<ul id="no2" class="nav nav-pills nav-stacked collapse">
						<li class="liClass"><a href="${pageContext.request.contextPath}/book/findAllBook" target="workareaFrame">&nbsp;&nbsp;&nbsp;<span class="glyphicon glyphicon-chevron-right"></span> 图书管理</a></li>
						<li class="liClass"><a href="${pageContext.request.contextPath}/borrower/findAllBorrower" target="workareaFrame">&nbsp;&nbsp;&nbsp;<span class="glyphicon glyphicon-chevron-right"></span> 用户管理 </a></li>
					</ul>
				</li>
			</ul>
			
			<!-- 分割线 -->
			<div id="divider1" style="position: absolute; top : 0px; right: 0px; width: 1px; height: 100% ; background-color: #B3B3B3;"></div>
		</div>
		
		<!-- 工作区 -->
		<div id="workarea" style="position: absolute; top : 0px; left: 18%; width: 82%; height: 100%;">
			<iframe style="border-width: 0px; width: 100%; height: 100%;" name="workareaFrame"></iframe>
		</div>
		
	</div>
	
	<div id="divider2" style="height: 1px; width: 100%; position: absolute;bottom: 30px; background-color: #B3B3B3;"></div>
	
	<!-- 底部 -->
	<div id="down" style="height: 30px; width: 100%; position: absolute;bottom: 0px;"></div>
	
</body>
</html>
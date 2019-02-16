<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% String path = request.getContextPath(); %>
<% String topPath = "/assets/common/pages/top.jsp"; %>
<!DOCTYPE HTML>
<html lang="en">
<head>
	<jsp:include page="<%=topPath %>" ></jsp:include>
	
	<title>白银市信息资源共享交换平台</title>
	<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
	<!-- 浏览器小图标 -->
	<link href="<%=path%>/assets/login/images/login-icon.png" type="image/x-icon" rel="shortcut icon" />
    <link rel="stylesheet" href="<%=path%>/assets/index/css/common.css">
    <link rel="stylesheet" href="<%=path%>/assets/index/css/index.css">
</head>
<body style="overflow: hidden;">
    <input type="hidden" id="contextPath" value="<%=path%>">
    <div style="overflow: hidden;">
        <div class="bd clearfix main-header">
            <table class="main-top" style="width: 100%">
            	<tr>
            		<td style="width:500px;">
            			<div class="welcome clearfix">
                        	<img style="float: left;margin-left: 15px;margin-top: 10px;" src="assets/index/images/logo.png">
                        </div>
            		</td>
            		<td>
            			
            		</td>
            		<td style="width: 410px;min-width:410px;">
            			<ul class="toolbar clearfix" style="margin: 0px;">
                        	<li style="width: 200px;color: white">当前用户：<span id="span_userName">超级管理员</span></li>
                            <li><a href="javascript:;" handler="backCenter" title="返回工作台"><img src="<%=path%>/assets/index/images/index.jpg" alt=""></a></li>
	                        <li><a href="javascript:;" handler="modifyPass" title="修改密码"><img src="<%=path%>/assets/index/images/ico03.png" alt=""></a></li>
                            <li><a href="logout.bs" title="注销"><img src="<%=path%>/assets/index/images/esc.jpg" alt=""></a></li>
                        </ul>
            		</td>
            		<td style="width:200px;">
            			<div class="seleted-box">
                             <a class="seleted-btn" href="javascript:;">
                               <img src="<%=path%>/assets/index/images/map.png" alt="">
                               <span id="subSystemName" class="option-value">系统加载中...</span>
                             </a>
                            <div class="seleted-list">
                            </div>
                        </div>
            		</td>
            		<td style="width: 50px;"></td>
            	</tr>
            </table>
        </div>
        
        <!-- 子系统展示区 -->
        <div id="indexFragment" class="zsy">
        
        </div>
       <!-- <div class="ft">CopyRight&nbsp;©&nbsp;2005-2015&nbsp;Daasan&nbsp;All&nbsp;Rights&nbsp;Reserved</div> -->
    </div>
</body>

<!-- require.js  data-main属性，这个属性指定的js将在加载完reuqire.js后处理  -->
<script type="text/javascript" data-main="<%=path%>/index.js" src="<%=path%>/assets/common/js/require.js"></script>

</html>
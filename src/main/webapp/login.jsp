<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% String path = request.getContextPath(); %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<title>白银市信息资源共享交换平台</title>
	<link rel="SHORTCUT ICON" href="assets/login/images/login_zgsw_logo_yy.ico"/>
	<link rel="stylesheet" href="<%=path%>/assets/loading/css/loading.css">
    <link rel="stylesheet" href="<%=path%>/assets/login/css/login.css">
	<link rel="stylesheet" href="<%=path%>/assets/common/plugin/H-ui.admin-2.3/css/H-ui.min.css">
	<script type="text/javascript" src="<%=path%>/assets/common/js/jquery.min.js"></script>
	<script type="text/javascript" src="<%=path%>/assets/common/plugin/H-ui.admin-2.3/lib/layer/2.1/layer.js"></script>
	<script type="text/javascript" src="<%=path%>/assets/loading/js/loading.js"></script>
	<script type="text/javascript" src="<%=path%>/assets/login/js/getCNDate.js"></script>
	<script type="text/javascript" src="<%=path%>/assets/login/js/VerificationCode.js"></script>
	<script type="text/javascript" src="<%=path%>/assets/login/js/base64.js"></script>
</head>

<body style="overflow: hidden;">
	<div class="container">
        
        <div class="bd">
        	<div class="login-top"></div>
            <div class="login-box">
            	<div class="title">用户登录</div>
            	<form id="loginForm" action="<%=path%>/login.bs" method="post">
	                <div class="input-area">
	                    <p><input id="loginName" name="loginName" type="text" placeholder="用户名"></p>
	                    <p><input id="loginPass" name="loginPass" type="password" placeholder="密码"></p>
	                    <p>
	                    	<input id="identify"  name="identify" type="text" placeholder="验证码">
							<span id="code" class="identify-code">
								<canvas class="show-captcha" id="canvas" style="width: 100%; height: 100%;"></canvas>
							</span>
	                    </p>
	                </div>
                </form>
                <div class="login-btn">
                    <a id="loginBtn" href="#" style="text-decoration: none;">登录</a>
                </div>
	        	<div id="error" style="text-align: center;font-size: 20px;color: white; height: 20px;line-height: 20px; margin-top: 5px;"></div>
            </div>
        </div>
    </div>
</body>
<script type="text/javascript">
	var randomCode = "";
	var VerificationCodeErrCount = 0;
	$("#code").unbind('click').click(function(e){
		e.preventDefault();
		createCode();
	});
	
	//生成验证码
	function createCode(){
		VerificationCodeErrCount = 0;
		randomCode = drawPic();
		return randomCode;
	}
	
	//登录方法
	function login(){
		$("#error").html('');
		var usernameVal = $("#loginName").val();
		var passwordVal = $("#loginPass").val();
		var f = true;
		if(!usernameVal){
			$("#error").html("请输入用户名!");
			f = false;
			return;
		}
		 
		if(!passwordVal){
			$("#error").html("请输入密码!");
			f = false;
			return;
		}
		
		/*if($('#identify').val().toLowerCase() != randomCode.toLowerCase()){
			f = false;
			$("#error").html("验证码输入错误");
			VerificationCodeErrCount++;
			if(VerificationCodeErrCount >= 3) createCode();
			return;
		}*/
		
		if(f){
			var base = new Base64();
			passwordVal = base.encode(passwordVal); 
			Loading.start({title:'正在登录'});
			$.post('loginBase64.bs',{
				loginName:usernameVal,
				loginPass:passwordVal,
				'is_auto_login':$('#is_auto_login').is(':checked')?1:-1,
				'is_remember':$('#is_remember').is(':checked')?1:-1
			},function(data){
				if(data.meta.status == -1){
					createCode();
					$("#error").html(data.meta.msg);
				}else{
					if(data.users && data.users.length > 1){
						Loading.stop();
						var html = '';
						html += '<div style="font-weight:bold;">[选择登录帐号]</div><hr>';
						for(var i = 0; i < data.users.length;i++){
							html += '<div style="padding-bottom:5px;">';
							html += '<a style="color:white;text-decoration:underline;" href="javascript:;" val="'+ data.users[i].id +'" tag="account">';
							html += '	<span>'+ data.users[i].name +'</span>';
							html += '	<span>('+ data.users[i].orgname +')</span>';
							html += '</a>';
							html += '</div>';
						}
						
						layer.msg(html, {
						  	time: 20000, //20s后自动关闭
						  	btn: ['取消']
						});
						
						$("[tag='account']").click(function(){
							$.post('createUserSession.bs',{
								'id':$(this).attr("val"),
								'is_client':1,
								'is_auto_login':$('#is_auto_login').is(':checked')?1:-1,
								'is_remember':$('#is_remember').is(':checked')?1:-1
							},function(data){
								window.location.href = 'index.bs';
							},'json');
						});
						return;
					}
					window.location.href = 'index.bs';
				}
				Loading.stop();
			},'json');
		}
	}
	
	/* 重置方法 */
	function clear(){
		$("#loginName").val('');
		$("#loginPass").val('');
		$("#error").html('');
	}
	
	//回车登录 
	document.onkeydown = function(e) {
		var event = e || window.event;
		var code = event.keyCode || event.which || event.charCode;
		if (code == 13) {
			login();
		}
	};
	
	$(function(){
		createCode();
		 var loginBtn = $("#loginBtn");
	  	 loginBtn.click(function(){
	  		login(); 
	  	 });
	  	 
	  	 var clearBtn = $("#clearBtn");
	  	 clearBtn.click(function(){
	  		clear(); 
	  	 });
	  	 
	  	 // 自动登录触发
	  	 if($('#is_remember').is(':checked') && $('#is_auto_login').is(':checked')){
	  		 login();
	  	 }
	});
</script>
</html>
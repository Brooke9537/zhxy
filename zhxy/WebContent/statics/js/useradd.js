var userId = null;
var userName = null;
var userPassword = null;
var ruserPassword = null;
var telephone = null;
var gender = null;
var grade = null;
var major =null;
var Sclass = null;
var addBtn = null;
var userRole = null;
var backBtn = null;
var a_idPicPath = null;
var errorinfo = null;
var errorinfo_wp = null;


$(function(){
	userCode = $("#userId");
	userName = $("#userName");
	userPassword = $("#userPassword");
	ruserPassword = $("#ruserPassword");
	telephone = $("#telephone");
	gender = $("#gender");
	grade = $("#grade");
	major = $("#major");
	Sclass = $("Sclass");
	userRole = $("#userRole");
	addBtn = $("#add");
	backBtn = $("#back");
	a_idPicPath = $("#a_idPicPath");
	errorinfo = $("#errorinfo");
	errorinfo_wp = $("#errorinfo_wp");
	//初始化的时候，要把所有的提示信息变为：* 以提示必填项，更灵活，不要写在页面上
	userId.next().html("*");
	userName.next().html("*");
	userPassword.next().html("*");
	ruserPassword.next().html("*");
	telephone.next().html("*");
	gender.next().html("*");
	grade.next().html("*");
	major.next().html("*");
	Sclass.next().html("*");
	userRole.next().html("*");
	if(errorinfo.val() == null || errorinfo.val() == ""){
		a_idPicPath.next().html("* 上传大小不能超过500K * 上传文件类型必须为：jpg、jpeg、png、pneg");
	}else{
		a_idPicPath.next().html(errorinfo.val());
	}
	if(errorinfo_wp.val() == null || errorinfo_wp.val() == ""){
		a_workPicPath.next().html("* 上传大小不能超过500K * 上传文件类型必须为：jpg、jpeg、png、pneg");
	}else{
		a_workPicPath.next().html(errorinfo_wp.val());
	}
	
	$.ajax({
		type:"GET",//请求类型
		url:path+"/jsp/user.do",//请求的url
		data:{method:"getrolelist"},//请求参数
		dataType:"json",//ajax接口（请求url）返回的数据类型
		success:function(data){//data：返回数据（json对象）
			if(data != null){
				userRole.html("");
				var options = "<option value=\"0\">请选择</option>";
				for(var i = 0; i < data.length; i++){
					//alert(data[i].id);
					//alert(data[i].roleName);
					options += "<option value=\""+data[i].id+"\">"+data[i].roleName+"</option>";
				}
				userRole.html(options);
			}
		},
		error:function(data){//当访问时候，404，500 等非200的错误状态码
			validateTip(userRole.next(),{"color":"red"},imgNo+" 获取用户角色列表error",false);
		}
	});
	
	
	
	/*
	 * 验证
	 * 失焦\获焦
	 * jquery的方法传递
	 */
	userId.bind("blur",function(){
		//ajax后台验证--userCode是否已存在
		//user.do?method=ucexist&userCode=**
		/*$.ajax({
			type:"GET",//请求类型
			url:path+"/jsp/user.do",//请求的url
			data:{method:"ucexist",userCode:userCode.val()},//请求参数
			dataType:"json",//ajax接口（请求url）返回的数据类型
			success:function(data){//data：返回数据（json对象）
				if(data.userCode == "exist"){//账号已存在，错误提示
					validateTip(userCode.next(),{"color":"red"},imgNo+ " 该用户账号已存在",false);
				}else{//账号可用，正确提示
					validateTip(userCode.next(),{"color":"green"},imgYes+" 该账号可以使用",true);
				}
			},
			error:function(data){//当访问时候，404，500 等非200的错误状态码
				validateTip(userCode.next(),{"color":"red"},imgNo+" 您访问的页面不存在",false);
			}
		});*/
		
		
	}).bind("focus",function(){
		//显示友情提示
		validateTip(userId.next(),{"color":"#666666"},"* 用户编码是您登录系统的账号",false);
	}).focus();
	
	userName.bind("focus",function(){
		validateTip(userName.next(),{"color":"#666666"},"* 用户名长度必须是大于1小于10的字符",false);
	}).bind("blur",function(){
		if(userName.val() != null && userName.val().length > 1
				&& userName.val().length < 10){
			validateTip(userName.next(),{"color":"green"},imgYes,true);
		}else{
			validateTip(userName.next(),{"color":"red"},imgNo+" 用户名输入的不符合规范，请重新输入",false);
		}
		
	});
	
	userPassword.bind("focus",function(){
		validateTip(userPassword.next(),{"color":"#666666"},"* 密码长度必须是大于6小于20",false);
	}).bind("blur",function(){
		if(userPassword.val() != null && userPassword.val().length > 6
				&& userPassword.val().length < 20 ){
			validateTip(userPassword.next(),{"color":"green"},imgYes,true);
		}else{
			validateTip(userPassword.next(),{"color":"red"},imgNo + " 密码输入不符合规范，请重新输入",false);
		}
	});
	
	ruserPassword.bind("focus",function(){
		validateTip(ruserPassword.next(),{"color":"#666666"},"* 请输入与上面一只的密码",false);
	}).bind("blur",function(){
		if(ruserPassword.val() != null && ruserPassword.val().length > 6
				&& ruserPassword.val().length < 20 && userPassword.val() == ruserPassword.val()){
			validateTip(ruserPassword.next(),{"color":"green"},imgYes,true);
		}else{
			validateTip(ruserPassword.next(),{"color":"red"},imgNo + " 两次密码输入不一致，请重新输入",false);
		}
	});
	
	
	telephone.bind("focus",function(){
		validateTip(telephone.next(),{"color":"#666666"},"* 请输入手机号",false);
	}).bind("blur",function(){
		var patrn=/^(13[0-9]|15[0-9]|18[0-9])\d{8}$/;
		if(telephone.val().match(patrn)){
			validateTip(telephone.next(),{"color":"green"},imgYes,true);
		}else{
			validateTip(telephone.next(),{"color":"red"},imgNo + " 您输入的手机号格式不正确",false);
		}
	});
	
	userRole.bind("focus",function(){
		validateTip(userRole.next(),{"color":"#666666"},"* 请选择用户角色",false);
	}).bind("blur",function(){
		if(userRole.val() != null && userRole.val() > 0){
			validateTip(userRole.next(),{"color":"green"},imgYes,true);
		}else{
			validateTip(userRole.next(),{"color":"red"},imgNo + " 请重新选择用户角色",false);
		}
	});
	
	addBtn.bind("click",function(){
		/*if(userCode.attr("validateStatus") != "true"){
			userCode.blur();
		}else */if(userName.attr("validateStatus") != "true"){
			userName.blur();
		}else if(userPassword.attr("validateStatus") != "true"){
			userPassword.blur();
		}else if(ruserPassword.attr("validateStatus") != "true"){
			ruserPassword.blur();
		}else if(gender.attr("validateStatus") != "true"){
			birthday.blur();
		}else if(telephone.attr("validateStatus") != "true"){
			phone.blur();
		}else if(grade.attr("validateStatus") != "true"){
			phone.blur();
		}else if(major.attr("validateStatus") != "true"){
			phone.blur();
		}else if(Sclass.attr("validateStatus") != "true"){
			phone.blur();
		}
		/*else if(userRole.attr("validateStatus") != "true"){
			userRole.blur();
		}*/else{
			if(confirm("是否确认提交数据")){
				$("#userForm").submit();
			}
		}
	});
	
	backBtn.on("click",function(){
		if(referer != undefined 
			&& null != referer 
			&& "" != referer
			&& "null" != referer
			&& referer.length > 4){
		 window.location.href = referer;
		}else{
			history.back(-1);
		}
	});
});
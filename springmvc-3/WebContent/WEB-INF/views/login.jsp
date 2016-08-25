﻿﻿﻿<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
 
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";	
	  System.out.println(basePath);
	String type = request.getParameter("type");
	out.write("<script language='JavaScript'>var type= '" + type
			+ "';</script>");
			
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<base href="<%=basePath%>">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title></title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<link rel="icon" href="img/favicon.ico" type="image/x-icon" />
	<link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon" />
	
	<script type="text/javascript" src="js/EASY-UI/jquery-1.7.2.js"></script>
    <script type="text/javascript" src="js/EASY-UI/jquery.easyui.min.js"></script>
    <link rel="stylesheet" href="js/EASY-UI/themes/default/easyui.css" type="text/css"></link>
    <link rel="stylesheet" href="js/EASY-UI/themes/icon.css" type="text/css"></link>
    <script type="text/javascript" src="js/EASY-UI/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="js/jquery.cookie.js"></script>
	<script type="text/javascript" charset="UTF-8">
	 $(function(){
		 $("#psw").keydown(function(e){
			 var curKey = e.which; 
			 if(curKey == 13){
				 $("#loginsubmit").trigger("onclick");
				 return false; 
			 } 
			 });
			 console.log(11)		 ;
	});
	 
	//Joker:回车时，默认是登陆
	 function on_return(){
		 if(window.event.keyCode == 13){
		  if (document.all('loginsubmit')!=null){
		   document.all('loginsubmit').click();
		   }
		 }
	}
	 
	 function login1()
	 {
		 $('#loginInputForm').form(
					'submit',
					{
						url : 'LonginMain',
						onSubmit : function() 
						{
							return $('#loginInputForm').form('validate');
						},
						success : function(data) 
						{
							var data1 = eval('(' + data + ')');
							if (data1.success)
							{
								$.cookie('userid',data1.userid);
								$.cookie('UserName',data1.username);
								$.cookie('UserCompany',data1.companyName);
								$.cookie('authority',data1.authority);
								$.cookie('UserRName',data1.userRName);
								$.cookie('DepartName',data1.departName);
								$.cookie('OrgnCode',data1.orgnCode);
								$.cookie('UserIDNumber',data1.userIDNumber);
								$.cookie('userRName',data1.userRName);
								$.cookie('orgn_SaleName',data1.orgn_SaleName);
									var pathName = window.document.location;
									console.log(pathName);
								window.location.href = "main";
	 $.messager.progress( {text : '获取本用户权限Map'});
	
	$.post(
			'System/UserAction!getUserAuthorityMap',
		 { 
				UserID:data1.userid,
		 }, 
		function(result)
		{
		 $.messager.progress('close');
//			$("#ShowAuthorityDiv").slideUp(1000);
//			ClearAllCheckBox();
			if (result.success)
			{ 	var curWwwPath = window.document.location.href;
								var pathName = window.document.location.pathname;
								var pos = curWwwPath.indexOf(pathName);
								var localhostPaht = curWwwPath.substring(0, pos);
								var projectName = pathName.substring(0, pathName
										.substr(1).indexOf('/') + 1);
								 
								window.location.href = localhostPaht + projectName
										+ "WEB-INF/views/main/main.jsp";
			}
			else
			{
			   $.messager.show(
				{ 
					title : '警告',
					msg : result.msg
				});
			}
		}, 
		'json'); 
								
						
							} else
							{ 
								$.messager.alert('提示', data1.msg);
								$('#psw').val('');
							}
						}
					});
	 }
	 
	</script>
</head>

<body onkeydown="on_return();">
	<form method="post" id="loginInputForm">
		<table width="100%" height="100%" border="0" cellspacing="0"
			cellpadding="0">
			<tr>
				<td><table width="100%" border="0" cellspacing="0"
						cellpadding="0">
						<tr>
							<td height="561" style="background: url(img/lbg.gif)"><table
									width="940" border="0" align="center" cellpadding="0"
									cellspacing="0">
									<tr>
										<td height="238" style="background: url(img/login01.jpg)">&nbsp;</td>
									</tr>
									<tr>
										<td height="190"><table width="100%" border="0"
												cellspacing="0" cellpadding="0">
												<tr>
													<td width="208" height="190"
														style="background: url(img/login02.jpg)">&nbsp;</td>
													<td width="518" style="background: url(img/login03.jpg)"><table
															width="320" border="0" align="center" cellpadding="0"
															cellspacing="0">
															<tr>
																<td width="40" height="50"><img
																	src="img/user.gif" width="30" height="30"></td>
																<td width="38" height="50">登陆账号</td>
																<td width="242" height="50"><input type="text"
																	name="uemail" id="uemail" class="easyui-validatebox"
																	missingMessage="请输入登陆账号" invalidMessage="请输入正确账号"
																	style="width: 164px; height: 32px; line-height: 34px; background: url(img/inputbg.gif) repeat-x; border: solid 1px #d1d1d1; font-size: 9pt; font-family: Verdana, Geneva, sans-serif;"></td>
															</tr>
															<tr>
																<td height="50"><img src="img/password.gif"
																	width="28" height="32"></td>
																<td height="50">用户密码</td>
																<td height="50"><input type="test" onfocus="this.type='password'"
																	autocomplete="off" class="easyui-validatebox" required="true"
																	missingMessage="请输入密码" id="psw" name="password"
																	style="width: 164px; height: 32px; line-height: 34px; background: url(img/inputbg.gif) repeat-x; border: solid 1px #d1d1d1; font-size: 9pt;"></td>
															</tr>
															<tr>
																<td></td>
																<td></td>
											<!-- 					<td><input type="checkbox" name="rmbPassword"
																	id="rmbPassword" />记住密码</td> -->
															</tr>
															<tr>
																<td height="40">&nbsp;</td>
																<td height="40">&nbsp;</td>
																<td height="60"><img src="img/login.gif"
																	id="loginsubmit" width="95" height="34"
																	onclick="login1()"></td>

															</tr>

														</table></td>
													<td width="214" style="background: url(img/login04.jpg)">&nbsp;</td>
												</tr>
											</table></td>
									</tr>
									<tr>
										<td height="133" align="center"
											style="background: url(img/login05.jpg)"><font
											style="font-size: 11px; color: gray">版权所有&copy: 电子科技大学
												技术支持: 电子科技大学</font></td>
									</tr>
								</table></td>
						</tr>
					</table></td>
			</tr>
		</table>
	</form>
</body>
</html>

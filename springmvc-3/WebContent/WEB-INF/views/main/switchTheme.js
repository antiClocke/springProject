  /***********************************************************************************
  * 个性化主题功能实现相关函数
  * zjb
  ***********************************************************************************/
  function refreshThems(tarTheme)
  {
/* 	alert("切换主题1");
  	var iframes = $("iframe");
  	console.log(iframes);
  	var iframe0 = $("iframe").first();
  	console.log(iframe0);
  	var src = $("iframe").first().attr("src");
  	console.log("src：" + src);
    var children = $("iframe").get(0).contentDocument;
  	console.log("children31：" + children.getElementsByTagName("link"));	
	var links = $(children.getElementsByTagName("link"));
  	links.eq(0).attr("href","js/EASY-UI/themes/metro/easyui.css");  */

	$("[href$='easyui.css']").attr("href","js/EASY-UI/themes/"+ tarTheme +"/easyui.css");

  	// 获取页面内所有的iframe
  	var iframes = $("iframe");
  	for (var i=0;i<iframes.length;i++)  // 循环依次改变每个iframe的主题css
  	{
  		var children = $("iframe").get(i).contentDocument; // 关键步骤，获取iframe的dom对象
   	  	
		var links = $(children.getElementsByTagName("link"));  // 按标签名获取原始 集合， 并强制转换为Jquery对象
			  	
	  	links.filter("[href$='easyui.css']").attr("href","js/EASY-UI/themes/"+ tarTheme +"/easyui.css");
  	} 
  }
  
  function themesSwitcher()
  {
  	this.themes = new Array("default","metro","bootstrap","gray","black");
  	this.i = 0;
  	function nextThemes(){
  		i ++; if(i >= 5){ i = 0; console.log(i);}
  		$.cookie('theme', themes[i], { expires: 365 });
  		refreshThems($.cookie('theme'));
  	}
  	return  nextThemes;
  }
  var ts = themesSwitcher();
  
  function initialThems()
  {
  	if($.cookie('theme') == null)
  	{
  		$.cookie('theme', 'default', { expires: 365 });
  	}
  	
  	refreshThems($.cookie('theme'));
  }
  
   $(function() {
  		initialThems(); // 张金彬 
  		
  		$("#tabs").tabs ({
  			onAdd:function(title,index){
  				setTimeout("refreshThems($.cookie('theme'))",200);
  			}
  		});
    });
    
   /**
    * 处理退出系统请求，服务器session..
    */
   function logout()
   {	   
	  // $.cookie('userid', null, {path: '/reachTop'});   
	   $.post(
			   'UserAction!logout',
			   {},
			   function(result){
				   if(result.success)
				   {
					   var curWwwPath = window.document.location.href;
					   var pathName = window.document.location.pathname;
					   var pos = curWwwPath.indexOf(pathName);
					   var localhostPaht = curWwwPath.substring(0, pos);
					   var projectName = pathName.substring(0, pathName
							.substr(1).indexOf('/') + 1);
					   
					   window.location.href = localhostPaht + projectName
						+ "/login.jsp";
				   }
			   },
			   'json'
	   );
   }
   
/***************************************************************************************
 *  页面倒计时
****************************************************************************************/
var count_num = 0 ;
var timer;

//绑定定时器事件
$(function() {  
	backCount();
	document.onmousedown = resetCount;
	document.onkeydown = resetCount;
	$("#tabs").tabs ({
			onAdd:function(title,index) {
				setTimeout("regOptioneVent()",5000);
			}
	});
});

   
function backCount() {
	count_num ++;
	if(count_num >= 1200)
	{
		logout();  // 20分钟无操作，登出系统
	}
	if(count_num == 1190)
	{
		$.messager.show({
			title:'警告',
			msg:'太久没操作了，系统将在10秒后自动退出！',
			timeout:5000,
			showType:'show',
			style:{
				right:'',
				top:document.body.scrollTop+document.documentElement.scrollTop,
				bottom:''
			}
		});
	}
		
	$('#count').text(printf(1200 - count_num));
	timer = setTimeout("backCount()",1000);
}

function resetCount()
{
	count_num = 0;
	clearTimeout(timer);
	timer = setTimeout("backCount()",1000);
}
    
    

function printf(count){
	var strContent = '';
	
	if(count/60 < 10)
	{
		strContent += '0';
	}
	strContent += parseInt(count/60);
	strContent += ':';
	
	if(count%60 < 10)
	{
		strContent += '0';
	}
	strContent += count%60;
	return strContent;
}
  
    
function regOptioneVent()
{
  	var iframes = $("iframe");
  	for (var i=0;i<iframes.length;i++)  {
  		
  		var children = $("iframe").get(i).contentDocument; 
   	  	//console.log(children);
   	  	children.onmousedown = resetCount;
   	  	children.onkeydown = resetCount;
   	  	//console.log(children.onmousedown);
  	} 

}
    
    
    
    
    
    
    
    
    
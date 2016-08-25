function checkAccess(module,page,listshow1){
	var listshow2=arguments[3]?arguments[3]:'';
	var funcName=arguments[4]?arguments[4]:'';
	var url='reachTop/System/UserAction!IsHaveAuthority';
	if (funcName == '') {
	 	$.post(url, {
		 module:module,
		 page :page ,
		function1 :funcName,
	}, function(result) {
		if (result.success) { 
			 if(listshow2){
				
				 listshow1();
				 listshow2();
			 }else{
				 listshow1();
			 }
			
		} else {
			alert(result.msg);
			if (window.parent.$("#tabs").tabs('exists', page)){
		   		window.parent.$("#tabs").tabs('select', page);
		   		window.parent.$("#tabs").tabs('close', page);
		   		}
		 
		}
	}, 'json');

}else{
	
   $.each(funcName,function(index, content){
      
	   $.post(url,{
			 module:module,
			 page :page ,
			function1 :content.func
		}, function(result) {
			if (result.success) { 
				if(listshow2){
					listshow1();
					listshow2();
					
				}else{
					listshow1();
					
				} 
			} else {
				
				
			    if(typeof content.id !="undefined"){
			    alert("fjdskhjfd");
				$('#'+content.id).linkbutton('disable');
				
				$('#'+content.id).click(function(){
					return 0;
				});
			      
			    }
			    if(typeof content.name !="undefined"){
			    	$('a[name="'+content.name+'"').linkbutton('disable');
			    	$('a[name="'+content.name+'"').click(function(){
						return 0;
					});
			  
			    }
	           
		}		
		}, 'json');

   });

}
	
	
	
}

function getJson(AList,Blist){
	var s='';
	var pre=/(_\d)$/;
for (var i = 0; i < AList.length; i++) {
    if (s.length > 0) { s += "," ;}
    var flag=pre.test(AList[i]);
 
    if(flag){
    	s += "{\"name\":\"" + AList[i] + "\",\"func\":\"" + Blist[i] + "\"}";
    
    }else{
    s += "{\"id\":\"" + AList[i] + "\",\"func\":\"" + Blist[i] + "\"}";
    }
    
}
return  s =eval("[" + s + "]");
}

//获取功能信息；
function getFunName(){
	  var toolbar1=arguments[0]?arguments[0]:'toolbar';
	  var toolbar2=arguments[1]?arguments[1]:'';
	  var idArr=new Array();
	 
	  var funcArr=new Array();
	  var funName=new Array();
	  var nameArr=new Array();
	  //有固定id=toolbar形式的按钮格式
	  
	  var toolbarlink= typeof $("#"+toolbar1 +" .easyui-linkbutton") == "undefined"?'':$("#"+toolbar1 +" .easyui-linkbutton");
	 
	  
	
	  //工具栏功能判断
	 
	  if(toolbarlink){
		 
		  toolbarlink.each(function(i){
			 var name=$(this).text();
			 $(this).attr("name",name+"_"+i);
			 nameArr[i]=$(this).attr('name');
			  	 funcArr[i]=$(this).text();
			  }); 
       if(toolbar2){
    	   var toolbarlink2= typeof $("#"+toolbar2 +" .easyui-linkbutton") == "undefined"?'':$("#"+toolbar2 +" .easyui-linkbutton");
    	   if(toolbarlink2){
    		   toolbarlink2.each(function(i){
    			   var name=$(this).text();
    			   $(this).attr("name",name+"link2_"+i);
    				var len= nameArr.push($(this).attr('name'));
    				  	 funcArr.push($(this).text());
    			   console.log(len);
    		   });
    		   
    	   }
       }
		  funName=getJson(nameArr,funcArr);
		  console.log(funName);
		  return funName;
	 
	  
	  }
}	  
function getTableFun(){
	 var idArr=new Array();
	
	  var funcArr=new Array();
	  var funName=new Array();
	  //使用不同的table没有设置按钮id时
	  var containtool=typeof $("table[id*='Toolbar'] .easyui-linkbutton ") == "undefined"?'':$("table[id*='Toolbar'] .easyui-linkbutton ");
	  //存在table且id名称包含Toolbar
	  if(containtool){
		
		  $("table[id*='Toolbar'] .easyui-linkbutton ").each(function(i){
	          var str=$(this).attr('iconcls');
	          var str=str.split('-')[1];
	          $(this).attr('id',str+i);
	         idArr[i]=str+i;
	        funcArr[i]=$(this).text();

	    });
		  
	  }

        
		  funName=getJson(idArr,funcArr);
		  console.log(funName);
		  return funName;
	 
	  
}

//获取动态添加的toolbar里面的按钮。
function getDatagrid(){
	 var idArr=new Array();
	  var funcArr=new Array();
	  var funName=new Array();
	
	var datagridtool=typeof $('div.datagrid-toolbar a.l-btn') == "undefined"?'':$('div.datagrid-toolbar a.l-btn');
	 if(datagridtool){
		  var arr=new Array( 'add','remove','edit');
		  var j=0;
		  datagridtool.each(function(i){
			  var str=$(this).find("span .l-btn-text").attr('class');
			  
	    	  var pre=/icon-(.*) l-btn/g;
	    		var stra=pre.exec(str);
	    		
	    		if(jQuery.inArray(stra[1],arr)>=0){
	    			funcArr[j]=$(this).text();
	    			$(this).attr('id',stra[1]+j);
	    			idArr[j]=stra[1]+j;
	    			j++;
	    		   }
	    		
		  });
			  
	  }
	  console.log(funcArr);
	  funName=getJson(idArr,funcArr);
	  return funName;
}
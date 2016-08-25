﻿﻿﻿<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<% 
if( session == null || session.getAttribute("userid") == null)
{
	response.sendRedirect("../login.jsp");
	System.out.println("未登陆！");		
}
else
{
	System.out.println(session.getAttribute("userRName") +",欢迎来到瑞迪ERP系统!");		
}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>瑞迪ERP系统首页</title> 
    
    <link rel="icon" href="<%=basePath%>img/favicon.ico" type="image/x-icon" />
	<link rel="shortcut icon" href="<%=basePath%>img/favicon.ico" type="image/x-icon" />
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">

	<meta http-equiv="description" content="This is my page">

	<script type="text/javascript" src="js/EASY-UI/jquery-1.7.2.js" charset="utf-8"></script>
    <script type="text/javascript" src="js/EASY-UI/jquery.easyui.min.js" charset="utf-8"></script>
    <link rel="stylesheet" href="js/EASY-UI/themes/default/easyui.css" type="text/css"></link>
    <link rel="stylesheet" href="js/EASY-UI/themes/icon.css" type="text/css"></link>
    <script type="text/javascript" src="js/EASY-UI/locale/easyui-lang-zh_CN.js" charset="utf-8"></script>

  <script type="text/javascript" src="js/jquery.cookie.js"></script>
  <script type="text/javascript" src="main/switchTheme.js"></script>
  
  </head>
  
  <script type="text/javascript">
  $(function () 
		  {
		  
		var SystemManager_treeData = 
		  [{ text : "组织机构管理", attributes : {url : "SystemManager/Organization.jsp"} },
	       { text : "用户管理", attributes : {url : "SystemManager/user.jsp"} },
	       { text : "权限基础信息管理", attributes : {url : "SystemManager/AuthorityManager.jsp"} } ,
	        { text : "权限报表", attributes : {url : "SystemManager/authorityBB.jsp"} }
		
		  ];
	  
	  
		  $('#SystemManager').tree({
		  	  data : SystemManager_treeData,
		      lines : true,
		      onClick : function (node)
		        {
		             $(this).tree('toggle',node.target)
					Open(node.text, node.attributes.url);
		        }
		    });

	     //销售管理导航设置
	    var Sale_treeData = [
	     {
	    	text : "销售管理",
            state : "closed",
            children : [/* { text : "销售订单录入",attributes : {url : "sale/saleInput.jsp?typeflag=0&ci_ID=0&sales_Order_Id=0"}}, */
            			{ text : "销售订单新增",attributes : {url : "sale/htSaleInput.jsp"}},
            			{text : "销售订单管理",attributes : {url : "sale/saleManage.jsp" }},
            			{text : "销售订单审核",attributes : {url : "sale/saleShehe.jsp" }},
            			{text : "销售订单注销",attributes : {url : "sale/saleZhuxiao.jsp"}},
            			{text : "销售改价审核",attributes : {url : "sale/GaijiaShehe.jsp" }},
            			{text : "占用订单确认",attributes : {url : "sale/OccupyCheck.jsp" }},
            			{text : "销售占用录入",attributes : {url : "sale/saleOccupy.jsp" }},
            			{text : "销售占用管理",attributes : {url : "sale/saleOmanager.jsp" }},
            			//{text : "生产复命确认",attributes : {url : "sale/saleFuMing.jsp" }},
            			{text : "客户规格对应管理",attributes : {url : "sale/custProductCode.jsp" }},
            			{text : "客户禁止共享配置",attributes : {url : "sale/custForbid.jsp"}}                 			             			  
            			/* {text : "销售订单打印",attributes : {url : "sale/salePrint.jsp?checkflag=0"}}  */             			  
            		   ],
        },
        {
	    	text : "客户档案管理",
            state : "closed",
            children : [{text : "客户档案录入",attributes : {url : "zl/custInfoInput.jsp?typeflag=0&ci_ID=0" }},
                		{text : "客户档案管理",attributes : {url : "zl/custInfo.jsp?checkflag=0" }},
                		{text : "客户档案审核",attributes : {url : "zl/custInfo.jsp?checkflag=1" }},
                		{text : "客户档案停用",attributes : {url : "zl/custInfo.jsp?checkflag=2" }}
	    			   ]
	    }, 
	    {
	    	text : "客户基础数据维护",
            state : "closed",
            children : [{text : "产品类型行业基础库",attributes : {url : "sale/classifyIndustryBase.jsp" }},
                        {text : "客户统一码基础库",attributes : {url : "sale/custunicode.jsp" }},
                		{text : "销售代表助理经理对应基础库",attributes : {url : "sale/corrspdTravellerAssistantManager.jsp" }},
                		{text : "销售目标基础库",attributes : {url : "sale/salegole.jsp" }},
                		{text : "销售预测基础库",attributes : {url : "sale/saleyuce.jsp" }},
                		{text : "目标市场容量基础库",attributes : {url : "sale/saleRongliang.jsp" }},
                		{text : "大客户开发基础库",attributes : {url : "sale/saleDakehu.jsp" }},
                		{text : "客户基础数据批量更新",attributes : {url : "sale/BasicUpdate.jsp" }}
	    			   ]
	    },
	     {
	    	text : "销售报价管理",
            state : "closed",
            children : [{text : "销售询价",attributes : {url : "zh/askPrice.jsp" }},  
						/* {text : "销售报价管理",attributes : {url : "zh/xsAskPrice.jsp" }}, */
						{text : "客户合格时间预测",attributes : {url : "sale/salePredict.jsp" }},
						{text : "客户来单预测",attributes : {url : "sale/saleLaidanPredict.jsp" }}, 
/* 				 		{text : "生产报价管理",attributes : {url : "zh/scAskPrice.jsp" }}, 
						{text : "财务报价管理",attributes : {url : "zh/cwAskPrice.jsp?checkflag=1" }},  */
						{text : "报价流程维护",attributes : {url : "zh/reportManage.jsp" }},
						{text : "销售价格基础库",attributes : {url : "sale/SalePriceBasic.jsp" }} 
	    			   ]
	    },
	    {
	    	text : "投诉索赔管理",
            state : "closed",
            children : [{text : "新增投诉索赔",attributes : {url : "jcw/AddSuopei.jsp?typeflag=0&ss_Id=0&ss_Status=3"}},
                        {text : "投诉索赔管理",attributes : {url : "jcw/ClientShouhouGuanli.jsp" }},            			
            			{text : "责任金额解除",attributes : {url : "jcw/ZerenJineJiechu.jsp"}},
            			{text : "不合格品原因分析",attributes : {url : "jcw/BuhegeFenxi.jsp"}},
            			{text : "投诉索赔时间监控",attributes : {url : "jcw/TimeSupervise.jsp"}},
            			{text : "投诉索赔审核",attributes : {url : "jcw/SuopeiShenhe.jsp"}},
            			{text : "投诉索赔总报表",attributes : {url : "jcw/ZongBaoBiao.jsp"}},
            			{text : "财务扣款明细",attributes : {url : "jcw/KoukuanDetial.jsp"}}
	    			   ]
	    },
	    {
	    	text : "合同管理",
            state : "closed",
            children : [{text : "合同管理",attributes : {url : "sale/hetongManage.jsp"}},
            			{text : "合同审核管理",attributes : {url : "sale/hetongCheck.jsp"}}
	    			   ]
	    },
	    {
	    	text : "报关管理",
            state : "closed",
            children : [{text : "报关信息标准库",attributes : {url : "sale/manifestInfoManage.jsp"}} 
	    			   ]
	    },
	    {
	    	text : "销售报表",
            state : "closed",
            children : [{text : "公司签单报表",attributes : {url : "salebaobiao/QiandanBaobiao.jsp"}}, 
                        {text : "公司落单报表",attributes : {url : "salebaobiao/LuodanBaobiao.jsp"}}, 
                        {text : "公司发运报表",attributes : {url : "salebaobiao/FayunBaobiao.jsp"}},
                        {text : "公司销售目标、预测汇总表",attributes : {url : "salebaobiao/GoalBaobiao.jsp"}}
	    			   ]
	    },
	    {
	    	text : "国际营销中心报表",
            state : "closed",
            children : [{text : "装箱清单",attributes : {url : "salebaobiao/ZhuangxiangQingdan.jsp"}}, 
                        {text : "产品清单",attributes : {url : "salebaobiao/ChanpinQingdan.jsp"}}, 
                        {text : "R365装箱清单",attributes : {url : "salebaobiao/R365ZhuangxiangQingdan.jsp"}},
                        {text : "R365产品清单",attributes : {url : "salebaobiao/R365ChanpinQingdan.jsp"}}
	    			   ]
	    }
	    ];
	    
	    
	    
	    $('#SalesManager').tree
	    ({
	  	  data : Sale_treeData,
	        lines : true,
	        onClick : function (node) 
	        {   $(this).tree('toggle',node.target)
	        	Open(node.text, node.attributes.url);
	        }
	    });
	    
    
    	    //人力资源管理导航设置
	    var RenliZiyuan_treeData = [
	    	{
	    	text : "人力资源管理",
            state : "closed",
            children : [{
					text : "员工入职管理",
					attributes : {
					url : "jcw/YuangongRuzhi.jsp"
					}
				},{
					text : "员工离职管理",
					attributes : {
					url : "jcw/YuangongLeave.jsp"
					}
				},{
					text : "员工异动管理",
					attributes : {
					url : "jcw/YuangongYidong.jsp"
					}
				}/* ,{
					text : "劳动合同管理",
					attributes : {
					url : "jcw/LaodongHetong.jsp"
					}
				} */,{
					text : "社保公积金管理",
					attributes : {
					url : "jcw/ShebaoGongjijin.jsp"
					}
				}]
			},
			{
			text : "员工薪资管理",
            state : "closed",
            children : [{
					text : "计时员工薪资管理",
					attributes : {
					url : "jcw/JiShiSalary.jsp"
					}
				},{
					text : "计件员工薪资管理",
					attributes : {
					url : "jcw/JiJianSalary.jsp"
					}
				}]},
			{text : "法务管理",
            state : "closed",
            children : [{
					text : "商标管理",
					attributes : {
					url : "jcw/ShangbiaoManage.jsp"
					}
				},{
					text : "专利管理",
					attributes : {
					url : "jcw/ZhuanliManage.jsp"
					}
				}]},
		{text : "会议管理",
            state : "closed",
            children : [{
					text : "会议室设置",
					attributes : {
					url : "SystemManager/MeetingRoom.jsp"
					}
				},{
					text : "会议预定",
					attributes : {
					url : "SystemManager/MeetingDetail.jsp"
					}
				}]}
	    ];
	    	    	    
	    $('#RenliZiyuanManange').tree
	    ({
	  	  data : RenliZiyuan_treeData,
	        lines : true,
	        onClick : function (node) 
	        {   $(this).tree('toggle',node.target)
	        	Open(node.text, node.attributes.url);
	        }
	    });


	   /*  var ProPlan_treeData = [
					{text : "计划任务处理",attributes : {url : "proPlanManager/mainProPlan_Task.jsp"}}, 

			        {text : "主生产计划",state : "closed",children : [    
							{text : "备库计划基础库管理",attributes : {url : "proPlanManager/beikuPlanBasicMgt.jsp"}},               
							{text : "生产计划管理",attributes : {url : "proPlanManager/mainPlanManager.jsp"}},               
                   			{text : "主生产计划审核",attributes : {url : "proPlanManager/mainPlanManager.jsp?isCheck=1"}}
							]},
							
							
					{text : "库存利用",state : "closed",children : [    		
                   			{text : "库存利用管理",attributes : {url : "proPlanManager/storeUseManager.jsp"}}
                   			]},
                   			
                   			
                   	{text : "生产任务清单",state : "closed",children : [   		
                   			{text : "生产任务清单管理",attributes : {url : "proPlanManager/PlanDistributeDetail.jsp"}},
                    		{text : "生产任务清单审核",attributes : {url : "proPlanManager/PlanDistriCheck.jsp"}}
                   			]},
                   			
                   	{text : "计划分配清单",state : "closed",children : [   		
                   			{text : "计划分配清单管理",attributes : {url : "proPlanManager/PlanAllocationManager.jsp"}}//,
                     		//{text : "计划分配清单审核",attributes : {url : "proPlanManager/ProductAllocationCheck.jsp"}}
                    		]},
                    		
                    {text : "派工单",state : "closed",children : [   		
	                 		{text : "派工单管理",attributes : {url : "proPlanManager/AssignDetailManager.jsp"} }
	             			]},
                    		
                    {text : "计划基础设置",state : "closed",children : [    
                    		{text : "生产计划类型",attributes : {url : "proPlanManager/proPlanTypeManager.jsp"}},
                    		{text : "销售库存利用原则库",attributes : {url : "proPlanManager/saleStoreUsePrinciple.jsp"}},
                    		{text : "计划短溢装设置",attributes : {url : "proPlanManager/mainRMT_Manager.jsp"}} 
                    		]}
							]; */

	   var ProPlan_treeData = [
					{text : "计划任务处理",attributes : {url : "proPlanManager/mainProPlan_Task.jsp"}}, 

			        {text : "主生产计划",state : "closed",children : [    
			                {text : "备库计划基础库管理",attributes : {url : "proPlanManager/beikuPlanBasicMgt.jsp"}},
							{text : "生产计划管理",attributes : {url : "proPlanManager/mainPlanManager.jsp"}},               
                   			{text : "主生产计划审核",attributes : {url : "proPlanManager/mainPlanManager.jsp?isCheck=1"}}
							]},
													
					{text : "库存利用",state : "closed",children : [    		
                   			{text : "库存利用管理",attributes : {url : "proPlanManager/storeUseManager.jsp"}}
                   			]},
                   			
                   			
                   	{text : "生产任务清单",state : "closed",children : [   		
                   			{text : "生产任务清单管理",attributes : {url : "proPlanManager/PlanDistributeDetail.jsp"}},
                    		{text : "生产任务清单审核",attributes : {url : "proPlanManager/PlanDistriCheck.jsp"}}
                   			]},
                   			
                   	{text : "计划分配清单",state : "closed",children : [   		
                   			{text : "计划分配清单管理",attributes : {url : "proPlanManager/PlanAllocationManager.jsp"}}//,
                     		//{text : "计划分配清单审核",attributes : {url : "proPlanManager/ProductAllocationCheck.jsp"}}
                    		]},
                    		
                    {text : "派工单",state : "closed",children : [   		
	                 		{text : "派工单管理",attributes : {url : "proPlanManager/AssignDetailManager.jsp"} }
	             			]},
                    		
                    {text : "计划基础设置",state : "closed",children : [    
                    		{text : "生产计划类型",attributes : {url : "proPlanManager/proPlanTypeManager.jsp"}},
                    		{text : "销售库存利用原则库",attributes : {url : "proPlanManager/saleStoreUsePrinciple.jsp"}},
                    		{text : "计划短溢装设置",attributes : {url : "proPlanManager/mainRMT_Manager.jsp"}} 
                    		]},
                    {text : "复命管理",state : "closed",children : [    
                    		                                       		{text : "计划员复命管理",attributes : {url : "proPlanManager/finManager/planPersonMang.jsp"}},
                    		                                       		{text : "计划主管复命管理",attributes : {url : "proPlanManager/finManager/planMainBoss.jsp"}},
                    		                                       		{text : "销售代表复命管理",attributes : {url : "proPlanManager/finManager/saleFinMang.jsp"}} 
                    		                                       		]}
							];
	                        		    
	                        	    
	                        	    $('#ProPlan').tree
	                        	    ({
	                        	  	  data : ProPlan_treeData,
	                        	        lines : true,
	                        	        onClick : function (node) 
	                        	        {   $(this).tree('toggle',node.target)
	                        	           /* if (node.attributes) 
	                        	            {
	                        	          	  if($.cookie('authority').indexOf(node.text)>-1)
	                        	                	Open(node.text, node.attributes.url);
	                        	          	  else
	                        	          		  alert("您没有权限访问此页面，请重新登录");
	                        	            }*/
	                        	        	Open(node.text, node.attributes.url);
	                        	        }
	                        	    }); 
	                        	    
	                        	    
	                        	    var StoreMang_treeData = [
	                        	{
	                           	 text : "生产计划类型",
	                           	 attributes : {
	                                url : "ProducePlan/proPlanType.jsp"
	                            			  }
	                        	},
	                        	{
	                        	 text : "库房基础设置",//左侧导航栏添加库房基础设置
	                           	 attributes : {
	                                			url : "Storage/StoreHouseBasic.jsp"
	                            			  }
	                        	},
	                        		                  	     
	                        		                   	    ];
	                        		    
	                        	    
	                        	    $('#StoreManager').tree
	                        	    ({
	                        	  	  data : StoreMang_treeData,
	                        	        lines : true,
	                        	        onClick : function (node) 
	                        	        {   $(this).tree('toggle',node.target)
	                        	           /* if (node.attributes) 
	                        	            {
	                        	          	  if($.cookie('authority').indexOf(node.text)>-1)
	                        	                	Open(node.text, node.attributes.url);
	                        	          	  else
	                        	          		  alert("您没有权限访问此页面，请重新登录");
	                        	            }*/
	                        	        	Open(node.text, node.attributes.url);
	                        	        }
	                        	    });  
	    $('#ProPlan').tree
	    ({
	  	  data : ProPlan_treeData,
	        lines : true,
	        onClick : function (node) 
	        {   $(this).tree('toggle',node.target)
	           /* if (node.attributes) 
	            {
	          	  if($.cookie('authority').indexOf(node.text)>-1)
	                	Open(node.text, node.attributes.url);
	          	  else
	          		  alert("您没有权限访问此页面，请重新登录");
	            }*/
	        	Open(node.text, node.attributes.url);
	        }
	    }); 
	    
	    
	var StoreMang_treeData = [
	                              
	{text : "库房基础管理",state : "closed",children :[                             
	{text : "出入库类型",attributes : {url : "Store/StorageTypeBasic.jsp" }},
	{text : "库房分类设置",attributes : {url : "Storage/StoreHouseCls.jsp"}},
	{text : "库房基础设置",attributes : {url : "Storage/StoreHouseBasic.jsp"}},
	{text : "库房区域设置",attributes : {url : "Store/StorageAreaBasic.jsp"}},
	/* {text : "在制品遗留页面",attributes : {url : "Storage/ProductLeftTable.jsp"}} */
	]},
	
	{text : "产品入库管理",state : "closed",children :[     
	
	//{text : "生产入库新建",attributes : {url : "Storage/ProductStorage.jsp"}},	
	//{text : "委托入库新建",attributes : {url : "Storage/EntrustStorageIn.jsp"}},
	//{text : "采购入库申请管理",attributes : {url : "Storage/PurchaseStorage.jsp"}},
	//{text : "材料采购入库申请管理",attributes : {url : "Storage/MaterialPurchaseStorage.jsp"}},	 	
	{text : "入库申请录入",attributes : {url : "Storage/StorageInAll3.jsp"}},	 
	{text : "入库申请管理",attributes : {url : "Storage/StorageInAllPreManager.jsp"}},	
	{text : "质检产品入库",attributes : {url : "Storage/ChekResultDisMain.jsp"}},
	{text : "无需质检产品入库",attributes : {url : "Storage/StorageInApply.jsp"}}, 
	{text : "产品入库管理",attributes : {url : "Storage/StorageInAllManager.jsp"}},		
	//{text : "产品待入库管理",attributes : {url : "Storage/ProductPreStorage.jsp"}}, 
	//{text : "产品质量检测",attributes : {url : "Storage/ProductQualityExamine.jsp"}}, 			                	
	 /* {text : "废品入库",  attributes : {url : "Storage/WasteInManager.jsp" }}, */ 
	{text : "废品入库",  attributes : {url : "Storage/WasteStorageIn.jsp" }}, 
	{text : "废品入库审核",  attributes : {url : "Storage/WasteStorageInManager.jsp" }}, 
	/* {text : "退货入库",	attributes : {url : "Storage/ReturnStorage.jsp"}}  */
	]},
	
	{text : "产品出库管理",state : "closed",children :[ 
	{text : "产品出库"		,	attributes : {url : "Storage/StorageOutAll2.jsp" }},
	{text : "产品出库管理"		,	attributes : {url : "Storage/StorageOutManager.jsp" }},
	//{text : "销售退货管理"	,	attributes : {url : "Storage/SaleGoodsReturn.jsp" }},
	//{text : "产品出库"		,	attributes : {url : "Storage/ProductOut.jsp" }},
	//{text : "装配拉坯出库"	,	attributes : {url : "Storage/APO.jsp"}},                                             
	//{text : "下料出库管理",attributes : {url : "Storage/MaterialOutManager.jsp"}},
	//{text : "下料出库审核",attributes : {url : "Storage/MaterialOutManager.jsp?isCheck=1"}},
	//{text : "销售出库管理",attributes : {url : "Storage/SaleStorageOut.jsp"}},			           	                   	    
	//{text : "销售出库审核",attributes : {url : "Storage/SaleStorageOutVerify.jsp"}},	
	{text : "出库审核",attributes : {url : "Storage/StorageOutVerifyAll.jsp"}},			           	                   	    
	//{text : "发运出库",attributes : {url : "Storage/TransStorageOut.jsp"}}
	]},
	
	
	/*供方库暂时不显示*/


	 {text : "供应商库房管理",state : "closed",children :[ 

   	{text : "收货计划"		,	attributes : {url : "Storage/ReceivingPlan.jsp?rpm_PlanNo=0" }},
   	{text : "收货计划管理"		,	attributes : {url : "Storage/ReceivingPlanMgt.jsp" }},
	{text : "供应商入库申请"		,	attributes : {url : "Storage/GYSStorageInApply.jsp" }},
	{text : "供应商入库申请管理"		,	attributes : {url : "Storage/GYSStorageInManager.jsp" }},
	{text : "供应商质检产品入库"		,	attributes : {url : "Storage/ChekResultDisMain.jsp?isSupply=1" }},
	{text : "供应商产品入库管理"		,	attributes : {url : "Storage/StorageInAllManager.jsp" }},
    {text : "供应商库存转账新建"		,	attributes : {url : "Storage/GYSstorageTransfer.jsp" }},
    {text : "供应商库存转账管理"		,	attributes : {url : "Storage/GYSstorageTransferManager.jsp" }},
    {text : "供应商库存转账审核"		,	attributes : {url : "Storage/GYSstorageTransferAudit.jsp" }},

   	]},  

	
   	
	{text : "盘点管理",state : "closed",children :[    
	{text : "盘点信息管理",attributes : {url : "Storage/CheckStorageManager.jsp"}},
	{text : "盘点审核",attributes : {url : "Storage/CheckStorageManager.jsp?isCheck=1"}}
	]},
	
	{text : "发货单",state : "closed",children :[ 
	{text : "发货单",attributes : {url : "proBasicInfo/SendRecordManager.jsp"}},
	{text : "发货单审核",attributes : {url : "proBasicInfo/SendRecordManager.jsp?isCheck=1"}},
	{text : "发运打印",attributes : {url : "Storage/suplDeliAndBuyRecpt.jsp"}}
	]},
	
	{text : "调拨管理",state : "closed",children :[ 
	{text : "调拨单管理"	,attributes : {url : "Storage/StorageOut_Allot.jsp"}},
	{text : "调拨单审核"	,attributes : {url : "Storage/StorageOut_Allot.jsp?isCheck"	}}
	]},
	
	{text : "借用管理",state : "closed",children :[ 
	{text : "领料单管理",attributes : {url : "Storage/StorageOut_Apply.jsp"}},	
	{text : "领用单部门领导审核",attributes : {url : "Storage/StorageOut_Apply.jsp?leaderCheck"}},	
	{text : "领用单库房审核",attributes : {url : "Storage/StorageOut_Apply.jsp?StoreCheck"}},
	{text : "领用出库",attributes : {url : "Storage/ApplyStorageOut.jsp"}},
	{text : "领用出库审核",attributes : {url : "Storage/ApplyStorOutManager.jsp"}},
	{text : "归还入库"	,attributes : {url : "Storage/ApplyStorInManager.jsp"}},
	/*归还入库原页面，现在用ApplyStorInManager页面，如果后期不用可以删除*/
	{text : "归还入库管理"	,attributes : {url : "Storage/ReturnStorInManager.jsp"}}
	]},
	{text : "红字管理",state : "closed",children :[ 
	                                         	{text : "红字入库"		,	attributes : {url : "Storage/StorageInRedManager.jsp" }},
	                                         	{text : "红字入库审核",attributes : {url : "Storage/StorageRedInVerify.jsp"}},
	                                         	{text : "红字出库"		,	attributes : {url : "Storage/StorageOutRed.jsp" }},	                                        
	                                         	{text : "红字出库审核",attributes : {url : "Storage/StorageRedOutVerify.jsp"}},			           	                   	    
	                                         	]},
	{text : "报表管理",state : "closed",children :[ 	                                         	                                        			           	                   	    


	                                         	{text : "库存收发存汇总表"		,	attributes : {url : "Storage/StorageSummary.jsp" }}, 
	                                         	{ text : "库存存量表记录", attributes : { url : "financialManager/ProductStocksList.jsp" }},
	                                         	/* { text : "物资销售报表", attributes : { url : "Storage/MaterialSaleBB.jsp" }}  */                                        			           	                   	                                            
	                                         	{ text : "物资非定额领用表", attributes : { url : "Storage/StorageOutMaterialRequisitionReport.jsp" } } ,                                        			           	                   	    

	                                         	]},
	{text : "库存转账",attributes : {url : "Store/ProductStocksManager.jsp"}},
	{text : "库存结存",attributes : {url : "Storage/StorageBalance.jsp"}},	
	/* {text : "库存存量表查看",attributes : {url : "financialManager/ProductStocksList.jsp"}}	 */
	];
		     
	    $('#StoreManager').tree
	    ({
	  	  data : StoreMang_treeData,
	        lines : true,
	        onClick : function (node) 
	        {   $(this).tree('toggle',node.target)
	           /* if (node.attributes) 
	            {
	          	  if($.cookie('authority').indexOf(node.text)>-1)
	                	Open(node.text, node.attributes.url);
	          	  else
	          		  alert("您没有权限访问此页面，请重新登录");
	            }*/
	        	Open(node.text, node.attributes.url);
	        }
	    });  
 
	    var ProBasicMang_treeData = [
	                                 {
	         					    	text : "物品代码管理",
	         				            state : "closed",
	         				            children : [
											{
   											 text : "货品类别设置",
    											attributes : {
        										url : "proBasicInfo/goodsTypeCodeSet.jsp"
    												}
											},{
	         				                    text : "装配关系管理",
	         				                    attributes : {
	         				                        url : "proBasicInfo/list_BOM.jsp"
	         				                    }
	         				                },
	         				                        {
	         				                    text : "产品代码管理",
	         				                    attributes : {
	         				                        url : "proBasicInfo/productManager.jsp"
	         				                    }
	         				                },
	         				                {
	         				                    text : "产品工艺配置",
	         				                    attributes : {
	         				                        url : "proBasicInfo/productPriceManager.jsp?isCheck=0"
	         				                    }
	         				                },
	         				               {
	         				                    text : "产品工艺审核",
	         				                    attributes : {
	         				                        url : "proBasicInfo/productPriceManager.jsp?isCheck=1"
	         				                    }
	         				                },
	         				                {
	         				                    text : "产品工序价配置",
	         				                    attributes : {
	         				                        url : "proBasicInfo/processPriceManager.jsp?isCheck=0"
	         				                    }
	         				                },
	         				               	{
	         				                    text : "产品工序价审核",
	         				                    attributes : {
	         				                        url : "proBasicInfo/processPriceManager.jsp?isCheck=1"
	         				                    }
	         				                },
	         				                {
	         				                    text : "原材料管理",
	         				                    attributes : {
	         				                        url : "proBasicInfo/materialManager.jsp"
	         				                    }
	         				                },
	         				                {
	         				                    text : "物资管理",
	         				                    attributes : {
	         				                        url : "proBasicInfo/goodsManager.jsp"
	         				                    }
	         				                },
	         				                {
	         				                    text : "外协厂工序价格管理",
	         				                    attributes : {
	         				                        url : "proBasicInfo/outDeptPriceManager.jsp"
	         				                    }
	         				                }
	         				                
	         				        ],
	         				        },
		{	         
		   	         text : "产品工艺管理",
           			 state : "closed",
		     children : [{
                    text : "基础工序管理",
                    attributes : {
                        url : "proBasicInfo/ProducProcessBasic.jsp"
                    }
                },
                {
                    text : "基础工艺路线管理",
                    attributes : {
                        url : "proBasicInfo/ProcessRoute.jsp"
                    }
                },
                {
  	 				text : "材质类型设置",
  	 				attributes : {
       						url : "proBasicInfo/ValueMaterialBasic.jsp"
  					 }
						},
		                    {
  	 				text : "材料形态设置",
  	 				attributes : {
       						url : "proBasicInfo/TypeMaterialBasic.jsp"
  					 }
						}
        ],
        },
        {	         
 	         text : "生产基础数据",
 			 state : "closed",
   children : [{
          text : "产品代码库管理",
          attributes : {
              url : "proBasicInfo/productCodeLib.jsp"
          }
      },{
          text : "产品替换库管理",
          attributes : {
              url : "proBasicInfo/MaterialReplace.jsp"
          }
      },{
          text : "改制产品规则管理",
          attributes : {
              url : "proBasicInfo/ChangeRule.jsp"
          }
      },
      {
          text : "工艺路线库管理",
          attributes : {
              url : "proBasicInfo/processRouteLib.jsp"
          }
      },
      {
				text : "工序编码库管理",
				attributes : {
						url : "proBasicInfo/processCode.jsp"
				 }
				},
               {
				text : "机加工价库管理",
				attributes : {
						      url : "proBasicInfo/productProPriceLib.jsp"
				             }
				},
               {
				text : "改制工价库管理",
				attributes : {
						      url : "proBasicInfo/ChangeproductProPriceLib.jsp"
				             }
				},
				{
					text : "装配工价库管理",
					attributes : {
							      url : "proBasicInfo/productFitPriceLib.jsp"
					             }
				}
				
],
},
       
	    ];
		   		   	    
	        	    

	        	    $('#ProduceBasicManager').tree
	        	    ({
	        	  	  data : ProBasicMang_treeData,
	        	        lines : true,
	        	        onClick : function (node) 
	        	        {   $(this).tree('toggle',node.target)
	        	           /* if (node.attributes) 
	        	            {
	        	          	  if($.cookie('authority').indexOf(node.text)>-1)
	        	                	Open(node.text, node.attributes.url);
	        	          	  else
	        	          		  alert("您没有权限访问此页面，请重新登录");
	        	            }*/
	        	        	Open(node.text, node.attributes.url);
	        	        }
	        	    }); 
	        	  //生产过程侧边栏设置开始	    
	        	
	        	    $('#ProduceBasicManager').tree
	        	    ({
	        	  	  data : ProBasicMang_treeData,
	        	        lines : true,
	        	        onClick : function (node) 
	        	        {   $(this).tree('toggle',node.target)
	        	           /* if (node.attributes) 
	        	            {
	        	          	  if($.cookie('authority').indexOf(node.text)>-1)
	        	                	Open(node.text, node.attributes.url);
	        	          	  else
	        	          		  alert("您没有权限访问此页面，请重新登录");
	        	            }*/
	        	        	Open(node.text, node.attributes.url);
	        	        }
	        	    }); 
	        	  //生产过程侧边栏设置开始	    
	        	    var ProProcess_treeData = [
	        	     {
	         					    	text : "下料跟单",
	         				            state : "closed",
	         				            children : [                 	     
	        		{text : "下料跟单新建",attributes : {url : "ProProcess/cutOrderNew.jsp"}},
	   /*      		{text : "下料跟单查看",attributes : {url : "ProProcess/cutOrderManage.jsp?proFlag=0"}}, */
	        		{text : "下料跟单管理",attributes : {url : "ProProcess/cutOrderManage.jsp?proFlag=1"}},
	        		{text : "下料跟单扫描录入",attributes : {url : "ProProcess/cutOrderSweep.jsp"}},
	        	
	        		  ]},
	        		       {
	         					    	text : "生产跟单",
	         				            state : "closed",
	         				            children : [       
	         				            	{text : "生产跟单新建",attributes : {url : "ProProcess/proOrderNew.jsp"}}   ,       	     
	        				/* {text : "生产跟单查看",attributes : {url : "ProProcess/proOrderManage.jsp?proFlag=0"}}, */
	        		{text : "生产跟单管理",attributes : {url : "ProProcess/proOrderManage.jsp?proFlag=1"}},
	        	/* 	{text : "生产跟单异常注销申请",attributes : {url : "ProProcess/proOrderManage.jsp?proFlag=2"}},
	        		{text : "生产跟单异常注销审核",attributes : {url : "ProProcess/proOrderManage.jsp?proFlag=3"}}, */
	        		{text : "生产跟单扫描录入",attributes : {url : "ProProcess/proOrderSweep.jsp"}},
	        			
	        		  ]},
	        		  	  	       {
	         					    	text : "装配跟单",
	         				            state : "closed",
	         				            children : [                 	     
	        	  	 {text : "装配跟单新建",attributes : {url : "ProProcess/AssOrderNew.jsp"}},
	        		/* {text : "装配跟单查看",attributes : {url : "ProProcess/AssemblyManager.jsp?AssFlag=0"}}, */
	        		{text : "装配跟单管理",attributes : {url : "ProProcess/AssemblyManager.jsp?AssFlag=1"}},
	        	/* 	{text : "装配跟单异常注销申请",attributes : {url : "ProProcess/AssemblyManager.jsp?AssFlag=2"}},
	        		{text : "装配跟单异常注销审核",attributes : {url : "ProProcess/AssemblyManager.jsp?AssFlag=3"}},
	        		 */{text : "装配跟单扫描录入",attributes : {url : "ProProcess/AssOrderSweep.jsp"}},
	        		  ]},   {
	         					    	text : "库存锁定审核",
	         				            state : "closed",
	         				            children : [                 	     
	            	{text : "库存锁定审核",attributes : {url : "ProProcess/LockAudit.jsp"}} 
	      
	        	
	        		  ]},
	   		  	       {
					    	text : "改制跟单",
				            state : "closed",
				            children : [                 	     
			{text : "改制跟单新建",attributes : {url : "ProProcess/changeOrderNew.jsp"}}, 
		{text : "改制跟单管理",attributes : {url : "ProProcess/changeOrderManage.jsp?proFlag=1"}}, 
		{text : "改制跟单扫描录入",attributes : {url : "ProProcess/changeOrderSweep.jsp"}},
		  ]},
		  {
				text : "返工跟单",
			  state : "closed",
			  children : [                 	     
			{text : "返工跟单新建",attributes : {url : "ProProcess/returnOrderNew.jsp"}},
		 
			{text : "返工跟单管理",attributes : {url : "ProProcess/returnOrderManage.jsp?proFlag=1"}},
 
			{text : "返工跟单扫描录入",attributes : {url : "ProProcess/returnOrderSweep.jsp"}},
			]},
		       {
			    	text : "拆卸跟单",
		            state : "closed",
		            children : [                 	     
	{text : "拆卸跟单新建",attributes : {url : "ProProcess/takePartOrderNew.jsp"}},
	 
	{text : "拆卸跟单管理",attributes : {url : "ProProcess/takePartOrderManage.jsp?proFlag=1"}},
 
	{text : "拆卸跟单扫描录入",attributes : {url : "ProProcess/takePartOrderSweep.jsp"}},
	]},
							 	       {
								    	text : "计划委托跟单",
							         state : "closed",
							         children : [                 	     
							{text : "计划委托跟单新建",attributes : {url : "ProProcess/delePlanOrderNew.jsp"}},
							{text : "计划委托跟单管理",attributes : {url : "ProProcess/delePlanOrderManage.jsp"}},
							
							]},  {
	         					    	text : "临时委托跟单",
	         				            state : "closed",
	         				            children : [                 	     
							        	{text : "临时委托跟单新建",attributes : {url : "ProProcess/deleOrderNew.jsp"}},
							        		{text : "临时委托跟单管理",attributes : {url : "ProProcess/deleOrderManage.jsp"}},
							        		{text : "临时委托出库管理",attributes : {url : "ProProcess/deleOrderOut.jsp"}},
							        		{text : "临时委托入库管理",attributes : {url : "ProProcess/deleOrderIn.jsp"}} ,
							        		  ]},
							        		   {
							text : "临时委托质检",
							state : "closed",
							children : [	      	     
	                     {text : "临时委托质检单新建",attributes : {url : "Quality/qualityDOrderNew.jsp"}},
	        			{text : "临时委托质检单管理",attributes : {url : "Quality/qualityDOrderManage.jsp"}}, 
	        			  ]}, {
	         					    	text : "报表",
	         				            state : "closed",
	         				            children : [                 	     
	        		{text : "跟单扫描信息",attributes : {url : "ProProcess/AllOrderSweepDetail.jsp"}},
	        		{text : "生产汇总报表",attributes : {url : "ProProcess/ProCollectionRpt.jsp"}},
	        		  ]},/* ,
	        		    		  	  		  	  	       {
	         					    	text : "生产任务安排",
	         				            state : "closed",
	         				            children : [                 	     
	        	
	        		{text : "生产任务安排",attributes : {url : "ProProcess/TaskArrange.jsp"}} ,
	        		{text : "生产班任务安排",attributes : {url : "ProProcess/TaskArrangePro.jsp"}},
	        		{text : "装配任务安排",attributes : {url : "ProProcess/TaskArrangeAss.jsp"}},
	        		{text : "下料任务安排",attributes : {url : "ProProcess/TaskArrangeCut.jsp"}},  
	        		  ]}, */
	        	 ];
	        			    
	        		 $('#ProProcess').tree
	        		    ({
	        		  	  	data : ProProcess_treeData,lines : true,onClick : 
	        		  	  	function (node) 
	        		      	{   $(this).tree('toggle',node.target)
	        		      		Open(node.text, node.attributes.url);
	        				}
	        		    }); 

	        	//生产过程侧边栏设置结束
//设备侧边栏开始
   var Equipment_treeData = [
	        { text : "设备基础信息",  state : "closed", children : [ 	
			                { text : "设备类型", attributes : { url : "equipment/equipTypeInfo.jsp" } }, 
							{ text : "设备名称型号", attributes : { url : "equipment/equipNameAndModel.jsp" } }, 
							{ text : "设备台帐管理", attributes : { url : "equipment/equipmentInfo.jsp" } },] },
			{ text : "设备维护项目", state : "closed", children : [ 
							{ text : "设备维护项目管理", attributes : { url : "equipment/equipUpkeep.jsp" } }, ] },
			{ text : "设备日常维护计划", state : "closed", children : [
							{ text : "设备维护计划录入", attributes : { url : "equipment/upkeepPlanChoose.jsp" } },
							{ text : "设备维护计划管理", attributes : { url : "equipment/upkeepPlanManage.jsp?checkflag=0" } },
							{ text : "设备维护计划审核", attributes : { url : "equipment/upkeepPlanManage.jsp?checkflag=1" } } ] },
			{ text : "设备维修", state : "closed", children : [
							{ text : "设备维修管理", attributes : { url : "equipment/equipFixManage.jsp" } }, ] },
			{ text : "设备外修", state : "closed", children : [
							{ text : "设备外修信息录入", attributes : { url : "equipment/outreInfoInput.jsp" } },
							{ text : "设备外修信息管理", attributes : { url : "equipment/outreInfoManage.jsp?checkflag=0" } }, ] },
			{ text : "设备资产转移", state : "closed", children : [
							{ text : "设备资产转移信息录入", attributes : {url : "equipment/assetTransInput.jsp"/*  url : "zh_equip/upkeepPlan.jsp?typeflag=0&ci_ID=0&sales_Order_Id=0" */}},
							{ text : "设备资产转移信息管理", attributes : { url : "equipment/assetTransManage.jsp?checkflag=0" } },
							/*	{ text : "设备资产转移审核", attributes : { url : "equipment/equipFixManage.jsp?checkflag=1" } },*/ ] },
			{ text : "设备报废", state : "closed", children : [
							{ text : "设备报废信息录入", attributes : { url : "equipment/equipScrapInfoInput.jsp" } },
							{ text : "设备报废信息管理", attributes : { url : "equipment/equipScrapInfoManage.jsp?checkflag=0" } }, ]
						} ];

				$('#EquipmentManage').tree({
					data : Equipment_treeData,
					lines : true,
					onClick : function(node) {   $(this).tree('toggle',node.target)
						/* if (node.attributes) 
						 {
						  if($.cookie('authority').indexOf(node.text)>-1)
						     	Open(node.text, node.attributes.url);
						  else
							  alert("您没有权限访问此页面，请重新登录");
						 }*/
						Open(node.text, node.attributes.url);
					}
				});

//设备侧边栏结束


	        	//质量侧边栏设置开始   
	         	//质量侧边栏设置开始   
	        	    var Quality_treeData = [	             
	        	    	 
	        				
	        				{
							text : "入库质检",
							state : "closed",
							children : [	      	     
	        	    	{text : "入库检验单新建",attributes : {url : "Quality/qualityInStoreNew.jsp"}},
	        			{text : "入库检验单管理",attributes : {url : "Quality/qualityInStoreManage.jsp"}},
	        			  ]} ,
						{
							text : "库存质检",
							state : "closed",
							children : [	      	     
	        		    {text : "库存质检单新建",attributes : {url : "Quality/qualityStoreOrderNew.jsp"}},
	        			{text : "库存质检单管理",attributes : {url : "Quality/qualityStoreOrderManage.jsp"}},
	        			  ]}, 	{
							text : "销售退货质检",
							state : "closed",
							children : [	      	     
	                         {text : "销售退货检验单新建",attributes : {url : "Quality/qualitySaleBackNew.jsp"}}, 
	        			 	 {text : "销售退货检验单管理",attributes : {url : "Quality/qualitySaleBackManage.jsp"}}, 
	        			  ]}, {
							text : "不合格品处理",
							state : "closed",
							children : [	      	     
	                	 {text : "不合格品责任处理新建",attributes : {url : "Quality/dutyTransNew.jsp"}},
	        			{text : "不合格品责任处理管理",attributes : {url : "Quality/dutyTransManage.jsp"}},
	        			  ]}, 
	        			  	{
							text : "质检基础信息",
							state : "closed",
							children : [	      	     
	        	    	{text : "质检项目类别管理",attributes : {url : "Quality/qualitySortManager.jsp"}},
	        			{text : "质检体系文件管理",attributes : {url : "Quality/qualityFileManager.jsp"}} ,
	        			  ]} 
	        		  //qualityStoreOrderNew.jsp
	        			
	        		];
	        		$('#Quality').tree
	        		   ({
	        		 	  	data : Quality_treeData,lines : true,onClick : 
	        		 	  	function (node) 
	        		     	{   $(this).tree('toggle',node.target)
	        		     		Open(node.text, node.attributes.url);
	        			}
	        		   }); 
	        	//质量侧边栏设置结束

	        	//项目管理侧边栏设置开始
	        	    var developProj_treeData = [
	        	    	{
							text : "研发项目",
							state : "closed",
							children : [	      	     
	        	    		{text : "研发项目计划新建",attributes : {url : "developProj/projectPlanNew.jsp"}},
	        			{text : "研发项目计划管理",attributes : {url : "developProj/projectPlanManage.jsp"}},
	        			{text : "研发项目新建",attributes : {url : "developProj/proNew.jsp"}},
	        			{text : "研发项目管理",attributes : {url : "developProj/proNewManage.jsp"}},
	        			{text : "负责人基础信息管理",attributes : {url : "developProj/chargeBasicInfo.jsp"}},
	        			{text : "项目节点基础信息管理",attributes : {url : "developProj/ProjectNoteBasic.jsp"}},	        			
	        			 	/* {text : "项目基础信息管理",attributes : {url : "developProj/projectBasicInfo.jsp"}}, */
	        			{text : "研发项目计划考核表",attributes : {url : "developProj/ProjectPlanBB.jsp"}}, 
	        			  ]}, 	  
	        			  	{
							text : "工作计划",
							state : "closed",
							children : [	      	     
	        	    	 {text : "工作计划新建",attributes : {url : "developProj/zjtworkPlanNew.jsp"}},
	        			{text : "工作计划管理",attributes : {url : "developProj/zjtworkPlanManage.jsp"}}, 
	        			{text : "工作计划报表",attributes : {url : "developProj/zjtworkPlanBB.jsp"}}
	        			  ]}, 	                  	     
	        		  	{
							text : "文件管理",
							state : "closed",
							children : [	      	     
	        	  {text : "技术文件发放",attributes : {url : "developProj/TechFileOut.jsp"}} 
	        			  ]}, 	                  	     
	        		
	        	/* 		{text : "工作计划新建",attributes : {url : "developProj/workPlanNew.jsp"}},
	        			{text : "工作计划管理",attributes : {url : "developProj/workPlanManage.jsp"}}, */
	        			
	        		
	        		/* 	{text : "项目节点基础信息管理",attributes : {url : "developProj/projectNodeBasicInfo.jsp"}}, */
	        		 
	        			
	        		];
	        		$('#developProj').tree
	        		   ({
	        		 	  	data : developProj_treeData,lines : true,onClick : 
	        		 	  	function (node) 
	        		     	{   $(this).tree('toggle',node.target)
	        		     		Open(node.text, node.attributes.url);
	        			}
	        		   }); 
	        	//项目管理侧边栏设置结束

//生产过程侧边栏设置结束
//采购管理侧边栏设置开始
 var PurchaseMang_treeData = [
	   {
							text : "请购单业务",
							state : "closed",
							children : [
									{
										text : "请购单申请",
										attributes : {
											url : "PurchaseManage/RequisitionApply.jsp?ID=0"
										}},
									{
										text : "请购单管理",
										attributes : {
											url : "PurchaseManage/RequisitionMaintenance.jsp"
										}},
										{
										text : "采购合同管理",
										attributes : {
											url : "PurchaseManage/AgreeMentMgt.jsp"
										}
									}, ],
						},
					   
	    
	            { text : "普通采购业务",
            state : "closed",
            children : [
	                       {
  	 				text : "采购订单录入",
  	 				attributes : {
       						url : "PurchaseManage/PurchaseOrder.jsp?typeflag=0&si_ID=0&po_Id=0"
  					 }
						},
						 {
  	 				text : "采购订单管理",
  	 				attributes : {
       						url : "PurchaseManage/PurchaseOrderManage.jsp?checkflag=0"
  					 }
						},   
							 {
  	 				text : "采购订单审核",
  	 				attributes : {
       						url : "PurchaseManage/PurchaseOrderManage.jsp?checkflag=1"
  					 }
						},   
		   	                    
					
		                   	    ],
		                   	    },
		                   	    
		                   	     { text : "计划材料申报业务",
            state : "closed",
            children : [
	                       {
  	 				text : "计划材料申报",
  	 				attributes : {
       						url : "PurchaseManage/PlanMaterialApply.jsp?typeflag=0&si_ID=0&pmrt_ID=0"
  					 }
						},
						 {
  	 				text : "计划材料申报管理",
  	 				attributes : {
       						url : "PurchaseManage/PlanMaterialManage.jsp?checkflag=0"
  					 }
						},   
							 {
  	 				text : "计划材料申报审核",
  	 				attributes : {
       						url : "PurchaseManage/PlanMaterialManage.jsp?checkflag=1"
  					 }
						},   	   	                    
		                   	    ],
		                   	    },
		                   	    
		                   	      { 
                                                        text : "材料需求业务",
							state : "closed",
							children : [
									{
										text : "材料需求计划申请",
										attributes : {
											url : "PurchaseManage/MaterialNeedPlan.jsp"
										}
									}, 
									/* {
										text : "材料需求计划申请1",
										attributes : {
											url : "PurchaseManage/MaterialNeedPlan1.jsp"
										}
									},  */
									{
										text : "材料需求计划管理",
										attributes : {
											url : "PurchaseManage/MaterialNeedPlanMgt.jsp"
										}
									}, 
									],



		                   	    }, 
		                   	    
		                   	    { text : "材料采购业务",
            state : "closed",
            children : [
	                       {
  	 				text : "材料采购订单",
  	 				attributes : {
       						url : "PurchaseManage/MaterialPurchaseOrder.jsp?typeflag=0&si_ID=0&po_Id=0"
  					 }
						},
						 {
  	 				text : "材料采购订单管理",
  	 				attributes : {
       						url : "PurchaseManage/MaterialPurchaseManage.jsp?checkflag=0"
  					 }
						},   
							 {
  	 				text : "材料采购订单审核",
  	 				attributes : {
       						url : "PurchaseManage/MaterialPurchaseManage.jsp?checkflag=1"
  					 }
						},   	   	                    
		                   	    ],
		                   	    },
		                   	    
		                   	     { text : "佳源采购业务",
            state : "closed",
            children : [
	                       {
  	 				text : "佳源采购订单",
  	 				attributes : {
       						url : "PurchaseManage/JYPurchaseOrder.jsp?typeflag=0&si_ID=0&po_Id=0"
  					 }
						},
						 {
  	 				text : "佳源采购订单管理",
  	 				attributes : {
       						url : "PurchaseManage/JYPurchaseOrderManage.jsp?checkflag=0"
  					 }
						},   
							 {
  	 				text : "佳源采购订单审核",
  	 				attributes : {
       						url : "PurchaseManage/JYPurchaseOrderManage.jsp?checkflag=1"
  					 }
						},   	   	                    
		                   	    ],
		                   	    },  
		                   	    
		    { text : "采购基础信息管理",
            state : "closed",
            children : [        
					{
  	 				text : "供应商外协厂基础信息",
  	 				attributes : {
       						url : "PurchaseManage/SupplierOutplanBasic.jsp"
  					 }
						},
						{
							text : "原材料替换基础库",
							attributes : {
								url : "PurchaseManage/MaterialReplace.jsp"
							}
						}, 
						{
  	 				text : "原材料备库计划",
  	 				attributes : {
       						url : "PurchaseManage/MaterialPreStockPlan.jsp"
  					 }
						},
						/* {
  	 				text : "原材料替换品基础信息",
  	 				attributes : {
       						url : "PurchaseManage/SupplierOutplanBasic.jsp"
  					 }
						}, */
                                                     /* {
										text : "货币汇率管理",
										attributes : {
											url : "PurchaseManage/ExchangeRateMgt.jsp"
										}
									}, */
		                   	    ],
		  	},
		  	{
		  		text:"采购报表管理",
		  		state:"closed",
		  		children : [
		  			{
		  				text:"物资采购统计",
		  				attributes:{
		  					url:"PurchaseManage/PurcahseStatictics.jsp",
		  				}
		  			},
		  			{
		  				text:"物资采购统计1",
		  				attributes:{
		  					url:"PurchaseManage/PurcahseStatictics.jsp",
		  				}
		  			},
		  		],
		  		
		  	},
		];
	    
		    
	    
	    $('#PurchaseMang').tree
	    ({
	  	  data : PurchaseMang_treeData,
	        lines : true,
	        onClick : function (node) 
	        {   $(this).tree('toggle',node.target)
	           /* if (node.attributes) 
	            {
	          	  if($.cookie('authority').indexOf(node.text)>-1)
	                	Open(node.text, node.attributes.url);
	          	  else
	          		  alert("您没有权限访问此页面，请重新登录");
	            }*/
	        	Open(node.text, node.attributes.url);
	        }
	    }); 
	    
	    
	    
	    
	    
	    
  function Open(text, url) 
  {
      if ($("#tabs").tabs('exists', text))
      {
          $('#tabs').tabs('select', text);
      } else 
      {
    	  var content = '<iframe scrolling="auto" frameborder="0"  src="'+url+'" style="width:100%;height:100%;"></iframe>';
          $('#tabs').tabs('add', 
        		  {
              		title : text,
              		closable : true,
              		content : content
          });
      }
  }
  
     //财务管理导航设置
	       var Finance_treeData = [

        { text : "财务基础库", state : "closed", children : [
                { text : "汇率设置", attributes : { url : "financialManager/roe.jsp" } },
				{ text : "回款条件管理", attributes : { url : "financialManager/termsOfPayback.jsp" } },
				{ text : "付款条件管理", attributes : { url : "financialManager/termsOfPayment.jsp" } },
				{ text : "特殊供应商价格管理", attributes : { url : "financialManager/SpecialSupplierPriceBasic.jsp" } }
				//{ text : "库存存量表记录", attributes : { url : "financialManager/ProductStocksList.jsp" } }
				 ] },
				
	    { text : "成本基础库", state : "closed", children : [ 
	    		{ text : "在制品遗留责任确立", attributes : { url : "financialManager/onlineProductConfirm.jsp" } },
				{ text : "标准成本管理", attributes : { url : "financialManager/standardcosts.jsp" } },
				{ text : "实施成本管理", attributes : { url : "financialManager/implementationcosts.jsp" } },
				{ text : "实际成本管理",state:"closed",children:[
								 { text : "完工产品制造费用", attributes : { url : "financialManager/presentMonthFinishManuCosts.jsp" } },
				                 { text : "上月末成本明细", attributes : { url : "financialManager/lastMonthCosts.jsp" } },
				                 { text : "本月投产成本发生明细", attributes : { url : "financialManager/presentMonthOperateCosts.jsp" } },
				                 { text : "本月完工产品成本明细", attributes : { url : "financialManager/presentMonthFinishCosts.jsp" } },
				                 { text : "本月末产品成本明细", attributes : { url : "financialManager/presentMonthCosts.jsp" } },
				] } ] },
				
	    { text : "应收账务管理", state : "closed", children : [
                { text : "应收单录入", attributes : { url : "financialManager/receiveableBillInput.jsp?TypeFlag=0&receiveableBillNo=0" } },
                { text : "应收单管理", attributes : { url : "financialManager/receiveableBill.jsp" }},
				{ text : "应收保证金", attributes : { url : "financialManager/receiveableDeposit.jsp?" } },
                {  text : "销售发票录入", attributes : { url : "financialManager/SalesSlipInput.jsp?typeflag=0&ci_ID=0" } },
                { text : "销售发票管理", attributes : { url : "financialManager/SalesSlip.jsp" } },
				{ text : "收款单录入", attributes : { url : "financialManager/creditNoteInput.jsp?typeflag=0&creditNote_No=0" } },
				{ text : "收款单管理", attributes : { url : "financialManager/creditNote.jsp" } },
				{ text : "应收核销单录入", attributes : { url : "financialManager/receiveableVerificationInput.jsp?typeflag=0&receiveableVerificationSheet_No=0" } },
				{ text : "应收核销单管理", attributes : { url : "financialManager/receiveableVerification.jsp" } },
				{ text : "应收坏账管理", attributes : { url : "financialManager/receiveableBadDebt.jsp" } },
				{ text : "应收对账单报表", attributes : { url : "financialManager/statementOfAccount.jsp" } },
				{ text : "应收报表", state : "closed", children : [ 
						{ text : "应收单报表", attributes : { url : "financialManager/receiveableBillReport.jsp" } },
						{ text : "收款单报表", attributes : { url : "financialManager/creditNoteReport.jsp" } },  
						{ text : "国内应收账龄报表", attributes : { url : "financialManager/receiveableAnalysisReport.jsp" } },
						{ text : "应收账款余额报表", attributes : { url : "financialManager/receiveableRemain.jsp" } },
						{ text : "国内应收账款明细报表", attributes : { url : "financialManager/receiveableRemainDetail.jsp" } },
						{ text : "应收核销单报表", attributes : { url : "financialManager/receiveableVerificationReport.jsp" } },
						{ text : "销售发票报表", attributes : { url : "financialManager/salesSlipReport.jsp" } },
						{ text : "未回款利息报表", attributes : { url : "financialManager/unCreditInterestReport.jsp" } },
						{ text : "发运回款率汇总表", attributes : { url : "financialManager/sendCreditReport.jsp" } },
						{ text : "暂估贷款明细报表", attributes : { url : "financialManager/temporaryLoanReport.jsp" } },
						{ text : "往来款项与交易询证函", attributes : { url : "financialManager/paymentAndTransactionConfirm.jsp" } }
						
						] },
					]},
					
		{ text : "应付账务管理", state : "closed", children : [
                { text : "应付单录入", attributes : { url : "financialManager/payableBillInput.jsp?TypeFlag=0&payableBillNo=0" } },
                { text : "应付单管理", attributes : { url : "financialManager/payableBill.jsp" } },
				{ text : "应付保证金", attributes : { url : "financialManager/payableDeposit.jsp" } },
				{ text : "扣款单管理", attributes : { url : "financialManager/deductionBill.jsp" } },
                { text : "材料销售应收单管理", attributes : {  url : "financialManager/MaterialSaleBill.jsp" } },
                { text : "开票通知单录入", attributes : { url : "financialManager/noticeOfInvoiceInput.jsp?typeflag=0&noticeOfInvoice_No=0" } },
                { text : "开票通知单管理", attributes : { url : "financialManager/noticeOfInvoice.jsp" } },
                { text : "应付发票录入", attributes : { url : "financialManager/PayableSlipInput.jsp?typeflag=0&ci_ID=0" } },
				{ text : "应付发票管理", attributes : { url : "financialManager/PayableSlip.jsp" } },
				{ text : "应收冲应付发票录入", attributes : { url : "financialManager/payableOffsetInput.jsp?typeflag=0&payableOffset_No=0" } },
                { text : "应收冲应付发票管理", attributes : { url : "financialManager/payableOffsetManager.jsp" } },
                { text : "应付对账单报表", attributes : { url : "financialManager/statementOfPayableAccount.jsp" } },
                { text : "付款单管理", state : "closed", children : [
               			   		{ text : "付款单申请录入", attributes : { url : "financialManager/paymentBillInput.jsp?typeflag=0&paymentBill_No=0" } },
               			   		{ text : "付款单申请管理", attributes : { url : "financialManager/paymentBillApplyManager.jsp?" } },
                				//{ text : "生产部确认", attributes : { url : "financialManager/paymentBill.jsp?typeflag=0" } },
                				{ text : "生产部确认", attributes : { url : "financialManager/productConfirm.jsp?" } },
                				//{ text : "付款单审核", attributes : { url : "financialManager/paymentBill.jsp?typeflag=1" } },
                				{ text : "付款单审核", attributes : { url : "financialManager/paymentBillCheck.jsp?" } },
                				{ text : "付款确认", attributes : { url : "financialManager/paymentBillConfirm.jsp?" } }
                				/* { text : "付款确认", attributes : { url : "financialManager/paymentBill.jsp?typeflag=2" } } */] },
	    		{ text : "应付核销单录入", attributes : { url : "financialManager/payableVerificationInput.jsp?typeflag=0&payableVerificationSheet_No=0" } },
				{ text : "应付核销单管理", attributes : { url : "financialManager/payableVerification.jsp" } },
				{ text : "应付坏账管理", attributes : { url : "financialManager/payableBadDebt.jsp" } },
				{ text : "应付报表", state : "closed", children : [ 
				//{ text : "产值统计报表", attributes : { url : "financialManager/.jsp" } },
				//{ text : "生成领用半成品报表", attributes : { url : "financialManager/.jsp" } },
				//{ text : "生成领用低耗报表", attributes : { url : "financialManager/.jsp" } },
				//{ text : "欠坯报表", attributes : { url : "financialManager/.jsp" } }
				{ text : "应付明细报表", attributes : { url : "financialManager/payableBillDetailReport.jsp" } },
				{ text : "应付账款汇总表", attributes : { url : "financialManager/payableBillReport.jsp" } },
				{ text : "供应商到期应付款明细表", attributes : { url : "financialManager/payableBillDateReport.jsp" } },
				{ text : "扣款汇总报表", attributes : { url : "financialManager/deductionBillReport.jsp" } },
				{ text : "扣款明细报表", attributes : { url : "financialManager/deductionBillDetailReport.jsp" } }
				//{ text : "应收核销单报表", attributes : { url : "financialManager/payableVerificationReport.jsp" } }
				 			] }
				 ]},
	    
	    
				
	    
	    ];
	    
	    $('#FinancialManager').tree
	    ({
	  	    data : Finance_treeData,
	        lines : true,
	        onClick : function (node) 
	        {   $(this).tree('toggle',node.target)
	        	Open(node.text, node.attributes.url);
	        }
	    });

  $("#UserCompany").html($.cookie('UserCompany'));
  $("#UserName").html($.cookie('UserName'));
    bindTabEvent();   //zjt
    bindTabMenuEvent();   //zjt
});
function bindTabEvent(){   //zjt
    $(".tabs-inner").live('dblclick',function(){  
        var subtitle = $(this).children("span").text();  
        if($(this).next().is('.tabs-close')){  
            $('#tabs').tabs('close',subtitle);  
        }  
    });  
    $(".tabs-inner").live('contextmenu',function(e){  
        $('#mm').menu('show', {  
            left: e.pageX,  
            top: e.pageY  
     });  
     var subtitle =$(this).children("span").text();  
     $('#mm').data("currtab",subtitle);  
     return false;  
    });  
 }  
 function bindTabMenuEvent() {  //zjt
    //关闭当前  
    $('#mm-tabclose').click(function() {  
        var currtab_title = $('#mm').data("currtab"); 
        
            $('#tabs').tabs('close',currtab_title);  
        
    });  
    //全部关闭  
    $('#mm-tabcloseall').click(function() {  
        $('.tabs-inner span').each(function(i, n) {  
            if ($(this).parent().next().is('.tabs-close')) {  
                var t = $(n).text();  
                $('#tabs').tabs('close', t);  
            }  
        });  
    });  
    //关闭除当前之外的TAB  
    $('#mm-tabcloseother').click(function() {  
        var currtab_title = $('#mm').data("currtab");  
        $('.tabs-inner span').each(function(i, n) {  
            if ($(this).parent().next().is('.tabs-close')) {  
                var t = $(n).text();  
                if (t != currtab_title)  
                    $('#tabs').tabs('close', t);  
            }  
        });  
    });  
    //关闭当前右侧的TAB  
    $('#mm-tabcloseright').click(function() {  
        var nextall = $('.tabs-selected').nextAll();  
        if (nextall.length == 0) {  
            alert('已经是最后一个了');  
            return false;  
        }  
        nextall.each(function(i, n) {  
            if ($('a.tabs-close', $(n)).length > 0) {  
                var t = $('a:eq(0) span', $(n)).text();  
                $('#tabs').tabs('close', t);  
            }  
        });  
        return false;  
    });  
    //关闭当前左侧的TAB  
    $('#mm-tabcloseleft').click(function() {  
        var prevall = $('.tabs-selected').prevAll();  
        if (prevall.length == 1) {  
            alert('已经是第一个了');  
            return false;  
        }  
        prevall.each(function(i, n) {  
            if ($('a.tabs-close', $(n)).length > 0) {  
                var t = $('a:eq(0) span', $(n)).text();  
                $('#tabs').tabs('close', t);  
            }  
        });  
        return false;  
    });  
}  
   //财务管理导航设置结束
  
  /*跨tabs刷新datagrid主函数
  */
  function reloadTabGrid(title)
  {		
	  if(title=="生产任务清单管理"){
         if ($("#tabs" ).tabs('exists',title)) {
              $( '#tabs').tabs('select' ,title);
              window.top.reload_Abnormal_Monitor.call();
        }
	  }
	  else if(title=="库存利用管理"){
		  if ($("#tabs" ).tabs('exists',title)) {
              $( '#tabs').tabs('select' ,title);
              window.top.reload_StoreUse_Monitor.call();
        }   
	  }
	  else if(title=="计划分配清单审核"){
		  if ($("#tabs" ).tabs('exists',title)) {
              $( '#tabs').tabs('select' ,title);
              window.top.reload_AlloCheck_Monitor.call();
        }   
	  }
	  else if(title=="销售订单管理"){
		  if ($("#tabs" ).tabs('exists',title)) {
              $( '#tabs').tabs('select' ,title);
              window.top.reload_saleManage_Monitor.call();
        }   
	  }
	  else if(title=="客户档案审核"){
		  if ($("#tabs" ).tabs('exists',title)) {
              $( '#tabs').tabs('select' ,title);
              window.top.reload_shenhe_Monitor.call();
        }   
	  }
	  else if(title=="客户档案管理"){
		  if ($("#tabs" ).tabs('exists',title)) {
              $( '#tabs').tabs('select' ,title);
              window.top.reload_custInfo_Monitor.call();
        }   
	  }
  }

  </script>
  
  <style>
  .datagrid-btn-separator1 {
	  float: left;
	  height: 24px;
	  border-left: 1px solid #ccc;
	  border-right: 1px solid #fff;
	  margin: 2px 1px;
	}
  </style>
 <body class="easyui-layout" id="mainbody">
   <div id="northPanel" class="easyui-panel"
			data-options="region:'north'"
			style="height: 40px;background:url('img/pick_bg_w.jpg');padding:2px">
			<div style="position:absolute; right:5px; bottom:5px;top:4px">
				<table style="font-family:Microsoft YaHei;font-size: 12px;border-bottom:0px solid black;margin:0 auto">
					<tr>
						<td><div class="datagrid-btn-separator1" id="sep5"></div></td>
						<td>&nbsp;</td>
						<td style="color:#6C6C6C; background:url('img/center.png') no-repeat left;background-size:14px;padding-left:20px">欢迎您: </td>
						<td style="color: #6698C0">${session.userRName}</td>
						<td>&nbsp;</td>
						<td><div class="datagrid-btn-separator1" id="sep5"></div></td>
						<td>&nbsp;</td>
						<!-- <td style="background:url('img/time.png') no-repeat left;background-size:15px;padding-left:16px"></td> -->
						<td style="color:#6C6C6C; background:url('img/time.png') no-repeat left;background-size:15px;padding-left:20px" id ="count"></td>
						<td>&nbsp;</td>
						<td><div class="datagrid-btn-separator1" id="sep5"></div></td>
						<!-- <td style="width: 100px"></td> -->
						<td style="">
							<a style="color:#6C6C6C" id="btn" href="javascript:void(0)" onclick="ts()" class="easyui-linkbutton" data-options="iconCls:'icon-down',plain:true">切换主题</a>
							<!-- <a href="javascript:void(0)" onclick="ts()">切换主题</a> -->
						</td>
						 <td><div class="datagrid-btn-separator1" id="sep5"></div></td>
						<td>
							<a style="color:#6C6C6C" id="btn" href="javascript:void(0)" onclick="logout()" class="easyui-linkbutton" data-options="iconCls:'icon-back',plain:true">退出系统</a>
							<!-- <a href="javascript:void(0)" onclick="logout()">退出系统</a> -->
						</td>
						 <td><div class="datagrid-btn-separator1" id="sep5"></div></td>
				</table>
			</div>
		
<!-- 		<div style="position: absolute; right: 5px; bottom:5px;">
			<a id="btn" href="javascript:void(0)" onclick="ts()" class="easyui-linkbutton" data-options="iconCls:'icon-back',plain:true">easyui</a>
    		<a href="javascript:void(0)" onclick="ts()">切换主题</a>
    		<a href="javascript:void(0)" onclick="logout()">退出系统</a>
    		<a href="login.jsp">退出系统</a>
		</div> -->
   </div>


    <div class="easyui-panel" data-options="region:'west',split:true" style="width:180px;"> 
    
    		<div class="easyui-accordion" fit="true" border="false">
			<div title="系统菜单">
				<ul id="SystemManager"></ul>
			</div>
			
			<div title="销售管理">
				<ul id="SalesManager"></ul>
			</div>
			
			<div title="生产计划管理">
				<ul id="ProPlan">				
				</ul>
			</div>
			
			<div title="生产过程管理">
				<ul id="ProProcess">				
				</ul>
			</div>
			<div title="质量管理">
				<ul id="Quality">				
				</ul>
			</div>
			<div title="项目管理">
				<ul id="developProj">				
				</ul>
			</div>
			<div  title="库存管理">
			  <ul id="StoreManager" class="easyui-tree" data-options="animate:true,lines:true">

			  </ul>
				
			</div>
			
			<div title="采购管理">
				<ul class="easyui-tree" data-options="animate:true,lines:true">
				<ul id="PurchaseMang"></ul>
				</ul>
			</div>
			
			<div title="设备管理">
				<ul class="easyui-tree" data-options="animate:true,lines:true">
				<ul id="EquipmentManage"></ul>
				</ul>
												
				
			</div>

			<div title="财务管理">
				<ul id="FinancialManager"></ul>
			</div>

			<div title="人力资源管理">
				<ul id="RenliZiyuanManange">
				</ul>
			</div>
			
			<div title="生产基础信息管理">
				<ul id="ProduceBasicManager">
				</ul>
			</div>
		</div>
    
    </div>
    
    
    <div data-options="region:'center',split:true" 
    		style="padding:0px;background:#eee;overflow: hidden;" 
    		>
    	
    	<div class="easyui-tabs" fit="true" border="false" id="tabs">
    		<div title="首页"  style="background-repeat:no-repeat;background-image: url('img/beijing.jpg');background-size:100% 100%"></div>
    	</div>
    	
    	
    </div>
    
    <div id="mm" class="easyui-menu" style="width:150px;">    
        <div id="mm-tabclose">关闭</div>    
        <div id="mm-tabcloseall">关闭全部</div>    
        <div id="mm-tabcloseother">关闭其他</div>    
        <div class="menu-sep"></div>    
        <div id="mm-tabcloseright">关闭右侧标签</div>    
        <div id="mm-tabcloseleft">关闭左侧标签</div>    
    </div>  
</body>

</html>

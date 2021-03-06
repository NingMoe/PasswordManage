<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="initial-scale=1, width=device-width, maximum-scale=1, user-scalable=no"/>
    <meta http-equiv="Pragma" content="no-cache"/>
    <meta http-equiv="Pragma" content="-1"/>
    <script src="../js/jquery.min_1.7.2.js"></script>
	<!-- <script src="../js/main.js"></script> -->
	<script src="../js/layer.min.js"></script>
	<script src="../js/manage_codesearch.js"></script>
    <link href="../css/common.css" type="text/css" rel="stylesheet"/>
    <link type="text/css" rel="stylesheet" href="../css/fonts/font-awesome.css"/>
    <link type="text/css" rel="stylesheet" href="../css/fonts/fontface.css"/>
    <script src="../js/date/My97DatePicker/WdatePicker.js"></script>
    <script src="../js/jquery.easyui.min.js"></script>
    <script src="../js/easyui-lang-zh_CN.js"></script>
    <link rel="stylesheet" type="text/css" href="../css/datagrid_css/easyui.css"/>
    <link rel="stylesheet" type="text/css" href="../css/datagrid_css/icon.css"/>
    <title>自助密码服务平台-验证码查询</title>
	<style type="text/css">
        #fm{
            margin:0;
            padding:10px 30px;
        }
        .ftitle{
            font-size:14px;
            font-weight:bold;
            padding:5px 0;
            margin-bottom:10px;
            border-bottom:1px solid #ccc;
        }
        .fitem{
            margin-bottom:5px;
        }
        .fitem label{
            display:inline-block;
            width:80px;
        }
        .fitem input{
            width:160px;
        }
    </style>
    <script>
		$(function(){
			$('.date').click(WdatePicker);
		});

		
		/* //datagrid初始化  
		$('#code').datagrid({  
		    title:'验证码信息列表',  
		    //iconCls:'icon-edit',//图标  
		    //width: 700,  
		    //height: '400',  
		    nowrap: false,  
		    striped: true,  
		    border: true,  
		    collapsible:false,//是否可折叠的  
		    fit: true,//自动大小  
		    url:'/codeSearchData',  
		    //sortName: 'createTime',  
		    //sortOrder: 'desc',  
		    remoteSort:false,   
		    idField:'fldId',  
		    singleSelect:true,//是否单选  
		    pagination:true,//分页控件  
		    rownumbers:true,//行号  
		   // frozenColumns:[[  
		    //    {field:'ck',checkbox:false}  
		    //]],    
		}); 
		var p = $('#code').datagrid('getPager');  
		$(p).pagination({  
		    //pageSize: 10,//每页显示的记录条数，默认为10  
		    //pageList: [5,10,15],//可以设置每页记录条数的列表  
		      //onSelectPage : function(pPageIndex, pPageSize) {   
        	//改变opts.pageNumber和opts.pageSize的参数值，用于下次查询传给数据层查询指定页码的数据   
        	//var gridOpts = $('#code').datagrid('options');   
        	//gridOpts.pageNumber = pPageIndex;   
        	//gridOpts.pageSize = pPageSize;   
		    beforePageText: '第',//页数文本框前显示的汉字  
		    afterPageText: '页    共 {pages} 页',  
		    displayMsg: '当前显示 {from} - {to} 条记录   共 {total} 条记录',  
		    onBeforeRefresh:function(){ 
		        $(this).pagination('loading'); 
		        alert('before refresh'); 
		        $(this).pagination('loaded'); 
		    } 
		});
		*/
		
		$('#codesearch-datagrid').datagrid({   
		    url:'/codeSearchData',  
		    title:'验证码信息列表',
		    //width: 1271,
			height: 220,
		    pagination:true,   
		    pageSize:5,   
		    pageNumber:1, 
		    pageList:[5,10,15,20,25,30],
		    remoteSort:false,
		    sortable: true,//允许此列被排序
		    sortName:'createTime',
		    sortOrder:'desc',
		    rownumbers:true, 
		    singleSelect:true,//是否单选  
		    rownumbers:true,//行号
		    /* beforePageText: '第',//页数文本框前显示的汉字  
		    afterPageText: '页    共 {pages} 页',  
		    displayMsg: '当前显示 {from} - {to} 条记录   共 {total} 条记录',  */
		    	//field : 'expiresStatus',title : '验证码状态',
		   /*  onSelectPage : function(pPageIndex, pPageSize) {    
		        var gridOpts = $('#codesearch-datagrid').datagrid('options'); 
		        gridOpts.pageNumber = pPageIndex;   
	        	gridOpts.pageSize = pPageSize;
		        //定义查询条件   
		        var queryCondition = {name:"er.xiao"};   
		       // 异步获取数据到javascript对象，入参为查询条件和页码信息   
		        var oData = getAjaxDate("orderManageBuz","qryWorkOrderPaged",queryCondition,{pageNumber:gridOpts.pageNumber,pageSize:gridOpts.pageSize});   
		        //使用loadDate方法加载Dao层返回的数据   
		        $('#codesearch-datagrid').datagrid('loadData',{"total" : oData.page.recordCount,"rows" : oData.data});   
		    } */  
		});  
		
	</script>
</head>
<body>
<div class="main">
    <div class="content">
        <div class="content_manage">
            <!--search start-->
            <div >
                <table id="codeSearch" class="search_table">
                    <tr>
                        <th><span class="icon_span"><i class="icon-pencil"></i></span>验证码查询</th>
                    </tr>
                    <tr>
                        <td>
                            <div class="search_txt">用户名<input type="text" id="name" value="${userName}" /></div>
                            <div class="search_txt" style="width: 450px"><span style="float: left;">发送起止时间</span>
                            <input type="text" class="date start" id="startDate" readonly="readonly" style="float: left;"/>
                            <span style="float: left;margin-left: 7px">至</span>
                            <input type="text" class="date end" id="endDate" readonly="readonly" style="float: left;"/>
                            </div>
                            <div class="search_txt">
                            	验证码状态&nbsp;&nbsp;
                                <select name="choose" id="choose" style="width: 157px;height: 32px">
                                	<option value="0" >--请选择--</option>
                                    <option value="1" >正常</option>
                                    <option value="2" >过期</option>
                                    <option value="3">使用</option>
                                </select>
                             </div>   
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="oper_but"><input type="button" class="operate" value="查询"/>
                            <input type="button" class="cancel closedown" value="重置"/>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
            <div >
           <!--  style="width:1200px;height:300px;position:absolute;left:50%;top:50%;
            margin-top:-20px;margin-left:-600px;" -->
				<table class="result_table" id="result_table">
                   <!--  <thead>
                    <tr>
                        <th colspan="4"><span class="icon_span"><i class="icon-list"></i></span>报表审计统计</th>
                    </tr>
                    </thead> -->
                      <tbody>
                        <tr>
	                        <td>
								<table id="codesearch-datagrid" class="easyui-datagrid" >
									<thead>
										<tr>
											<th field="userName" width="15%" align="center">用户名</th>
											<th field="phoneNum" width="15%" align="center">手机号码</th>
											<th field="authCode" width="15%" align="center">验证码</th>
											<th field="createTime" sortable="true" width="20%" align="center">发送时间</th>
											<th field="emailAddress" width="20%" align="center">邮箱地址</th>
											<th field="expiresStatus" formatter="expiresStatusFormatter" width="10%" align="center">验证码状态</th>
										</tr>
									</thead>
								</table>
							</td>
	                     </tr>
					</tbody>
			</table>
		</div>
        </div>
    </div>
    <div class="foot">版权所有 © 上海斐讯数据通信技术有限公司 2008-2013</div>
</div>
<!--弹出窗口 start-->
<div class="window_bg"></div>
<div class="window_cont" id="window_cont"></div>
<!--弹出窗口 end-->
</body>
</html>

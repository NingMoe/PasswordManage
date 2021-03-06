<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="initial-scale=1, width=device-width, maximum-scale=1, user-scalable=no"/>
    <meta http-equiv="Pragma" content="no-cache"/>
    <meta http-equiv="Pragma" content="-1"/>
    <link href="../css/common.css" type="text/css" rel="stylesheet"/>
    <link type="text/css" rel="stylesheet" href="../css/fonts/font-awesome.css"/>
    <link type="text/css" rel="stylesheet" href="../css/fonts/fontface.css"/>
    <link rel="stylesheet" type="text/css" href="../css/datagrid_css/easyui.css"/>
    <link rel="stylesheet" type="text/css" href="../css/datagrid_css/icon.css"/>
    <script src="../js/jquery.min_1.7.2.js"></script>
    <script src="../js/layer.min.js"></script>
    <script src="../js/manage_usersearch.js"></script>
    <script src="../js/jquery.easyui.min.js"></script>
    <script src="../js/easyui-lang-zh_CN.js"></script> 
    <title>自助密码服务平台-用户查询</title>
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
      <script type="text/javascript">
    	$('#userSearch-datagrid').datagrid({ 
		    url :'/userSearchData',
		    toolbar:"#toolbar",
		    title:'用户查询结果列表',
		    //width: 1200,
			height: 200,
		    pagination:true,   
		    pageSize:5,   
		    pageNumber:1, 
		    pageList:[5,10,15,20,25,30],
		    rownumbers:true, 
		    singleSelect:true,//是否单选  
		    rownumbers:true,//行号
		});
	</script>
</head>

<body>
<div id="dlg" class="easyui-dialog" style="width: 400px; height: 280px; padding: 10px 20px; display:none;"
       closed="true" buttons="#dlg-buttons"> 
       <div class="ftitle"> 
           编辑用户信息
       </div> 
       <form id="fm" method="post"> 
       <div class="fitem"> 
           <label> 
               用户名 
           </label> 
           <input name="user" id="username" class="easyui-validatebox" disabled="disabled" /> 
       </div> 
       <div class="fitem"> 
           <label> 
               姓名
           </label> 
           <input name="user" id="realUsername" class="easyui-validatebox" disabled="disabled" /> 
       </div>
       <div class="fitem"> 
           <label> 
               手机号码
           </label> 
           <input name="user" id="mobile" class="easyui-validatebox" required="true" /> 
       </div>
       <div id="dlg-buttons"> 
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="saveUser()" >保存</a> <!-- iconcls="icon-save" -->
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:$('#dlg').dialog('close')">取消</a> <!-- iconcls="icon-cancel" -->
    	</div> 
    	<!-- <input type="hidden" name="action" id="hidtype" /> 
       	<input type="hidden" name="ID" id="Nameid" /> -->
       </form> 
</div>
<div class="main">
    <div class="content">
        <div class="content_manage">
            <!--search start-->
            <div>
                <table class="search_table">
                    <tr>
                        <th><span class="icon_span"><i class="icon-pencil"></i></span>用户查询</th>
                    </tr>
                    <tr>
                        <td>
                        	<div class="search_txt">姓名<input type="text" id="realName"/></div>
                        	<div class="search_txt">用户名<input type="text" id="userName"/></div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="oper_but"><input type="button" class="operate" value="查询"/>
                            <input type="button" class="cancel" value="重置"/>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
            <div >
            		<div id="toolbar">
				        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editUser()" style="color: red;">编辑用户</a>
    				</div>
                <table class="result_table" id="result_table">
                      <tbody>
                    	<tr>
                    		<td>
			                    <table id="userSearch-datagrid" class="easyui-datagrid" >
			                    	<thead>
											<tr>
												<th field="msExchExtensionAttribute16" width="10%" align="center">工号</th>
												<th field="SamAccountName" width="10%" align="center">用户名</th>
												<th field="cn" width="10%" align="center" >姓名</th>
												<th field="department" width="40%" align="center">部门</th>
												<th field="mobile" width="15%" align="center">手机号码</th>
												<th field="userAccountControl" formatter="userStatusFormatter" width="10%" align="center">用户状态</th>
											</tr>
									</thead>
								</table>
							</td>
						</tr>
					</tbody>
                </table>
                <!--<div class="no_data">查询结果</div>-->
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

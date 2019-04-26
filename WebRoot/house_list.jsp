<%@ page language="java" import="java.util.*,entity.Bus,dao.BusDao,dao.BusDaoImpl" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript" src="scripts_purchase/jquery/jquery-1.7.1.js"></script>
<link href="style_purchase/authority/basic_layout.css" rel="stylesheet" type="text/css">
<link href="style_purchase/authority/common_style.css" rel="stylesheet" type="text/css">
<link href="css/bootstrap2.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/style1.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="scripts_purchase/authority/commonAll.js"></script>
<script type="text/javascript" src="scripts_purchase/fancybox/jquery.fancybox-1.3.4.js"></script>
<script type="text/javascript" src="scripts_purchase/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="style_purchase/authority/jquery.fancybox-1.3.4.css" media="screen"></link>
<script type="text/javascript" src="scripts_purchase/artDialog/artDialog.js?skin=default"></script>

    <link href="bootstrap3/css/bootstrap.css" rel="stylesheet" />
	<link href="assets/css/bootstrap-datepicker.css" rel="stylesheet" />  
<script src="bootstrap3/js/bootstrap.js" type="text/javascript"></script>
<script src="assets/js/bootstrap-datepicker.js"></script>
<title>车票</title>
<script type="text/javascript">
	$(document).ready(function(){
		/** 新增   **/
	    $("#addBtn").fancybox({
	    	'href'  : 'house_edit.html',
	    	'width' : 733,
	        'height' : 530,
	        'type' : 'iframe',
	        'hideOnOverlayClick' : false,
	        'showCloseButton' : false,
	        'onClosed' : function() { 
	        	window.location.href = 'house_list.html';
	        }
	    });
		
	    /** 导入  **/
	    $("#importBtn").fancybox({
	    	'href'  : '/xngzf/archives/importFangyuan.action',
	    	'width' : 633,
	        'height' : 260,
	        'type' : 'iframe',
	        'hideOnOverlayClick' : false,
	        'showCloseButton' : false,
	        'onClosed' : function() { 
	        	window.location.href = 'house_list.html';
	        }
	    });
		
	    /**编辑   **/
	    $("a.edit").fancybox({
	    	'width' : 733,
	        'height' : 530,
	        'type' : 'iframe',
	        'hideOnOverlayClick' : false,
	        'showCloseButton' : false,
	        'onClosed' : function() { 
	        	window.location.href = 'house_list.html';
	        }
	    });
	});
	/** 用户角色   **/
	var userRole = '';

	/** 模糊查询来电用户  **/
	function search(){
		$("#submitForm").attr("action", "house_list.html?page=" + 1).submit();
	}

	/** 新增   **/
	function add(){
		$("#submitForm").attr("action", "/xngzf/archives/luruFangyuan.action").submit();	
	}
	 
	/** Excel导出  **/
	function exportExcel(){
		if( confirm('您确定要导出吗？') ){
			var fyXqCode = $("#fyXq").val();
			var fyXqName = $('#fyXq option:selected').text();
//	 		alert(fyXqCode);
			if(fyXqCode=="" || fyXqCode==null){
				$("#fyXqName").val("");
			}else{
//	 			alert(fyXqCode);
				$("#fyXqName").val(fyXqName);
			}
			$("#submitForm").attr("action", "/xngzf/archives/exportExcelFangyuan.action").submit();	
		}
	}
	
	/** 删除 **/
	function del(fyID){
		// 非空判断
		if(fyID == '') return;
		if(confirm("您确定要删除吗？")){
			$("#submitForm").attr("action", "/xngzf/archives/delFangyuan.action?fyID=" + fyID).submit();			
		}
	}
	
	/** 批量删除 **/
	function batchDel(){
		if($("input[name='IDCheck']:checked").size()<=0){
			art.dialog({icon:'error', title:'友情提示', drag:false, resize:false, content:'至少选择一条', ok:true,});
			return;
		}
		// 1）取出用户选中的checkbox放入字符串传给后台,form提交
		var allIDCheck = "";
		$("input[name='IDCheck']:checked").each(function(index, domEle){
			bjText = $(domEle).parent("td").parent("tr").last().children("td").last().prev().text();
// 			alert(bjText);
			// 用户选择的checkbox, 过滤掉“已审核”的，记住哦
			if($.trim(bjText)=="已审核"){
// 				$(domEle).removeAttr("checked");
				$(domEle).parent("td").parent("tr").css({color:"red"});
				$("#resultInfo").html("已审核的是不允许您删除的，请联系管理员删除！！！");
// 				return;
			}else{
				allIDCheck += $(domEle).val() + ",";
			}
		});
		// 截掉最后一个","
		if(allIDCheck.length>0) {
			allIDCheck = allIDCheck.substring(0, allIDCheck.length-1);
			// 赋给隐藏域
			$("#allIDCheck").val(allIDCheck);
			if(confirm("您确定要批量删除这些记录吗？")){
				// 提交form
				$("#submitForm").attr("action", "/xngzf/archives/batchDelFangyuan.action").submit();
			}
		}
	}

	/** 普通跳转 **/
	function jumpNormalPage(page){
		$("#submitForm").attr("action", "house_list.html?page=" + page).submit();
	}
	
	/** 输入页跳转 **/
	function jumpInputPage(totalPage){
		// 如果“跳转页数”不为空
		if($("#jumpNumTxt").val() != ''){
			var pageNum = parseInt($("#jumpNumTxt").val());
			// 如果跳转页数在不合理范围内，则置为1
			if(pageNum<1 | pageNum>totalPage){
				art.dialog({icon:'error', title:'友情提示', drag:false, resize:false, content:'请输入合适的页数，\n自动为您跳到首页', ok:true,});
				pageNum = 1;
			}
			$("#submitForm").attr("action", "house_list.html?page=" + pageNum).submit();
		}else{
			// “跳转页数”为空
			art.dialog({icon:'error', title:'友情提示', drag:false, resize:false, content:'请输入合适的页数，\n自动为您跳到首页', ok:true,});
			$("#submitForm").attr("action", "house_list.html?page=" + 1).submit();
		}
	}
</script>
<style>
	.alt td{ background:black !important;}
</style>
</head>
<body>
<div class="banner-w3layouts1" id="home">
<div class="header">
    <nav class="navbar navbar-default">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
            <h1><a  href="index.html">长途汽车购票系统</a></h1>
          </div>
          
          <!-- navbar-header -->
          <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
              <li><a onclick="window.location = 'index_after_login.jsp'" class="hvr-underline-from-center active scroll">首页</a></li>
							<li><a onclick="window.location = 'house_list.jsp'" class="hvr-underline-from-center scroll">车票</a></li>
							<li><a onclick="window.location = 'myorder.jsp'" class="hvr-underline-from-center scroll">我的订单</a></li>
							<li><a onclick="window.location = 'person_center.jsp'" class="hvr-underline-from-center scroll scroll">个人中心</a></li>
							<li><a onclick="window.location = 'guide.jsp'" class="hvr-underline-from-center scroll scroll">购票指南</a>
            </ul>
          </div>

          <div class="clearfix"> </div> 
        </nav>
      </div>
	
		<input type="hidden" name="allIDCheck" value="" id="allIDCheck"/>
		<input type="hidden" name="fangyuanEntity.fyXqName" value="" id="fyXqName"/>
		<div id="container">
			<div class="ui_content">
				<div class="ui_text_indent">
					<div id="box_border">
						<div id="box_top">搜索</div>
						<form action="QueryTicketImplServlet" method="post">
						<div id="box_center">
							起点
							<select name="fangyuanEntity.fyXqCode" id="fyXq" class="ui_select01" onchange="getFyDhListByFyXqCode();">
                                <% 
                                String source = (String) request.getAttribute("source");
                                if(source == null) source = ""; 
                                out.println("<option value=" + source + 
                                ">" + source + "</option>");%>
                                <option>天津</option>
                                <option>南京</option>
                                <option>呼和浩特</option>
                                <option>北京</option>
                                <option>大理</option>
 
                                
                            </select>

							终点
							<select name="fangyuanEntity.fyDhCode" id="fyDh" class="ui_select01" ">
                                <% 
                                String dest = (String) request.getAttribute("dest");
                                if(dest == null) dest = ""; 
                                out.println("<option value=" + dest + 
                                ">" + dest + "</option>");%>
                                <option>天津</option>
                                <option>南京</option>
                                <option>呼和浩特</option>
                                <option>北京</option>
                                <option>大理</option>
                                
                            </select>
					
                            
							出发日期
							<%
							String date = (String) request.getAttribute("date");
							String inp = null;
							if(date == null) {
								inp = "<input class= \"datepicker\" name = \"date\" type=\"text\"" + "value = \"\"" + "/>";
							} else {
								inp = "<input class= \"datepicker\" name = \"date\" type=\"text\"" + "value = " + date + "/>";
							}
							
							out.println(inp);
							%>
        		      		
							
							<script type="text/javascript">
	 							$('.datepicker').datepicker({
    	 						weekStart:1,
    	 						color: 'red'
	 							});
							</script>
							<input type="submit" value="查询" class="ui_input_btn01"  /> 
						</div>
						</form>
						
							
						
					</div>
				</div>
			</div>
			
			<div class="ui_content">
				<div class="ui_tb">
				<form action="" method="post" name="form1">
					<table class="table" cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
						<tr>
							
							<th>车次号</th>
							<th>始发地</th>
							<th>目的地</th>
							<th>日期</th>
							<th>出发时间</th>
							<th>可退票价</th>
							<th>不可退票价</th>
							<th>余票</th>
							<th>可退票</th>
							<th>不可退票</th>
						</tr>
							<c:forEach var="U" items="${allTicket}"> 
      
      					<tr>
     					 <td> <input type="text" value="${U.bid}" name="bid"> </td>
	       				 <td> <input type="text" value="<%out.println(source); %>" name="source"> </td>
						 <td> <input type="text" value="<%out.println(dest); %>" name="dest"> </td>
	       				 <td> <input type="text" value="<%out.println(date); %>" name="date"> </td>
	       				 <c:set var="xxxxbid" value="${U.bid}" scope="session"/>
	       				 <td> <input type="text" value="<%
	       				 String bid = (String) pageContext.findAttribute("xxxxbid");
	       				 Bus bus = new BusDaoImpl().queryAllBybid(bid); 
	       				 out.println(bus.getTime());%>" name="date"> </td>
	       			     <td> <input type="text" value="${U.returnablePrice}" name="retunable_price"> </td>
	       				 <td> <input type="text" value="${U.unReturnablePrice}" name="unretuanble_price"> </td>
	       			     <td> <input type="text" value="${U.rem}" name="rem"> </td>
	       			     <td><input type="button" value="购买" type="submit" onclick="purchase(1)"/></td>
	       			     <td><input type="button" value="购买" type="submit" onclick="purchase(0)"/></td>
      					</tr>
      					<input type="hidden" value="${U.tid }" name = "tid">
	       			    <input type="hidden" value="" name = "isReturnable" id = "hello_world">
 
    					</c:forEach>  
    					
					</table>
					</form>
					<script>
        	function purchase(val) {
        	    var f = document.getElementById("hello_world");
        	    f.value = val;
        		form1.action = 'add_passenger.jsp';
        		form1.submit();
        	}
        </script>
				</div>
				
				<div class="ui_tb_h30">
					<div class="ui_flt" style="height: 30px; line-height: 30px;">
						共有
						<span class="ui_txt_bold04">90</span>
						条记录，当前第
						<span class="ui_txt_bold04">1
						/
						9</span>
						页
					</div>
					<div class="ui_frt">
						<!--    如果是第一页，则只显示下一页、尾页 -->
						
							<input type="button" value="首页" class="ui_input_btn01" />
							<input type="button" value="上一页" class="ui_input_btn01" />
							<input type="button" value="下一页" class="ui_input_btn01"
								onclick="jumpNormalPage(2);" />
							<input type="button" value="尾页" class="ui_input_btn01"
								onclick="jumpNormalPage(9);" />
						
						
						
						<!--     如果是最后一页，则只显示首页、上一页 -->
						
						转到第<input type="text" id="jumpNumTxt" class="ui_input_txt01" />页
							 <input type="button" class="ui_input_btn01" value="跳转" onclick="jumpInputPage(9);" />
					</div>
				</div>
			</div>
		</div>
</div>

</body>
</html>

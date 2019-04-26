<%@ page language="java" 
import="java.util.*" 
import="entity.Order"
import="entity.User"
import="entity.OrderItem"
import="entity.Ticket"
import="java.util.List"
import="dao.OrderItemDaoImpl"
import="dao.PassengerDaoImpl"
import="dao.TicketDaoImpl"
pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<% 
Integer status = (Integer)request.getAttribute("status");
List<Order> all_list = new ArrayList<Order>();
List<Order>re_list=new ArrayList<Order>();
List<Order>unre_list=new ArrayList<Order>();
String username="";
String source="";
String dest="";
boolean find = false;
if(status!=null){
	if(status==200){
		find=true;
		all_list=(List<Order>)request.getAttribute("all_list");
		re_list=(List<Order>)request.getAttribute("re_list");
		unre_list=(List<Order>)request.getAttribute("unre_list");
		username=(String)request.getAttribute("username");
		source=(String)request.getAttribute("source");
		dest=(String)request.getAttribute("dest");
		 out.print("<script type=\"text/javascript\">"
  		+"alert(\"查询成功\");"
  		+"</script>"
  		);
		
	}else if(status==500){
		 out.print("<script type=\"text/javascript\">"
  		+"alert(\"查询条件不能为空\");"
  		+"</script>"
  		);
	}else if(status==300){
	 out.print("<script type=\"text/javascript\">"
  		+"alert(\"删除成功\");"
  		+"</script>"
  		);
	}else if(status==301){
	 out.print("<script type=\"text/javascript\">"
  		+"alert(\"删除失败\");"
  		+"</script>"
  		);
	}
}
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript" src="<%=basePath+"scripts/jquery/jquery-1.7.1.js" %>"></script>
<link href="<%=basePath+"style/authority/basic_layout.css" %>" rel="stylesheet" type="text/css">
<link href="<%=basePath+"style/authority/common_style.css"%>" rel="stylesheet" type="text/css">
<link href="<%=basePath +"assets/css/bootstrap.min.css"%>" rel="stylesheet" />
<link href="<%=basePath+"assets/css/material-bootstrap-wizard.css" %>" rel="stylesheet" />
<link href="<%=basePath+"css/style2.css" %>" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="<%=basePath+"scripts/authority/commonAll.js" %>"></script>
<script type="text/javascript" src="<%=basePath+"scripts/fancybox/jquery.fancybox-1.3.4.js" %>"></script>
<script type="text/javascript" src="<%=basePath+"scripts/fancybox/jquery.fancybox-1.3.4.pack.js" %>"></script>
<link rel="stylesheet" type="text/css" href="<%=basePath+"style/authority/jquery.fancybox-1.3.4.css" %>" media="screen" />
<script type="text/javascript" src="<%=basePath+"scripts/artDialog/artDialog.js?skin=default" %>"></script>
<script src="<%=basePath+"jquery/jquery-1.10.2.js" %>" type="text/javascript"></script>
<script src="<%=basePath+"assets/js/bootstrap-datepicker.js" %>"></script>
 <link href="<%=basePath+"bootstrap3/css/bootstrap.css" %>" rel="stylesheet" />
	<link href="<%=basePath+"assets/css/bootstrap-datepicker.css" %>" rel="stylesheet" />  

<title>我的订单</title>
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
              <li><a href="<%=basePath+"index_after_login.jsp" %>" class="hvr-underline-from-center active scroll">首页</a></li>
							<li><a href="<%=basePath+"house_list.jsp" %>" class="hvr-underline-from-center scroll">车票</a></li>
							<li><a href="<%=basePath+"myorder.jsp" %>" class="hvr-underline-from-center scroll">我的订单</a></li>
							<li><a href="<%=basePath+"person_center.jsp" %>" class="hvr-underline-from-center scroll scroll">个人中心</a></li>
							<li><a href="<%=basePath+"guide.jsp" %>" class="hvr-underline-from-center scroll scroll">购票指南</a>
            </ul>
          </div>
          <div class="clearfix"> </div> 
        </nav>
      </div>
<div id="container">
      <div class="ui_content">
        <div class="ui_text_indent">
          <div id="box_border">
                 
          <div class="wizard-container">

                    <div class="card wizard-card" data-color="blue1" id="wizard">
             <form action="<%=basePath+"servlet/myorder_search"%>" method="post">
                    <!--        You can switch " data-color="blue" "  with one of the next bright colors: "green", "orange", "red", "purple"             -->

                          <div class="wizard-header">
            <div id="box_top">我的订单</div>
            <input id="1" type="hidden" name="source" value="天津">
            <input id="2" type="hidden" name="dest" value="天津">
            
            <div id="box_center">
              起点
              <select name="fangyuanEntity.fyXqCode" id="fyXq" class="ui_select01" onchange="change(1,this.value);">
                                <option value="天津" >天津</option>
                                <option value="北京" >北京</option>
                                <option value="呼和浩特" >呼和浩特</option>
                                <option value="成都" >成都</option>
                                <option value="大理" >大理</option>
                                <option value="南京" >南京</option>
                            </select>

              终点
              <select name="fangyuanEntity.fyDhCode" id="fyDh" class="ui_select01" onchange="change(2,this.value);">
                                <option value="天津" >天津</option>
                                <option value="北京" >北京</option>
                                <option value="呼和浩特" >呼和浩特</option>
                                <option value="成都" >成都</option>
                                <option value="大理" >大理</option>
                                <option value="南京" >南京</option>
                            </select>
              创建日期
			  <!--<select name="fangyuanEntity.fyHxCode" id="fyHx" class="ui_select01">-->


				  <!--<input class="datepicker form-control" type="text"/>-->
        		      		<input name ="date" class="datepicker1" type="text"/>
							
							<script type="text/javascript">
	 							$('.datepicker1').datepicker({
    	 						weekStart:1,
    	 						color: 'red'
	 							});
							</script>


                               
                            
              <input type="submit" value="查询" class="ui_input_btn01"  /> 
              <script type="text/javascript">
             	 function change(id,value){
              		var id = document.getElementById(id);
              		id.value=value;
              	}
              	
              
              </script>
              
            </div>
                       
                          </div>
                		</form>
                <div class="wizard-navigation">
                  <ul>
                                  <li><a href="#details" data-toggle="tab">全部订单</a></li>
                                  <li><a href="#captain" data-toggle="tab">可退票订单</a></li>
                                  <li><a href="#description" data-toggle="tab">不可退票订单</a></li>
                  </ul>
                </div>

								<div class="tab-content">
								<div class="tab-pane" id="details">
								<div class="row">
                                    
									<div class="ui_content">
	  
        <div class="ui_tb">
        
        
          
          <%
        
         	if(find){
         		if(all_list.size()>0){
         			for(int i=0;i<all_list.size();i++){
         				//out.print("<form action=\""+basePath+"servlet/myorder_delete\" method=\"post\">");
         				out.print("<div>");
         				out.print("<form action=\""+basePath+"servlet/myorder_delete"+"\" method=\"post\">");
         				out.print("<input type=\"hidden\" name=\"oid\" value=\""+all_list.get(i).getOid()+"\"  />");
         				out.print("<table class=\"table\" cellspacing=\"0\" cellpadding=\"0\" width=\"100%\" align=\"center\" border=\"0\">");
         				out.print(
         				"<tr>"+
         				"<th>订单号</th>"+
         				"<th>创建人</th>"+
         				"<th>创建日期</th>"+
         				"<th>订单金额</th>"+
         				"<th>操作</th>"+
         				"</tr>"
         				
         				);
         				out.print(
						"<tr>"+
         				"<td>"+all_list.get(i).getOid()+"</td>"+
         				"<td>"+username+"</td>"+
         				"<td>"+all_list.get(i).getDate()+"</td>"+
         				"<td>"+String.format("%.2f",all_list.get(i).getTotalPrice())+"</td>"
         				
						);
						if(all_list.get(i).getReturnable()==1){
						out.print("<td> <input type=\"submit\" value=\"退票\" class=\"ui_input_btn\" /> </td>"+
         				"</tr>");
						}else{
						out.print(
         				"</tr>");
						}
						
						
						
						List<OrderItem> items = new OrderItemDaoImpl().query(all_list.get(i).getOid());
						for(int j=0;j<items.size();j++){
							int tid = items.get(j).getTid();
							Ticket ticket = new TicketDaoImpl().queryById(tid);
							
							if(j==0){
							out.print(
         				"<tr>"+
         				"<th>车次号</th>"+
         				"<th>始发地</th>"+
         				"<th>目的地</th>"+
         				"<th>乘车人</th>"+
         				"<th>出发日期</th>"+
         				"<th>票价</th>"+
         				"</tr>"
         				
         				);
         				
							}
							out.print(
						"<tr>"+
         				"<td>"+ticket.getBid()+"</td>"+
         				"<td>"+source+"</td>"+
         				"<td>"+dest+"</td>"+
         				"<td>"+new PassengerDaoImpl().queryPassengerById(items.get(j).getPid()).getName()+"</td>"+
         				"<td>"+ticket.getDate()+"</td>"+
         				"<td>"+String.format("%.2f",items.get(j).getPrice())+"</td>"+
         				"</tr>"
						);
						
						
         			}
         			out.print("</table>");
         			out.print("</form>");
         			out.print("</div>");
         			
         		}
         		
         	}
         	}
           %>
            
          
          
        </div>
        
      </div>
								</div>
								</div>
                                <div class="tab-pane" id="captain">
                                      <div class="row">
		                                    		                            	
        <div class="ui_tb">
         
          		 <%
         	if(find){
         		if(re_list.size()>0){
         			for(int i=0;i<re_list.size();i++){
         				//out.print("<form action=\""+basePath+"servlet/myorder_delete\" method=\"post\">");
         				out.print("<form action=\""+basePath+"servlet/myorder_delete"+"\" method=\"post\">");
         				out.print("<input type=\"hidden\" name=\"oid\" value=\""+re_list.get(i).getOid()+"\"  />");
         	
         				out.print("<table class=\"table\" cellspacing=\"0\" cellpadding=\"0\" width=\"100%\" align=\"center\" border=\"0\">");
         				out.print(
         				"<tr>"+
         				"<th>订单号</th>"+
         				"<th>创建人</th>"+
         				"<th>创建日期</th>"+
         				"<th>订单金额</th>"+
         				"<th>操作</th>"+
         				"</tr>"
         				
         				);
         				out.print(
						"<tr>"+
         				"<td>"+re_list.get(i).getOid()+"</td>"+
         				"<td>"+username+"</td>"+
         				"<td>"+re_list.get(i).getDate()+"</td>"+
         				"<td>"+String.format("%.2f",re_list.get(i).getTotalPrice())+"</td>"+
         				"<td> <input type=\"submit\" value=\"退票\" class=\"ui_input_btn\" /> </td>"+
         				"</tr>"
						);
						List<OrderItem> items = new OrderItemDaoImpl().query(re_list.get(i).getOid());
						for(int j=0;j<items.size();j++){
							int tid = items.get(j).getTid();
							Ticket ticket = new TicketDaoImpl().queryById(tid);
							if(j==0){
							out.print(
         				"<tr>"+
         				"<th>车次号</th>"+
         				"<th>始发地</th>"+
         				"<th>目的地</th>"+
         				"<th>乘车人</th>"+
         				"<th>出发日期</th>"+
         				"<th>票价</th>"+
         				"</tr>"
         				
         				);
         				
							}
							out.print(
						"<tr>"+
         				"<td>"+ticket.getBid()+"</td>"+
         				"<td>"+source+"</td>"+
         				"<td>"+dest+"</td>"+
         				"<td>"+new PassengerDaoImpl().queryPassengerById(items.get(j).getPid()).getName()+"</td>"+
         				"<td>"+ticket.getDate()+"</td>"+
         				"<td>"+String.format("%.2f",items.get(j).getPrice())+"</td>"+
         				"</tr>"
						);
				
         			}
         			out.print("</table>");
         			
         			out.print("</form>");
         		}
         		
         	}
         	}
           %>
          
              
        
       </div>
        
		                                </div>
                                   
                                </div>
                                <div class="tab-pane" id="description">
								    <div class="row">
		                                    		                            	
        <div class="ui_tb">
          
          	 <%
         	if(find){
         		if(unre_list.size()>0){
         			for(int i=0;i<unre_list.size();i++){
         				//out.print("<form action=\""+basePath+"servlet/myorder_delete\" method=\"post\">");
         				out.print("<form action=\""+basePath+"servlet/myorder_delete"+"\" method=\"post\">");
         				out.print("<input type=\"hidden\" name=\"oid\" value=\""+unre_list.get(i).getOid()+"\"  />");
         	
         				out.print("<table class=\"table\" cellspacing=\"0\" cellpadding=\"0\" width=\"100%\" align=\"center\" border=\"0\">");
         				out.print(
         				"<tr>"+
         				"<th>订单号</th>"+
         				"<th>创建人</th>"+
         				"<th>创建日期</th>"+
         				"<th>订单金额</th>"+
         				"<th>操作</th>"+
         				"</tr>"
         				
         				);
         				out.print(
						"<tr>"+
         				"<td>"+unre_list.get(i).getOid()+"</td>"+
         				"<td>"+username+"</td>"+
         				"<td>"+unre_list.get(i).getDate()+"</td>"+
         				"<td>"+String.format("%.2f",unre_list.get(i).getTotalPrice())+"</td>"+
         				"<td> <input type=\"hidden\" value=\"退票\" class=\"ui_input_btn\" /> </td>"+
         				"</tr>"
						);
						List<OrderItem> items = new OrderItemDaoImpl().query(unre_list.get(i).getOid());
						for(int j=0;j<items.size();j++){
							int tid = items.get(j).getTid();
							Ticket ticket = new TicketDaoImpl().queryById(tid);
							if(j==0){
							out.print(
         				"<tr>"+
         				"<th>车次号</th>"+
         				"<th>始发地</th>"+
         				"<th>目的地</th>"+
         				"<th>乘车人</th>"+
         				"<th>出发日期</th>"+
         				"<th>票价</th>"+
         				"</tr>"
         				
         				);
         				
							}
							out.print(
						"<tr>"+
         				"<td>"+ticket.getBid()+"</td>"+
         				"<td>"+source+"</td>"+
         				"<td>"+dest+"</td>"+
         				"<td>"+new PassengerDaoImpl().queryPassengerById(items.get(j).getPid()).getName()+"</td>"+
         				"<td>"+ticket.getDate()+"</td>"+
         				"<td>"+String.format("%.2f",items.get(j).getPrice())+"</td>"+
         				"</tr>"
						);
				
         			}
         			out.print("</table>");
         			
         			out.print("</form>");
         		}
         		
         	}
         	}
           %>
         
          
              
            
          
        </div>
        
		                                </div>
                                    
                                </div>
                                                                                 
								</div>
                            <div class="wizard-footer">
                                <div class="pull-right">
                                      <input type='button' class='btn btn-next btn-fill btn-danger btn-wd' name='next' value='Next' />
                                      <input type='button' class='btn btn-finish btn-fill btn-danger btn-wd' name='finish' value='Finish' />
                                  </div>
                                  <div class="pull-left">
                                      <input type='button' class='btn btn-previous btn-fill btn-default btn-wd' name='previous' value='Previous' />

                    
                    </div>
                                  </div>
                                  <div class="clearfix"></div>
                            </div>
                       
                    </div>
                </div> <!-- wizard container -->
            </div>
        </div> <!-- row -->
    
            
          </div>
        </div>
      </div>
</body>
<!--   Core JS Files   -->
  <script src="<%=basePath+"assets/js/jquery-2.2.4.min.js" %>" type="text/javascript"></script>
  <script src="<%=basePath+"assets/js/bootstrap.min.js"%>" type="text/javascript"></script>
  <script src="<%=basePath+"assets/js/jquery.bootstrap.js" %>" type="text/javascript"></script>

  <!--  Plugin for the Wizard -->
  <script src="<%=basePath+"assets/js/material-bootstrap-wizard.js" %>"></script>

  <!--  More information about jquery.validate here: http://jqueryvalidation.org/  -->
  <script src="<%=basePath+"assets/js/jquery.validate.min.js" %>"></script>
</html>

<%@ page language="java" 
import="java.util.*" 
import="entity.Ticket"
import="entity.Bus"
pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
String action = (String)request.getAttribute("action");
int status=-1;
Bus bus=new Bus();
Ticket ticket=new Ticket();
if(action!=null){
	if(action.equals("search")){
			if((Integer)request.getAttribute("status")==400){
				out.print("<script type=\"text/javascript\">"
  						+"alert(\"搜索条件为空\");"
  						+"</script>"
  							);
			}else if((Integer)request.getAttribute("status")==401){
				out.print("<script type=\"text/javascript\">"
  						+"alert(\"无结果\");"
  						+"</script>"
  							);
			
			}else{
				status = 1;
				bus = (Bus)request.getAttribute("bus");
				ticket = (Ticket)request.getAttribute("ticket");
			}

	}else if(action.equals("add")){
		Integer result = (Integer)request.getAttribute("status");
 		if(result!=null){
 			 if(result==200){
  					out.print("<script type=\"text/javascript\">"
  					+"alert(\"添加成功\");"
  					+"</script>"
  							);
  			}else if(result==500){
   					out.print("<script type=\"text/javascript\">"
  					+"alert(\"添加失败\");"
 					 +"</script>"
 							 );
  			}
  		}
	}else if(action.equals("update")){
		Integer result = (Integer)request.getAttribute("status");
 		if(result!=null){
 			 if(result==200){
  					out.print("<script type=\"text/javascript\">"
  					+"alert(\"修改成功\");"
  					+"</script>"
  							);
  			}else if(result==500){
   					out.print("<script type=\"text/javascript\">"
  					+"alert(\"修改失败\");"
 					 +"</script>"
 							 );
  			}
		}
	}else if(action.equals("delete")){
		Integer result = (Integer)request.getAttribute("status");
 		if(result!=null){
 			 if(result==200){
  					out.print("<script type=\"text/javascript\">"
  					+"alert(\"删除成功\");"
  					+"</script>"
  							);
  			}else if(result==500){
   					out.print("<script type=\"text/javascript\">"
  					+"alert(\"删除失败\");"
 					 +"</script>"
 							 );
  			}
		}
	}
}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
      <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Simple Responsive Admin</title>
	<!-- BOOTSTRAP STYLES-->
    <link href="<%=basePath+"assets2/css/bootstrap.css"%>" rel="stylesheet"  />
     <!-- FONTAWESOME STYLES-->
    <link href="<%=basePath+"assets2/css/font-awesome.css" %>" rel="stylesheet" />
        <!-- CUSTOM STYLES-->
    <link href="<%=basePath+"assets2/css/custom.css" %>" rel="stylesheet" />
     <!-- GOOGLE FONTS-->
   <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />

</head>
<body>
     
           
          
    <div id="wrapper">
         <div class="navbar navbar-inverse navbar-fixed-top">
            <div class="adjust-nav">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">
                      <img src="<%=basePath+"assets2/img/logo.png"%>" />
                    </a>
                </div>
              
                 <span class="logout-spn" >
                  <a href="#" style="color:#fff;">LOGOUT</a>  

                </span>
            </div>
        </div>
        <!-- /. NAV TOP  -->
        <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">
                 

					<li >
                        <a href="<%=basePath+"discount.jsp" %>"> <i class="fa fa-desktop "></i>优惠设置 <span class="badge">Included</span></a>
                    </li>
                   

                    <li class="active-link">
                        <a href="<%=basePath+"manager.jsp" %>"><i class="fa fa-table "></i>车次管理  <span class="badge">Included</span></a>
                    </li>
                  
                    <li>
                        <a href="<%=basePath+"statistics.jsp" %>"><i class="fa fa-bar-chart-o"></i>售票统计 <span class="badge">Included</span></a>
                    </li>

                    <li>
                        <a href="<%=basePath+"finance.jsp" %>"><i class="fa fa-edit "></i>财务结算 <span class="badge">Included</span></a>
                    </li>
                   
                </ul>
                            </div>

        </nav>
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper" >
            <div id="page-inner">
                <div class="row">
                    <div class="col-md-12">
                     <h2>车次管理 </h2>   
                    </div>
                </div>              
                 <!-- /. ROW  -->
                  <hr />
                 <div class="row">
                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
           
                       <div  class="input-group">
<form action="<%=basePath+"servlet/manager_search" %>" method="post">  
  <span class="btn btn-default">@车次号</span> <input name="search" type="text" />
  <input class="btn btn-info" type="submit" value="搜索"/>
  <input class="btn btn-info" type="button" value="添加新车次" onclick="showdiv();"/>
</form> 
</div>
<div class="input-group">
<form action="<%=basePath+"servlet/manager_add" %>" method="post">
<div id ="dv" class="input-group" style="display:none;">
<div  class="table-responsive" >
                            <table  class="table" width="400" style="table-layout:fixed;">
                                <thead>
                                    <tr >
                                       
                                        <th >车次号</th>
                                        <th >始发地</th>
                                        <th >目的地</th>
                                        <th >出发时间</th>
                                        <th >座位数</th>
                                        <th >可退票价/￥</th>
                                        <th >不可退票价/￥</th>
                                        <th >操作</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr class="info">
                                      
                                        <td ><input name="bid" type="text" style="width:100px;"/></td>
                                        <td ><input name="source" type="text" style="width:100px;"/></td>
                                        <td ><input name="dest" type="text" style="width:100px;"/></td>
                                        <td ><input name="time" type="text" style="width:100px;"/></td>
                                        <td ><input name="seats" type="text" style="width:100px;"/></td>
                                        <td ><input name="returnable_price" type="text" style="width:100px;"/></td>
                                        <td ><input name="unreturnable_price" type="text" style="width:100px;"/></td>
                                        <td ><input class="btn btn-info" type="submit" value="添加"/></td>
                                    </tr>
                                    
                                </tbody>
                            </table>
                        </div>
</div>
</form>
</div>
 <script type="text/javascript">

  function showdiv(){
 
if(showdiv_display = document.getElementById('dv').style.display=='none'){//如果show是隐藏的
 
document.getElementById('dv').style.display='block';//show的display属性设置为block（显示）
 
}else{//如果show是显示的
 
document.getElementById('dv').style.display='none';//show的display属性设置为none（隐藏）
 
}
 
}

  </script>
<br />
 
</div>
<br />

                    </div>
                   
                  <div class="col-lg-6 col-md-6">
                        <h5>车次列表</h5>
                        <form  action="<%=basePath+"servlet/manager_delete" %>" method="post">
                        <input name="bid" type="hidden" value="<%=bus.getBid() %>" />
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>车次号</th>
                                        <th>始发地</th>
                                        <th>目的地</th>
                                        <th>出发时间</th>
                                        <th>座位数</th>
                                        <th>可退票价/￥</th>
                                        <th>不可退票价/￥</th>
                                        <th style="text-align:center;">操作</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr class="success">
                                      
                                        <%
                                        if(status==1){
                                        out.print(
                                        "<td>"+1+"</td>"
                                        +"<td>"+bus.getBid()+"</td>"
                                        +"<td>"+bus.getSource()+"</td>"
                                        +"<td>"+bus.getDest()+"</td>"
                                        +"<td>"+bus.getTime()+"</td>"
                                        +"<td>"+bus.getSeats()+"</td>"
                                         +"<td>"+ticket.getReturnablePrice()+"</td>"
                                          +"<td>"+ticket.getUnReturnablePrice()+"</td>"
                                          +"<td> <input class=\"btn btn-info\" type=\"submit\" value=\"删除\" \" />"+
                                        "<input class=\"btn btn-info\" type=\"button\" value=\"修改\" onclick=\"update()\" /></td>"
                                        );
                                        }
                                      %>
                                    </tr>
                                    
                                    
                                </tbody>
                            </table>
                        </div>
                        </form>
                                   <div class="input-group">
<form action="<%=basePath+"servlet/manager_update" %>" method="post">
<div id ="dv1" class="input-group" style="display:none;">
<div  class="table-responsive" >
<input type="hidden" name="bid" value="<%=bus.getBid() %>" />
                            <table  class="table" width="400" style="table-layout:fixed;">
                                <thead>
                                    <tr >
                                       
                                      
                                        <th>车次号</th>
                                        <th>始发地</th>
                                        <th>目的地</th>
                                        <th>出发时间</th>
                                        <th>座位数</th>
                                        <th>可退票价/￥</th>
                                        <th>不可退票价/￥</th>
                                        <th>操作</th>
                                    </tr>
                                </thead>
                                <tbody>
                                
                                    <tr class="info">
                                      	
                                        <td ><textarea readonly="readonly" style="width:100px;height:30px;"><%=bus.getBid() %></textarea></td>
                                        <td ><input name="source" type="text" style="width:100px;" value="<%=bus.getSource() %>" /></td>
                                        <td ><input name="dest" type="text" style="width:100px;" value="<%=bus.getDest() %>" /></td>
                                        <td ><input name="time" type="text" style="width:100px;" value="<%=bus.getTime() %>" /></td>
                                        <td ><input name="seats" type="text" style="width:100px;" value="<%=bus.getSeats() %>" /></td>
                                        <td ><input name="returnable_price" type="text" style="width:100px;" value="<%=ticket.getReturnablePrice() %>" /></td>
                                        <td ><input name="unreturnable_price" type="text" style="width:100px;" value="<%=ticket.getUnReturnablePrice() %>"/></td>
                                        <td ><input class="btn btn-info" type="submit" value="确认"/></td>
                                    </tr>
                                    
                                </tbody>
                            </table>
                        </div>
</div>
</form>
</div>
 <script type="text/javascript">

  function update(){
 
if(showdiv_display = document.getElementById('dv1').style.display=='none'){//如果show是隐藏的
 
document.getElementById('dv1').style.display='block';//show的display属性设置为block（显示）
 
}else{//如果show是显示的
 
document.getElementById('dv1').style.display='none';//show的display属性设置为none（隐藏）
 
}
 
}

  </script>
<br />
 
</div>
                    </div>
                

                    </div>

                </div>
 
              
                 <!-- /. ROW  -->           
    </div>
             <!-- /. PAGE INNER  -->
            </div>
         <!-- /. PAGE WRAPPER  -->
        </div>
    <div class="footer">
      
    
             <div class="row">
                
        </div>
        </div>
          

     <!-- /. WRAPPER  -->
    <!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
    <!-- JQUERY SCRIPTS -->
     <script src="<%=basePath+"assets2/js/jquery-1.10.2.js" %>"></script>
      <!-- BOOTSTRAP SCRIPTS -->
    <script src="<%=basePath+"assets2/js/bootstrap.min.js" %>"></script>
      <!-- CUSTOM SCRIPTS -->
    <script src="<%=basePath+"assets2/js/custom.js" %>"></script>
    
   
</body>
</html>

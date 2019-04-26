<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
Integer status = (Integer)request.getAttribute("status");
String bid="";
String date="";
String count="";
boolean bool=false;
if(status!=null){
	if(status==200){
	 bid = (String)request.getAttribute("bid");
	 date=(String)request.getAttribute("date");
	 count=(Integer)request.getAttribute("count")+"";
	 bool=true;
	}else if(status==500){
		out.print("<script type=\"text/javascript\">"
 		 +"alert(\"查询成功\");"
  		 +"</script>"
  		);
	}else if(status==400){
		out.print("<script type=\"text/javascript\">"
 		 +"alert(\"无此车票\");"
  		 +"</script>"
  		);
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
    <link href="<%=basePath+"assets2/css/bootstrap.css"%>" rel="stylesheet" />
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
                   

                    <li >
                        <a href="<%=basePath+"manager.jsp" %>"><i class="fa fa-table "></i>车次管理  <span class="badge">Included</span></a>
                    </li>
                  
                    <li class="active-link">
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
                     <h2>售票统计 </h2>   
                    </div>
                </div>              
                 <!-- /. ROW  -->
                  <hr />
    <form action="<%=basePath+"servlet/statistics_do" %>" method="post">
	<div  class="input-group">
					   
   <span class="input-group-addon" style="width:20px;">@ 车次号</span>
  <input name="bid" type="text"  />
  
  <span class="input-group-addon" style="width:20px;">@ 日期</span>
  <input name="date" type="text"  />
  <span><input class="btn btn-info" type="submit" value="统计"></span>
	  
	</div>
	</form>
 <div  class="input-group">
     <div class="table-responsive">
                            <table class="table" style="width:800px;">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>车次号</th>
                                        <th>日期</th>
                                        <th>售票数</th>
                                    </tr>
                                </thead>
                                <tbody  >
                                    <tr class="info">
                                    <% 
                                    if(bool)
                                    out.print(
                                    
                                     "<td>1</td>"
                                    +"<td>"+bid+"</td>"
                                    +"<td>"+date+"</td>"
                                    +"<td>"+count+"</td>"
                                    );
                                     %>
                                       
                                    </tr>
                                    
                                </tbody>
                            </table>
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

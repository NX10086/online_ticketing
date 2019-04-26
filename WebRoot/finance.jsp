<%@ page language="java" 
import="java.util.*" 
import="util.Util"
pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
Integer status = (Integer) request.getAttribute("status");
int result =-1;
List<Double> year_list=new ArrayList<Double>();
List<Double> season_list=new ArrayList<Double>();
List<Double> month_list=new ArrayList<Double>();
String year="";
String quarter="";
String month="";
double total_price=0;
if(status!=null){
	if(status==1){
		result=1;
		total_price=(Double)request.getAttribute("total_price");
		year_list=(List<Double>)request.getAttribute("year_list");
		year=(String)request.getAttribute("year");
	}else if(status==2){
	result=2;
		total_price=(Double)request.getAttribute("total_price");
		season_list=(List<Double>)request.getAttribute("season_list");
		year=(String)request.getAttribute("year");
		quarter=(String)request.getAttribute("quarter");
	}else if(status==3){
	result=3;
		total_price=(Double)request.getAttribute("total_price");
		month_list=(List<Double>)request.getAttribute("month_list");
		year=(String)request.getAttribute("year");
		quarter=(String)request.getAttribute("quarter");
		month=(String)request.getAttribute("month");
		
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
                  
                    <li>
                        <a href="<%=basePath+"statistics.jsp" %>"><i class="fa fa-bar-chart-o"></i>售票统计 <span class="badge">Included</span></a>
                    </li>

                    <li class="active-link">
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
                     <h2>财务结算 </h2>   
                    </div>
                </div>              
                 <!-- /. ROW  -->
                  <hr />
<form action="<%=basePath+"servlet/finance_do"%>" method="post">
<input type="hidden" id = "1" name="way" value="按年结算">
<input type="hidden" id = "2" name="year" value="2016">
<input type="hidden" id = "3" name="quarter" value="春">
<input type="hidden" id = "4" name="month" value="1">
              	  <div  class="input-group">
					   
   <span class="input-group-addon" >结算方式</span>
  <select type="text" class="form-control"  onchange="set(1,this.value)">
  <option value="按年结算">按年结算</option>
  <option value="按季结算">按季结算</option>
  <option value="按月结算">按月结算</option>
  </select>
  <span class="input-group-addon" >年</span>
  <select type="text" class="form-control" onchange="set(2,this.value)"  >
  <option value="2016">2016</option>
  <option value="2017">2017</option>
  <option value="2018">2018</option>
  <option value="2019">2019</option>
  </select>
   <span class="input-group-addon" >季度</span>
   <select type="text" class="form-control"  onchange="set(3,this.value)">
  <option value="春">春</option>
  <option value="夏">夏</option>
  <option value="秋">秋</option>
  <option value="冬">冬</option>
  </select>
   <span class="input-group-addon" >月</span>
   <select type="text" class="form-control" onchange="set(4,this.value)">
  <option value="1">1</option>
  <option value="2">2</option>
  <option value="3">3</option>
  <option value="4">4</option>
  <option value="5">5</option>
  <option value="6">6</option>
  <option value="7">7</option>
  <option value="8">8</option>
  <option value="9">9</option>
  <option value="10">10</option>
  <option value="11">11</option>
  <option value="12">12</option>
  </select>
</div>
<br/>
<script type="text/javascript">
function set(i,value){

var d = document.getElementById(i);
	d.value=value;
}
</script>
<div  class="input-group">
<input  class="btn btn-info" type="submit" value="开始结算" style="margin-left:800px;"/>
</div>
</form>
 <div  class="input-group">
     <div class="table-responsive">
                            <table class="table" style="width:800px;">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>日期</th>
                                        <th>金额</th>
                                    </tr>
                                </thead>
                                <tbody  >
                                
                                <%
                                if(result==1&&total_price>0){
                                	for(int i =1;i<=4;i++){
                                		String season = Util.getSeason(i);
                                		out.print(
                                		"<tr class=\"info\" >"+
                                		"<td>"+i+"</td>"+
                                		"<td>"+season+"</td>"+
                                		"<td>"+year_list.get(i-1)+"</td>"+
                                		"</tr>");
                                	}
                                	out.print(
                                		"<tr class=\"danger\" >"+
                                		"<td>"+"总额"+"</td>"+
                                		"<td>"+year+"</td>"+
                                		"<td>"+total_price+"</td>"+
                                		"</tr>");
                                }else if(result==2&&total_price>0){
                                	for(int i =1;i<=12;i++){
                                		out.print(
                                		"<tr class=\"info\" >"+
                                		"<td>"+i+"</td>"+
                                		"<td>"+i+"月"+"</td>"+
                                		"<td>"+season_list.get(i-1)+"</td>"+
                                		"</tr>");
                                	}
                                	out.print(
                                		"<tr class=\"danger\" >"+
                                		"<td>"+"总额"+"</td>"+
                                		"<td>"+year+"年"+quarter+"</td>"+
                                		"<td>"+total_price+"</td>"+
                                		"</tr>");
                                
                                }else if(result==3&&total_price>0){
                                for(int i =1;i<=30;i++){
                                		out.print(
                                		"<tr class=\"info\" >"+
                                		"<td>"+i+"</td>"+
                                		"<td>"+year+"年"+month+"月"+i+"日"+"</td>"+
                                		"<td>"+month_list.get(i-1)+"</td>"+
                                		"</tr>");
                                	}
                                	out.print(
                                		"<tr class=\"danger\" >"+
                                		"<td>"+"总额"+"</td>"+
                                		"<td>"+year+"年"+month+"月"+"</td>"+
                                		"<td>"+total_price+"</td>"+
                                		"</tr>");
                                
                                }
                                %>
                                
                                  
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
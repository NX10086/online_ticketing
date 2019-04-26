<%@ page language="java"
 import="java.util.*"
 import="dao.TypeDisDaoImpl" 
 import= "java.util.List"
 import= "entity.TypeDis"
 import="dao.NumberDisDaoImpl"
 import="dao.SeasonDisDaoImpl"
 import= "entity.NumberDis"
 import= "entity.SeasonDis"

 pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
 List<TypeDis> list = new TypeDisDaoImpl().queryAll();
 List<SeasonDis> s_list = new SeasonDisDaoImpl().queryAll();
 List<NumberDis> n_list = new NumberDisDaoImpl().queryAll();
 Integer status = (Integer)request.getAttribute("status");
 if(status!=null){
  if(status==200){
  out.print("<script type=\"text/javascript\">"
  +"alert(\"修改成功\");"
  +"</script>"
  );
  }else if(status==500){
   out.print("<script type=\"text/javascript\">"
  +"alert(\"修改失败\");"
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
                 

					<li class="active-link">
                        <a href="<%=basePath+"discount.jsp" %>"> <i class="fa fa-desktop "></i>优惠设置 <span class="badge">Included</span></a>
                    </li>
                   

                    <li >
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
                     <h2>优惠设置</h2>   
                    </div>
                </div>              
                 <!-- /. ROW  -->
                  <hr />
                  <div class="row">
                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                        <h5>请选择</h5>
  <form action="servlet/discount_update" method="post">
                       <div class="input-group">
  <span class="input-group-addon">@ 乘客类型</span>
  <input type="hidden" id="type1" name="type" value="<% out.print(list.get(0).getType()+"?"); %>"/>
  <input type="hidden" id="type2" name="season" value="<% out.print(s_list.get(0).getSeason()+"季?"); %>"/>
  <input type="hidden" id="type3" name="number" value="<% out.print(">"+n_list.get(0).getNum()+"?"); %>"/>
  <select  class="form-control"  onchange="dochange(1,this.value,this.options[this.options.selectedIndex].text)">
  <%
  for(TypeDis d:list){
  	out.println("<option"+" value="+d.getDiscount()+">"+d.getType()+"&nbsp;</option>");
  }
   %>
  </select>
  <span class="input-group-addon">$ 折扣</span>
  <input id="1" name="type_dis" type="text" class="form-control" value="<% out.println(list.get(0).getDiscount());%>"/>
  <span class="input-group-addon">%</span>
</div>

<br />
<div class="input-group">
  <span class="input-group-addon">@&nbsp;&nbsp;季&nbsp;&nbsp;&nbsp;&nbsp;节&nbsp;&nbsp;&nbsp; </span>
  <select  class="form-control" style="" onchange="dochange(2,this.value,this.options[this.options.selectedIndex].text)">
<% 
  for(SeasonDis d:s_list){
  	out.println("<option"+" value="+d.getDiscount()+">"+d.getSeason()+"季&nbsp; </option>");
  }
%>
  </select>
  <span class="input-group-addon">$ 折扣</span>
  <input id="2" name="season_dis" type="text" class="form-control"  value="<% out.println(s_list.get(0).getDiscount());%>"/>
  <span class="input-group-addon">%</span>
</div>
<br />
<div class="input-group">
  <span class="input-group-addon">@ 购票数量</span>
  <select  class="form-control"  onchange="dochange(3,this.value,this.options[this.options.selectedIndex].text)">
<%
  for(NumberDis d:n_list){
  	out.println("<option"+" value="+d.getDiscount()+">>"+d.getNum()+"&nbsp;张 </option>");
  }
%>
  </select>
  <span class="input-group-addon">$ 折扣</span>
  <input id="3" name="number_dis" type="text" class="form-control" value="<% out.println(n_list.get(0).getDiscount());%>"/>
  <span class="input-group-addon">%</span>
  
</div>


<br />

<div class="input-group">
<input  class="btn btn-primary" type="submit" value="修改"/>
<input  class="btn btn-danger" type="button" value="重置" onclick="clear_input()"/>
</div>
</form>
<script type="text/javascript">
function dochange(i,value,text){

var d = document.getElementById(i);
	d.value=value;
var id = "type"+i;
var t = document.getElementById(id);
	t.value=text;
	
}

function clear_input(){
for(var i=1;i<=3;i++)
{
var d = document.getElementById(i);
	d.value="";
}

}


</script>
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

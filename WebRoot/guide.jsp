<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>购票指南</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Demo project">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--<link rel="stylesheet" type="text/css" href="styles/bootstrap4/bootstrap.min.css">-->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="styles/main_styles.css">
</head>
<body>

<div class="super_container">


  <!-- Home -->

  <div class="home">
    
    <!-- Home Slider -->

    <div class="home_slider_container">
      <div class="owl-carousel owl-theme home_slider">
        
        <!-- Slider Item -->
        <div class="owl-item">
          <div class="home_slider_background" style="background-image:url(images/home_slider.jpg)"></div>
		<div class="header">
    <nav class="navbar navbar-default">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
            <h1><a  href="#">长途汽车购票系统</a></h1>
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

          <div class="home_slider_content_container">
            <div class="container">
              <div class="row">
                <div class="col">
                  <div class="home_slider_content">
                    <div class="home_slider_item_category trans_200"><a href="#" class="trans_200">购票指南</a></div>
                    <div class="home_slider_item_title">
                      <a>
                      为保证旅客顺利购票、轻松出行，本网站提供以下指南，来解决用户的常见问题。<br>
（一）车票<br>
 1.如何购买优待（惠）票？<br>
   购买儿童票、学生票、残疾军人（含伤残人民警察）优待票、老人专用票额车票时，要符合规定的优惠（待）条件，并请提供相关凭证（证明）。<br>
 2.	车票有效期是如何规定的？<br>
 旅客购票后，请按票面载明的乘车日期、车次乘车。直达票当日当次有效，中途上（下）车未乘区间失效。通票的有效期按乘车里程计算：1000千米为2日，超过1000千米的，每增加1000千米增加1日，不足1000千米的尾数按1日计算；自指定乘车日起至有效期最后一日的24时止。<br>
 3.	什么是实名制车票？<br>
 为了确保旅客运输安全有序，铁路运输企业依照国家有关规定实行了车票实名制管理。车票实名制的实行范围、售票及验证检票方式以车站公告为准。购买实名制车票时，请提供乘车人的有效身份证件。<br>
 4.	实行车票实名制时可以使用哪些身份证件？<br>
 汽车运输企业实行车票实名制时，请凭乘车人有效身份证件原件或复印件购买车票，但免费乘车的儿童及持儿童票的儿童除外。<br>
                      
                      </a>
                    </div>
                    
                  </div>
                </div>
              </div>
            </div>
          </div>

        
        </div>

        <!-- Slider Item -->
        <div class="owl-item">
          <div class="home_slider_background" style="background-image:url(images/home_slider.jpg)"></div>
		<div class="header">
    <nav class="navbar navbar-default">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
            <h1><a  href="#">长途汽车购票系统</a></h1>
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

          <div class="home_slider_content_container">
            <div class="container">
              <div class="row">
                <div class="col">
                  <div class="home_slider_content">
                    <div class="home_slider_item_category trans_200"><a href="#" class="trans_200">购票指南</a></div>
                    <div class="home_slider_item_title">
                      <a >
                      （二）特殊旅客服务<br>
1.	儿童可以单独乘车吗？<br>
依据合同法有关规定，儿童原则上不能单独乘车，请与具备完全民事行为能力的成年人同行。<br>
2.	儿童如何购买车票？<br>
一名成年人旅客可以免费携带一名身高不足1.2米的儿童。如果身高不足1.2米的儿童超过一名时，一名儿童免费，其他儿童请购买儿童票。儿童身高为1.2～1.5米的，请购买儿童票；超过1.5米的，请购买全价座票。<br>
3.	哪些学生可以购买学生票？<br>
购买学生票要符合以下条件：<br>
     （1）在国家教育主管部门批准有学历教育资格的普通大、专院校（含民办大学、军事院校），中等专业学校、技工学校和中、小学就读，没有工资收入的学生、研究生。<br>
     （2）家庭居住地（父亲或母亲之中任何一方居住地）和学校所在地不在同一城市。<br>
     （3）大中专学生凭附有加盖院校公章的减价优待凭证、学生火车票优惠卡和经学校注册的学生证，新生凭学校录取通知书，毕业生凭学校书面证明；小学生凭学校书面证明。<br>
     
                      
                      </a>
                    </div>
                    
                  </div>
                </div>
              </div>
            </div>
          </div>

        
</div>

        <!-- Slider Item -->
        <div class="owl-item">
          <div class="home_slider_background" style="background-image:url(images/home_slider.jpg)"></div>
		<div class="header">
    <nav class="navbar navbar-default">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
            <h1><a  href="#">长途汽车购票系统</a></h1>
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

          <div class="home_slider_content_container">
            <div class="container">
              <div class="row">
                <div class="col">
                  <div class="home_slider_content">
                    <div class="home_slider_item_category trans_200"><a href="category.html" class="trans_200">购票指南</a></div>
                    <div class="home_slider_item_title">
                      <a >
                     下列情况不能发售学生票：<br>
     （1）学校所在地有学生父或母其中一方时；<br>
     （2）学生因休学、复学、转学、退学时；<br>
     （3）学生往返于学校与实习地点时；<br>
     （4）学生证未按时办理学校注册的；<br>
     （5）学生证优惠乘车区间更改但未加盖学校公章的；<br>
  4.什么时候可以购买学生票？<br>
学生票乘车时间限为每年的暑假6月1日至9月30日、寒假12月1日至3月31日。<br>

                      </a>
                    </div>
                    
                  </div>
                </div>
              </div>
            </div>
          </div>

        </div>

      </div>

      <div class="custom_nav_container home_slider_nav_container">
        <div class="custom_prev custom_prev_home_slider">
          <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
             width="7px" height="12px" viewBox="0 0 7 12" enable-background="new 0 0 7 12" xml:space="preserve">
            <polyline fill="#FFFFFF" points="0,5.61 5.609,0 7,0 7,1.438 2.438,6 7,10.563 7,12 5.609,12 -0.002,6.39 "/>
          </svg>
        </div>
            <ul id="custom_dots" class="custom_dots custom_dots_home_slider">
          <li class="custom_dot custom_dot_home_slider active"><span></span></li>
          <li class="custom_dot custom_dot_home_slider"><span></span></li>
          <li class="custom_dot custom_dot_home_slider"><span></span></li>
        </ul>
        <div class="custom_next custom_next_home_slider">
          <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
             width="7px" height="12px" viewBox="0 0 7 12" enable-background="new 0 0 7 12" xml:space="preserve">
            <polyline fill="#FFFFFF" points="6.998,6.39 1.389,12 -0.002,12 -0.002,10.562 4.561,6 -0.002,1.438 -0.002,0 1.389,0 7,5.61 "/>
          </svg>
        </div>
      </div>

    </div>
  </div>

  <!-- Footer -->

  
</div>

<script src="js/jquery-3.2.1.min.js"></script>
<script src="styles/bootstrap4/popper.js"></script>
<script src="styles/bootstrap4/bootstrap.min.js"></script>
<script src="plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
<script src="plugins/jquery.mb.YTPlayer-3.1.12/jquery.mb.YTPlayer.js"></script>
<script src="plugins/easing/easing.js"></script>
<script src="plugins/masonry/masonry.js"></script>
<script src="plugins/masonry/images_loaded.js"></script>
<script src="js/custom.js"></script>
</body>
</html>

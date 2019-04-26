<%@ page language="java" import="java.util.*,entity.User,entity.Passenger,dao.PassengerDao,dao.PassengerDaoImpl" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>Home</title>
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
    function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //for-mobile-apps -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" media="all">
<link href="css/main.css" rel="stylesheet" type="text/css" />
<!--web-fonts-->
<link href="http://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet">
<link href="http://fonts.googleapis.com/css?family=Lato:300,400,700" rel="stylesheet">
<script src="jquery/jquery-1.10.2.js" type="text/javascript"></script>
<script src="bootstrap3/js/bootstrap.js" type="text/javascript"></script>
<script src="assets/js/bootstrap-datepicker.js"></script>
<!--//web-fonts-->
<!--//fonts-->
</head>

<body>
<div class="banner-w3layouts1" id="home"><div class="header">
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
  
  
    <!--//Top-Bar-->
<div class="login">
    
   <form action="UpdatePersonInfoServlet" method="post">
    <div class="input">
      <div class="log">
        <div class="name">
          <label>ID</label><input type="text" class="text" id="value_1" placeholder="身份证号" name="id" disabled="disabled" 
          value="<% 
          User user = (User) (request.getSession().getAttribute("user")); 
          System.out.println(user);
          String pid = user.getPid();
          PassengerDaoImpl pd = new PassengerDaoImpl();
          Passenger passenger = pd.queryPassengerById(pid);
          out.println(passenger.getPid());%>" tabindex="1">
        </div>
        <div class="name">
          <label>姓名</label><input type="text" class="text" id="value_1" placeholder="姓名" name="name" disabled="disabled" value="<%=passenger.getName() %>" tabindex="1">
        </div>
        <div class="name">
          <label>用户名</label><input type="text" class="text" id="value_1" placeholder="用户名" name="uname" disabled="disabled" value="<%=user.getUname() %>" tabindex="1">
        </div>
        <div class="name">
          <label>手机</label><input type="text" class="text" id="value_1" value="<%=user.getPhone() %>" placeholder="手机" name="phone" tabindex="1">
        </div>
        <div class="name">
          <label>邮箱</label><input type="text" class="text" id="value_1" value="<%=user.getMail() %>" placeholder="邮箱" name="email" tabindex="1">
        </div>
    <div class="name">
      <label>类型</label>
      <select class="text" id="value_1" tabindex="1" name = "type">
        <option>学生</option>
        <option>老人</option>
        <option>儿童</option>
        <option>成人</option>
        <option>军人</option>
      </select>
        </div>
        <div class="pwd">
          <label>密码</label><input type="password" class="text" id="value_2" placeholder="密码" name="password" tabindex="2">
          <input type="submit" class="submit" tabindex="3" value="修改">
          <div class="check"></div>
        </div>
        <div class="tip"></div>
      </div>
    </div>
    </form>
  
    <div class="air-balloon ab-1 png"></div>
  <div class="air-balloon ab-2 png"></div>
    
</div>


  <div class="copy" class="footer">
    <p>Copyright &copy; 2018.louiewang <a href="https://louieCrusher.github.io/" target="_blank" title="联系我">Crusher</a> </p>
  </div></div>
    <!--Top-Bar-->
  


<!-- js -->
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<!-- jarallax-js -->
      <script src="js/jarallax.js"></script>
      <script src="js/SmoothScroll.min.js"></script>
      <script type="text/javascript">
        /* init Jarallax */
        $('.jarallax').jarallax({
          speed: 0.5,
          imgWidth: 1366,
          imgHeight: 768
        })
      </script>
<!-- //jarallax-js -->
          <!--banner Slider starts Here-->
            <script src="js/responsiveslides.min.js"></script>
              <script>
                // You can also use "$(window).load(function() {"
                $(function () {
                  // Slideshow 4
                  $("#slider3").responsiveSlides({
                  auto: true,
                  pager:true,
                  nav:false,
                  speed: 500,
                  namespace: "callbacks",
                  before: function () {
                    $('.events').append("<li>before event fired.</li>");
                  },
                  after: function () {
                    $('.events').append("<li>after event fired.</li>");
                  }
                  });
              
                });
               </script>

              <!--banner Slider starts Here-->


<!--light-box-files -->
<script src="js/modernizr.custom.js"></script>
<script src="js/jquery.chocolat.js"></script>
<!--//light-box-files -->
    <script type="text/javascript">
    $(function() {
      $('.gallery a').Chocolat();
    });
    </script>
<!-- //js -->
<!-- start-smoth-scrolling -->
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
<script type="text/javascript">
  jQuery(document).ready(function($) {
    $(".scroll").click(function(event){   
      event.preventDefault();
      $('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
    });
  });
</script>
<!-- start-smoth-scrolling -->
<!--//footer-section-->
<!-- Starts-Number-Scroller-Animation-JavaScript -->    
<script type="text/javascript" src="js/numscroller-1.0.js"></script>
<!-- //Starts-Number-Scroller-Animation-JavaScript -->
<!-- smooth scrolling -->
  <script type="text/javascript">
    $(document).ready(function() {
    /*
      var defaults = {
      containerID: 'toTop', // fading element id
      containerHoverID: 'toTopHover', // fading element hover id
      scrollSpeed: 1200,
      easingType: 'linear' 
      };
    */                
    $().UItoTop({ easingType: 'easeOutQuart' });
    });
  </script>
  <a href="#" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>
<!-- //smooth scrolling -->


<script type="text/javascript" src="js/bootstrap-3.1.1.min.js"></script>
<script type="text/javascript" src="js/jQuery.js"></script>
<script type="text/javascript" src="js/fun.base.js"></script>
<script type="text/javascript" src="js/script.js"></script>
</body>
</html>

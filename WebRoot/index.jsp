<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>首页</title>
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<!--  <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>-->
<!-- //for-mobile-apps -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" media="all">
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
<div class="banner-w3layouts" id="home">
		<!--Top-Bar-->
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
					<div class="top-nav-text">
						<div class="nav-contact-w3ls"><span class="glyphicon glyphicon glyphicon-phone" aria-hidden="true"></span><p>Call us now <br> <span class="call">15178474877</span></p></div> 
						<a class="page-scroll" href="#myModal2" data-toggle="modal" data-hover="LOGIN">用户登录</a>
						
						<a class="page-scroll" href="#myModal3" data-toggle="modal" data-hover="LOGIN">注册</a>
						<a class="page-scroll" href="#myModal1" data-toggle="modal" data-hover="LOGIN">管理员登录</a>
					</div>
					<!-- navbar-header -->
					<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav navbar-right">
							<li><a onclick="window.location = 'index.jsp'" class="hvr-underline-from-center active scroll">首页</a></li>
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
			<!-- modal -->
			<div class="modal about-modal w3-agileits fade" id="myModal1" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>						
				</div> 
				
				<div class="modal-body login-page "><!-- login-page -->     
									<div class="login-top sign-top">
										<div class="agileits-login">
										<h5>登录</h5>
										<form action="ManagerLoginServlet" method="post">
											<input type="text" class="email" name="Email" placeholder="用户名" required=""/>
											<input type="password" class="password" name="Password" placeholder="密码" required=""/>
											<div class="wthree-text"> 
												<ul> 
													<li>
														<label class="anim">
															<input type="checkbox" class="checkbox">
															<span> 记住密码</span> 
														</label> 
													</li>
													<li> <a href="#">忘记密码</a> </li>
												</ul>
												<div class="clearfix"> </div>
											</div>  
											<div class="w3ls-submit"> 
												<input type="submit" value="LOGIN">  	
											</div>	
										</form>

										</div>  
									</div>
						</div>  
					
				</div> <!-- //login-page -->
			</div>
		</div>
	<div class="modal about-modal w3-agileits fade" id="myModal2" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>						
				</div> 
				
				<div class="modal-body login-page "><!-- login-page -->     
									<div class="login-top sign-top">
										<div class="agileits-login">
										<h5>登录</h5>
										<form action="UserLoginServlet" method="post">
											<input type="text" class="email" name="Email" placeholder="用户名" required=""/>
											<input type="password" class="password" name="Password" placeholder="密码" required=""/>
											<div class="wthree-text"> 
												<ul> 
													<li>
														<label class="anim">
															<input type="checkbox" class="checkbox">
															<span> 记住密码</span> 
														</label> 
													</li>
													<li> <a href="#">忘记密码</a> </li>
												</ul>
												<div class="clearfix"> </div>
											</div>  
											<div class="w3ls-submit"> 
												<input type="submit" value="LOGIN">  	
											</div>	
										</form>

										</div>  
									</div>
						</div>  
					
				</div> <!-- //login-page -->
			</div>
		</div>
	<!-- //modal --> 
	<!-- modal -->
	<div class="modal about-modal w3-agileits fade" id="myModal3" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>						
				</div> 
				<div class="modal-body login-page "><!-- login-page -->     
									<div class="login-top sign-top">
										<div class="agileits-login">
										<h5>注册</h5>
										<form action="UserRegisterServlet" method="post">
											<input type="text" name="Username" placeholder="用户名" required=""/>
											<input type="email"  name="Email" placeholder="邮箱" required=""/>
											<input type="password" name="Password" placeholder="密码" required=""/>
											<input type="text" name="Phone" placeholder="电话" required=""/>
											<input type="text" name="PersonId" placeholder="证件号码" required="" />
											<input type="text" name="Name" placeholder="姓名" required=""/>

											<select name = "passenger_type">
												<option>学生</option>
												<option>老人</option>
												<option>儿童</option>
												<option>成人</option>
												<option>军人</option>
											</select>
											<div class="wthree-text"> 
												<ul> 
													<li>
														<label class="anim">
															<input type="checkbox" class="checkbox">
															<span> 我接受使用协议</span> 
														</label> 
													</li>
												</ul>
												<div class="clearfix"> </div>
											</div>  
											<div class="w3ls-submit"> 
												<input type="submit" value="注册">  	
											</div>	
										</form>

										</div>  
									</div>
						</div>  
				</div> <!-- //login-page -->
			</div>
		</div>
	<!-- //modal --> 
<!--banner-->
		<!--Slider-->
			<div class="w3l_banner_info">
				<div class="col-md-7 slider">
					<div class="callbacks_container">
								<ul class="rslides" id="slider3">
									<li>
										<div class="slider_banner_info">
											 <h4>欢迎使用本系统</h4>
											<p>请先登录或注册后使用</p>
										</div>

									</li>
									<li>
										<div class="slider_banner_info">
											<h4>迎接春运</h4>
											<p>各部门已做好准备应对即将到来的春运</p>
										</div>

									</li>
									<li>
										<div class="slider_banner_info">
											<h4>温馨提示</h4>
											<p>部分车次因受调图影响，暂不对外发售，暂时无法集中办理。</p>
										</div>

									</li>
									<li>
										<div class="slider_banner_info">
											<h4>冬季优惠</h4>
											<p>我们对购票设置了优惠</p>
										</div>

									</li>
								</ul>
					</div>
				</div>
				<div class="col-md-5 banner-form-agileinfo">
					<form action="QueryTicketServlet" method="post">
						<select class="form-control option-w3ls" name = "source">
								<option>始发地</option>
								<option>天津</option>
								<option>北京</option>
								<option>呼和浩特</option>
								<option>南京</option>
								<option>成都</option>
								<option>大理</option>
							</select>
						<select class="form-control option-w3ls" name = "dest">
								<option>目的地</option>
								<option>天津</option>
								<option>北京</option>
								<option>呼和浩特</option>
								<option>南京</option>
								<option>成都</option>
								<option>大理</option>
							</select>
							
        		      		<input class="datepicker form-control" type="text" name = "travel_time"/>
							
							<script type="text/javascript">
	 							$('.datepicker').datepicker({
    	 						weekStart:1,
    	 						color: 'red'
	 							});
							</script>

						<input type="submit" class="hvr-shutter-in-vertical" value="查询">  	
					</form>
				</div>
		</div>
			<!--//Slider-->
			<div class="clearfix"></div>
						</div>
		

	<div class="copy">
		<p>Copyright &copy; 2018.louiewang <a href="https://louieCrusher.github.io/" target="_blank" title="联系我">Crusher</a> </p>
	</div>
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
<link rel="stylesheet" href="css/chocolat.css" type="text/css" media="screen">
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
</body>
</html>

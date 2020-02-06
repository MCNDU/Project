<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Project._00_System.Login1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>論文審查系統-登入</title>	
	<link rel="icon" type="image/png" href="../images/icons/favicon.ico"/>
	<link rel="stylesheet" type="text/css" href="../css_1/bootstrap.min.css"/>
	<link rel="stylesheet" type="text/css" href="../css_1/font-awesome.min.css"/>
	<link rel="stylesheet" type="text/css" href="../css_1/animate.css"/>	
	<link rel="stylesheet" type="text/css" href="../css_1/hamburgers.min.css"/>
	<link rel="stylesheet" type="text/css" href="../css_1/select2.min.css"/>
	<link rel="stylesheet" type="text/css" href="../css_1/util.css"/>
	<link rel="stylesheet" type="text/css" href="../css_1/main.css"/>
</head>
    <!--===============================================================================================-->
<body>
    
       <div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<div class="login100-pic js-tilt">
					<img src="../Image/img-01.png" alt="IMG" />
				</div>
				

				<form class="login100-form validate-form" method="post" runat="server" enctype="application/x-www-form-urlencoded">
					<span class="login100-form-title">
						論文審查系統登入
					</span>
					<div class="wrap-input100 validate-input" data-validate = "Valid account is required: 1090630xxx"> 
						<input class="input100" type="text" name="account" placeholder="帳號" id="Account_IPT" runat="server"/>  
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-envelope" aria-hidden="true"></i>
						</span>
					</div>

					<div class="wrap-input100 validate-input" data-validate = "Password is required">
						<input class="input100" type="password" name="password" placeholder="密碼" id="Password_IPT" runat="server"/> 
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-lock" aria-hidden="true"></i>
						</span>
					</div>
					<asp:Label ID="Alert_LB" runat="server" Text=""></asp:Label>
					<div class="container-login100-form-btn">
						<button class="login100-form-btn" onserverclick ="BtnLogin_Click" id="Login_BTN" type="button" runat="server" value="Submit">
							登入</button>
					</div>

					<div class="text-center p-t-12">
						<span class="txt1">
							其他選項
						</span>
						<a class="txt2" href="#">
							更改密碼
						</a>
						<a class="txt2" href="#">
							忘記密碼
						</a>
					</div>

					<div class="text-center p-t-136">
						<a class="txt2" href="#">
							Create your Account
							<i class="fa fa-long-arrow-right m-l-5" aria-hidden="true"></i>
						</a>
					</div>
					
				</form>
			</div>
		</div>
	</div>
	
	

	
<!--===============================================================================================-->	
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="vendor/select2/select2.min.js"></script>
	<script src="vendor/tilt/tilt.jquery.min.js"></script>
	<script >
		$('.js-tilt').tilt({
			scale: 1.1
		})
	</script>
	<script src="js/main.js"></script>
</body>
</html>
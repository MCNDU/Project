<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login_Firsttime.aspx.cs" Inherits="Project._00_System.Login_Firsttime" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>碩士論文進修審查系統-首次登入</title>	
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
						碩士論文進修審查系統<br />
                    首次登入驗證
					</span>
					<div class="wrap-input100 validate-input" data-validate = "Valid account is required: 1090630xxx"> 
						<input class="input100" type="email" name="email" placeholder="電子郵件" id="Email_IPT" runat="server"/>  
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-envelope" aria-hidden="true"></i>
						</span>
					</div>

					
					<asp:Label ID="Alert_LB" runat="server" Text=""></asp:Label>
					<div class="container-login100-form-btn">
						<button class="login100-form-btn" onserverclick ="BtnEnter_Click" id="Enter_BTN" type="button" runat="server" value="Submit">
							確定</button>
					</div>

					<div class="text-center p-t-12">
						<span class="txt1" id="sent_message" aria-hidden="True" accesskey="Enter_BTN" hidden="hidden">
							郵件已發送
						</span>
						
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


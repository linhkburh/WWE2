<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="false"%>
<html class="no-js" lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>TEST</title>
    <meta name="robots" content="noindex, follow" />
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="assets/images/favicon.ico">

    <!-- CSS
	============================================ -->
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="assets/css/vendor/bootstrap.min.css">
    <!-- Font Awesome CSS -->
    <link rel="stylesheet" href="assets/css/vendor/font.awesome.min.css">
    <!-- Jquery ui CSS -->
    <link rel="stylesheet" href="assets/css/plugins/jquery-ui.min.css">

    <!-- Main Style CSS -->
    <link rel="stylesheet" href="assets/css/style.css">

</head>
<style>
	
</style>
<body>
	  <h2>Add Facebook Login to your webpage</h2>
      <p id="profile"></p>
      <p>POST THU</p>
		<form action="https://graph.facebook.com/me/feed" method="post">
		message<br />
		<input type="text" name="message" id="message"/>
		<br /><br />
		access_token<br />
		<input type="text" name="access_token" id="access_token"/>
		<input type="submit" />
		</form>
		<!-- jQuery JS -->
      <script src="assets/js/vendor/jquery-3.6.0.min.js"></script>
      <script type="text/javascript">
        <!-- Add the Facebook SDK for Javascript -->
        (function(d, s, id){
                              var js, fjs = d.getElementsByTagName(s)[0];
                              if (d.getElementById(id)) {return;}
                              js = d.createElement(s); js.id = id;
                              js.src = "https://connect.facebook.net/en_US/sdk.js";
                              fjs.parentNode.insertBefore(js, fjs);
                            }(document, 'script', 'facebook-jssdk')
        );

        window.fbAsyncInit = function() {
            <!-- Initialize the SDK with your app and the Graph API version for your app -->
            FB.init({
                      appId            : '154876981025914',
                      xfbml            : true,
                      version          : 'v19.0'
                    });
        };
		function loginFb(){
	        <!-- If you are logged in, automatically get your name and email adress, your public profile information -->
	        FB.login(function(response) {
	                  if (response.authResponse) {
	                       console.log('Welcome!  Fetching your information.... ');
	                       $('#access_token').val(response.authResponse.accessToken);
	                       FB.api('/me', {fields: 'name, email'}, function(response) {
	                           document.getElementById("profile").innerHTML = "Good to see you, " + response.name + ". i see your email address is " + response.email
	                       });
	                  } else { 
	                       <!-- If you are not logged in, the login dialog will open for you to login asking for permission to get your public profile and email -->
	                       console.log('User cancelled login or did not fully authorize.'); }
	        });
		}
		// [6] Post status lên tường nhà
        function POST() {
                var ms = $('#message').val();
                var lk = 'http://sotayyte.com';
                var acp = $('#access_token').val();
                FB.api('/me/feed', 'post', { message: ms, link: lk, access_token:acp }, function (response) {
                    if (!response || response.error) {
                        alert('Có lỗi khi POST bài: ');
                        console.log(response);
                    } else {
                        document.getElementById('postid').value = response.id;
                        alert('ĐÃ POST THÀNH CÔNG');
                    }
                });
        }
        </script>
</body>
</html>
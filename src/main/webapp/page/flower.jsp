<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="false"%>
<html class="no-js" lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>(˵ ͡° ͜ʖ ͡°˵)</title>
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
    <!-- Linear Icons CSS -->
    <link rel="stylesheet" href="assets/css/vendor/linearicons.min.css">
    <!-- Swiper CSS -->
    <link rel="stylesheet" href="assets/css/plugins/swiper-bundle.min.css">
    <!-- Animation CSS -->
    <link rel="stylesheet" href="assets/css/plugins/animate.min.css">
    <!-- Jquery ui CSS -->
    <link rel="stylesheet" href="assets/css/plugins/jquery-ui.min.css">
    <!-- Nice Select CSS -->
    <link rel="stylesheet" href="assets/css/plugins/nice-select.min.css">
    <!-- Magnific Popup -->
    <link rel="stylesheet" href="assets/css/plugins/magnific-popup.css">

    <!-- Main Style CSS -->
    <link rel="stylesheet" href="assets/css/style.css">

</head>
<style>
	input, label{
		margin-top: 8px;
	}
	label{
		font-weight: bold;
	}
	#formData{
		text-align: center;
	}
	.titleView{
		font-size: 100px;
	    font-family: "Great Vibes", cursive;
	    line-height: 150px;
	    color: #E72463;
	    text-align: center;
	}
	.float-contact {
	  position: fixed;
	  bottom: 10px;
	  right: 20px;
	  z-index: 99999;
	}
	.chat-zalo, .chat-facebook, .call-hotline {
	  display: block;
	  margin-bottom: 6px;
	  line-height: 0;
	}
</style>
<body>
<div class="float-contact">
<!-- <div class="chat-zalo">
<a href="https://zalo.me/0123456789" target="_blank"><img title="Chat Zalo" src="img/contact-button/zalo-icon.png" alt="zalo-icon" width="40" height="40" /></a>
</div> -->
<div class="chat-facebook">
<!-- <a href="https://m.me/wpcanban" target="_blank"><img title="Chat Facebook" src="images/contact-button/facebook-icon.png" alt="facebook-icon" width="40" height="40" /></a> -->
<a href="mailto:linhdq@onedot.vn" target="_blank"><img title="Contact email: linhdq@onedot.vn" src="img/contact-button/email-icon.png" alt="email-icon" width="40" height="40" /></a>
</div>
<div class="chat-facebook">
<!-- <a href="https://m.me/wpcanban" target="_blank"><img title="Chat Facebook" src="images/contact-button/facebook-icon.png" alt="facebook-icon" width="40" height="40" /></a> -->
<a href="" target="_blank"><img title="Created by Linhkburh" src="img/contact-button/hoicham.png" alt="" width="40" height="40" /></a>
</div>
<!-- <div class="call-hotline">
<a href="tel:0123456789"><img title="Call Hotline" src="img/contact-button/phone-icon.png" alt="phone-icon" width="40" height="40" /></a>
</div> -->
</div>
    <div class="intro11-slider-wrap section-2">
        <div class="intro11-slider swiper-container">
            <div class="swiper-wrapper">
                <div class="intro11-section swiper-slide slide-5 slide-bg-1 bg-position">
                    <!-- Intro Content Start -->
                    <h1 class="titleView">Trần Thị Thảo</h1>
                    <div class="intro11-content-2 text-center">
                        <form action="downloadExcel" method="post" id="formData">
							 <label>Mốc thời gian: </label>
							 <input style="padding: 5px 2px; width: 15%; margin-bottom: 10px;" type="date" id="dateData" name="dateData" required><br> 
							 <label>Danh sách người được quản lý(Tên các sheet): </label>
							 <div id="divStaff">
							 <c:forEach items="#{lstStaff}" var="item" varStatus="loop">
								<input style="padding: 5px 2px; width: 20%;" type="text" name="staffData" value="${item}"><input type="checkbox" name="arrQim" class="selectRow">
								 <c:if test="${loop.index % 2 == 1 and not loop.last}">
							        <br>
							    </c:if>
							 </c:forEach>
							 </div>
							  <input class="btn flosun-button  secondary-btn theme-color rounded-0" type="submit" value="Download">
							  <input class="btn flosun-button  secondary-btn theme-color rounded-0" type="button" value="Thêm" onclick="addStaff()">
							  <input class="btn flosun-button  secondary-btn theme-color rounded-0" type="button" value="Xóa" onclick="delStaff()">
							  <input class="btn flosun-button  secondary-btn theme-color rounded-0" type="button" value="Chọn tất cả" onclick='$(".selectRow").prop("checked", true);'>
							  <input class="btn flosun-button  secondary-btn theme-color rounded-0" type="button" value="Bỏ chọn tất cả" onclick='$(".selectRow").prop("checked", false);'>
						</form>
                    </div>
                    <!-- Intro Content End -->
                </div>
                <!-- <div class="intro11-section swiper-slide slide-6 slide-bg-1 bg-position">
                    Intro Content Start
                    <div class="intro11-content-2 text-center">
                        <h1 class="different-title">Welcome</h1>
                        <h2 class="title">2022 Flower Trend</h2>
                        <a href="product-details.html" class="btn flosun-button  secondary-btn theme-color rounded-0">Shop Collection</a>
                    </div>
                    Intro Content End
                </div> -->
            </div>
            <!-- Slider Navigation -->
            
            <!-- Slider pagination -->
            <div class="swiper-pagination"></div>
        </div>
    </div>

    <!-- Scroll to Top Start -->
    <a class="scroll-to-top" href="#">
        <i class="lnr lnr-arrow-up"></i>
    </a>
    <!-- Scroll to Top End -->

    <!-- JS
============================================ -->


    <!-- jQuery JS -->
    <script src="assets/js/vendor/jquery-3.6.0.min.js"></script>
    <!-- jQuery Migrate JS -->
    <script src="assets/js/vendor/jquery-migrate-3.3.2.min.js"></script>
    <!-- Modernizer JS -->
    <script src="assets/js/vendor/modernizr-3.7.1.min.js"></script>
    <!-- Bootstrap JS -->
    <script src="assets/js/vendor/bootstrap.bundle.min.js"></script>


    <!-- Swiper Slider JS -->
    <script src="assets/js/plugins/swiper-bundle.min.js"></script>
    <!-- nice select JS -->
    <script src="assets/js/plugins/nice-select.min.js"></script>
    <!-- Ajaxchimpt js -->
    <script src="assets/js/plugins/jquery.ajaxchimp.min.js"></script>
    <!-- Jquery Ui js -->
    <script src="assets/js/plugins/jquery-ui.min.js"></script>
    <!-- Jquery Countdown js -->
    <script src="assets/js/plugins/jquery.countdown.min.js"></script>
    <!-- jquery magnific popup js -->
    <script src="assets/js/plugins/jquery.magnific-popup.min.js"></script>

    <!-- Main JS -->
    <script src="assets/js/main.js"></script>
	<script type="text/javascript">
		    function addStaff() {
		    	var numEle = $('#divStaff .selectRow').length % 2;
		    	if(numEle==0){
		    		$('#divStaff').append('<br/><input style="padding: 5px 2px; width: 20%;" type="text" name="staffData"><input type="checkbox" name="arrQim" class="selectRow">');
		    	}else{
		    		$('#divStaff').append('<input style="padding: 5px 2px; width: 20%;" type="text" name="staffData"><input type="checkbox" name="arrQim" class="selectRow">');
		    	}
		        	
		    }
		    function delStaff() {
		    	if ($('.selectRow:checked').length==0) {
					alert('Bạn chưa chọn bản ghi!');
					return;
				}else{
					let text = "Bạn có chắc chắn muốn xóa!";
					  if (confirm(text) == true) {
						  $('.selectRow:checked').each(function() {
					            $(this).prev().remove();
					            $(this).next().remove();
					            $(this).remove();
					        });
					  }
				}
		    }
	    </script>

</body>
</html>
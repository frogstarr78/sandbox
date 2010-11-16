$(document).ready(function () {
	$("input[type=text]").addClass("subdued");	

	$("input[type=text]").focus(function () {
		if($(this).val() == this.defaultValue) {
			$(this).val('');
		}
		$(this).removeClass('subdued');
	});

	$("input[type=text]").blur(function () {
		if($(this).val() == this.defaultValue || $(this).val() == '') {
			$(this).addClass('subdued');
			$(this).val(this.defaultValue)
		}
	});


	$("#login_password_default").bind("click focus", function() { 
		$(".login_password_w_default").toggleClass("signin_hide");
		$("#password").focus();
	});

	$("#password").blur(function() {
		if($(this).val() == '') {
			$(".login_password_w_default").toggleClass("signin_hide");
		}	
	});

	$("#join_password_default").bind("click focus", function() { 
		$(".join_password_w_default").toggleClass("signin_hide");
		$("#join_password").focus();
	});

	$("#join_password").blur(function() {
		if($(this).val() == '') {
			$(".join_password_w_default").toggleClass("signin_hide");
		}	
	});

});


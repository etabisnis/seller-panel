(function($){ 
'use strict';

	// install form wizard
	$(".install_form").jQueryValForm({
		speed : 300,
		transition : 'fade',
		progressBar : false,
		showProgressText : true,
		validate : true,
		submit : "Install"
	});
})(jQuery);

// install form validation
$(function() {
	jQuery.validator.addMethod("accept", function(value, element, param) {
	  return value.match(new RegExp("." + param + "$"));
	});
});
function validateForm(formID, Obj){
	switch(formID){
		case 'install_form' :
			Obj.validate({
				errorClass: 'text-danger',
				rules: {
					hostname: {
						required: true
					},
					username: {
						required: true
					},
					password: {
						required: true
					},
					database: {
						required: true
					},
					adminname: {
						required: true,
						accept: "[a-zA-Z]+"
					},
					email: {
						required: true
					},
					syspassword: {
						required: true
					}
				},
				messages: {
					hostname: {
						required: "Enter hostname"
					},
					username: {
						required: "Enter username"
					},
					password: {
						required: "Enter password"
					},
					database: {
						required: "Enter database"
					},
					adminname: {
						required: "Enter admin name",
						accept: "Enter only letters"
					},
					email: {
						required: "Enter email address",
						email: "Enter valid email address"
					},
					syspassword: {
					 	required: "Please enter admin password"
					}
				},
				highlight: function (formID, Obj) {
	            	$(formID).closest('.form-control').addClass('is-invalid');
	            },
	            unhighlight: function (formID, Obj) {
	                $(formID).closest(".form-control").removeClass("is-invalid");
	            },
			});
		return Obj.valid();
		break;
	}
}

// Submit to install process
$(function(){
	var bn = 'input[type=submit]';
	$(bn).click(function(){ 
		if ($("#install_form").valid()){
			$("#app_now_ins").show();
			$(".app_now_ins_content").html(
				"<div class='bg-light p-3 mb-4'><h4>Application is now installing... <i class='mdi mdi-settings mdi-spin font-100-percentage'></i></h4><p class='mb-2 text-danger'>Please wait...</p></div>"
			);
			$(".welcome_status").html(
				"<p class='mb-2 text-danger'>Please don\'t close this window or press back button</p>"
			);
			$("#install_form fieldset").hide();
			$(bn).attr({
			    value:"Please Wait..."
			});
			$(bn).addClass('disabled');
		}
	});
});

// Submit to check database connection
$("#chk_submit").click(function() {
    $("#dbtestconnmsg").html("");
	$("#chk_submit").val("Please Wait...");
	$("#gif_loader").show();
	$("#gif_loader").html(
		"<div class='alert alert-info mb-4'><p class='mb-0'>Checking <i class='mdi mdi-settings mdi-spin font-100-percentage'></i></p></div>"
	);
    $.ajax({
        url: "includes/dbtest.php",
        type: "POST",
        async: true,
        data: {
            hostname:$("#hostname").val(),
            username:$("#username").val(),
            password:$("#password").val(),
            database:$("#database").val(),
        },
        success: function(data) {
        	setTimeout(function()
        	{
	            if(data==1)
	            {
	                $("#dbtestconnmsg").html("Conneceted");
	                $("#gif_loader").hide("");
	                $("#gif_loader").html("");
	                $("#chk_submit").val("Test Again");
	            }
	            else
	            {
	                $("#dbtestconnmsg").html(data);
	                $("#gif_loader").hide("");
	                $("#gif_loader").html("");
	                $("#chk_submit").val("Test Again");
	            }
			}, 5000);
        },
    });
});
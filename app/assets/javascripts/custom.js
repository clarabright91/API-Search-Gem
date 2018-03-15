/* File			:			custom.js
 * Author		:			ShivkAggarwal
 * Created Date	:			16-02-2018 (dd-mm-yyyy)
 * Purpose		:			Custom methods
 * */
$(document).ready(function() {
   window.setTimeout(function() {
      $(".alert").fadeTo(500, 0).slideUp(500, function(){
          $(this).remove(); 
      });
  }, 4000);

	$("#adv-option").click(function(){
		if( $("#search-adv-option-inner").hasClass("display-adv-search")){
			$("#search-adv-option-inner").hide("fast").removeClass("display-adv-search");
		} else {
			$("#search-adv-option-inner").addClass("display-adv-search").show("fast");
		}
	});
	// Show/hide signin/signup modals
	$('.signup-link-clr').on('click', function(){
		$('.login-popup').modal('hide');
	});	
	$('.setLogin').on('click', function(){
		$('#signup-popup').modal('hide');
	});

	$("#login_form").validate({
      rules: {
          "user[email]":{
            required: true,
            email: true
          },
          "user[password]":{
            required: true,
            minlength: 6
          }
      },
       messages: {
          "user[email]":{
            required: "Please enter email address."
          },
          "user[password]":{
            required: "Please enter password.",
            minlength: "Your password must be at least 6 characters long."
          }
       }
  })

  $('#signup_form').validate({
  		rules: {
          "user[first_name]":{
          	required: true,
          },
          "user[email]":{
            required: true,
            email: true
          },
          "user[password]":{
            required: true,
            minlength: 6
          },
          "user[password_confirmation]":{
          	required: true,
            minlength: 6,
          	//equalTo: '#user_password'
          }
      },
       messages: {
       		"user[first_name]":{
       			required: 'Please enter first name.'
       		},
          "user[email]":{
            required: "Please enter email address."
          },
        	"user[password]":{
        		required: 'Please enter password.',
            minlength: "Your password must be at least 6 characters long."
        	},
        	"user[password_confirmation]":{
        		required: 'Please enter confirm password.',
            minlength: "Your confirm password must be at least 6 characters long.",
            //equalTo: 'Please enter the same password again.'
        	}  
       }

  })


  $('#sign_in_form').validate({
    rules: {
      "user[email]":{
        required: true,
        email: true,
      },
      "user[password]":{
       required: true,
        minlength: 6 
      }
    },
    messages: {
      "user[email]":{
        required: "Please enter email address.",
        email: "Please enter valid email address.",
      },
      "user[password]":{
       required: "Please enter password.",
       minlength: "Your password must be at least 6 characters long."
      }

    }

  })

  $('#sign_up_form').validate({
    rules: {
      "user[first_name]":{
        required: true
      },
      "user[email]":{
        required: true,
        email: true,
      },
      "user[password]":{
       required: true,
        minlength: 6 
      },
      "user[password_confirmation]":{
        required: true,
        minlength: 6,
        //equalTo: '#user_password'
      }
    },
    messages: {
      "user[first_name]":{
        required: "Please enter first name."
      },
      "user[email]":{
        required: "Please enter email address.",
        email: "Please enter valid email address.",
      },
      "user[password]":{
       required: "Please enter password.",
       minlength: "Your password must be at least 6 characters long."
      },
      "user[password_confirmation]":{
        required: "Please enter confirm password.",
        minlength: "Your confirm password must be at least 6 characters long.",
        //equalTo: 'Please enter the same password again.'
      }
    }
  })

  $("#forgot_signup_form").validate({
    rules: {
        "user[email]":{
          required: true,
          email: true
        }
    },
    messages: {
      "user[email]":{
        required: "Please enter email address.",
        email: "Please enter valid email address.",
      }
    }
  })


});

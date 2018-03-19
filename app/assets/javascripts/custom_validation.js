//Validation for Active Admin Forms

 $(document).ready(function() {
  // "use strict"

  $("#new_user,#edit_user").validate({
    rules: {
      "user[first_name]":{
        required: true
      },
      "user[email]":{
        //required: true,
        required: {
        depends:function(){
            $(this).val($.trim($(this).val()));
            return true;
          }
        },
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
      },
      "user[phone_number]":{
        required: true,
        minlength: 10,
        maxlength: 15
      },
      "user[zip_code]":{
        required: true,
        number: true
      },
      "user[purpose]":{
        required: true
      },
      "user[home_price]":{
        required: true
      },
      "user[down_payment]":{
        required: true
      },
      "user[credit_score]":{
        required: true
      }
    },
     messages: {
       "user[first_name]":{
        required: "Please enter your first name.",
       },
        "user[email]":{
        required: "Please enter email address.",
        email: "Please enter valid email address.",
      },
       "user[password]":{
        required: "Please enter a password.",
        minlength: "Your password must be at least 6 characters long."
      },
      "user[password_confirmation]":{
        required: "Please enter confirm password.",
        minlength: "Your confirm password must be at least 6 characters long."
      },
      "user[phone_number]":{
        required: "Please enter phone number.",
        minlength: "Your phone number must be at least 10 characters long."
      },
      "user[zip_code]":{
        required: "Please enter zipcode."
      },
      "user[purpose]":{
        required: "Please enter purpose."
      },
      "user[home_price]":{
        required: "Please enter home price."
      },
      "user[down_payment]":{
        required: "Please enter down payment."
      },
      "user[credit_score]":{
        required: "Please enter credit score."
      }
     }
  });

  $('#new_expert, #edit_expert').validate({
    rules: {
      "expert[first_name]":{
        required: true
      },
      "expert[last_name]":{
        required: true
      },
      "expert[phone]":{
        required: true,
        minlength: 10,
        maxlength: 15
      },
      "expert[email]":{
        required: true,
        email: true
      },
      "expert[loan_type]":{
        required: true
      },
      "expert[license_number]":{
        required: true
      },
      "expert[specialty]":{
        required: true
      },
      "expert[website]":{
        required: true
      }

    },
     messages: {
        "expert[first_name]":{
          required: 'Please enter first name.'
        },
        "expert[last_name]":{
          required: 'Please enter last name.'
        },
        "expert[phone]":{
          required: 'Please enter phone number.'
        },
        "expert[email]":{
          required: 'Please enter email address.'
        },
        "expert[loan_type]":{
          required: "Please select loan type."
        },
        "expert[license_number]":{
            required: "Please enter license number."
          },
          "expert[specialty]":{
            required: "Please enter specialty."
          },
          "expert[website]":{
            required: "Please enter website."
          }
     }
  })

$('#new_admin_user, #edit_admin_user').validate({
    rules: {
      "admin_user[email]":{
        required: true,
        email: true
      },
      "admin_user[password]":{
        required: true,
        minlength: 6
      },
      "admin_user[password_confirmation]":{
        required: true,
        minlength: 6
      }
    },
    messages: {
      "admin_user[email]":{
        required: "Please enter email."
      },
      "admin_user[password]":{
        required: "Please enter password.",
        minlength: 6
      },
      "admin_user[password_confirmation]":{
        required: "Please enter confirm password.",
        minlength: "Your password must be at least 6 characters long."
      }
    }
  })


  $('#import_csv').validate({
    rules: {
      "dump[file]":{
        required: true,
        extension: "csv"
      },
      "model":{
        required: true
      }
    },
    messages: {
      "dump[file]":{
        required: "Please select a csv file.",
        extension: "Please select a .csv file"
      },
      "model":{
        required: "Please select a type."
      }
    }
  })

  $('#new_loan_officer, #edit_loan_officer').validate({
    rules: {
      "loan_officer[first]":{
        required: true
      },
      "loan_officer[title]":{
        required: true
      },
      "loan_officer[company]":{
        required: true
      },
      "loan_officer[address]":{
        required: true
      },
      "loan_officer[city]":{
        required: true
      },
      "loan_officer[zip]":{
        required: true
      },
      "loan_officer[county]":{
        required: true
      },
      "loan_officer[phone1]":{
        required: true
      },
      "loan_officer[website]":{
        required: true
      },
      "loan_officer[email]":{
        required: true,
        email: true
      },
      "loan_officer[latitude]":{
        required: true
      },
      "loan_officer[longitude]":{
        required: true
      }
    },
    messages: {
      "loan_officer[first]":{
        required: "Please enter first."
      },
      "loan_officer[title]":{
        required: "Please enter title."
      },
      "loan_officer[company]":{
        required: "Please enter company."
      },
      "loan_officer[address]":{
        required: "Please enter address."
      },
      "loan_officer[city]":{
        required: "Please enter city."
      },
      "loan_officer[zip]":{
        required: "Please enter zip."
      },
      "loan_officer[county]":{
        required: "Please enter county."
      },
      "loan_officer[phone1]":{
        required: "Please enter phone1."
      },
      "loan_officer[website]":{
        required: "Please enter website."
      },
      "loan_officer[email]":{
        required: "Please enter email.",
        email: "Please enter valid email."
      },
      "loan_officer[latitude]":{
        required: "Please enter latitude."
      },
      "loan_officer[longitude]":{
        required: "Please enter longitude."
      }
    }
  })

  $('#new_city, #edit_city').validate({
    rules: {
      "city[city]":{
        required: true
      },
      "city[state_code]":{
        required: true
      },
      "city[zip]":{
        required: true
      },
      "city[latitude]":{
        required: true
      },
      "city[longitude]":{
        required: true
      },
      "city[county]":{
        required: true
      }
    },
    messages: {
      "city[city]":{
        required: "Please enter city."
      },
      "city[state_code]":{
        required: "Please enter state code."
      },
      "city[zip]":{
        required: "Please enter zip."
      },
      "city[latitude]":{
        required: "Please enter latitude."
      },
      "city[longitude]":{
        required: "Please enter longitude."
      },
      "city[county]":{
        required: "Please enter county."
      }
    }
  })

  $('#new_factual_mortgage_company, #edit_factual_mortgage_company').validate({
    rules: {
      "factual_mortgage_company[factual_id]":{
        required: true
      },
      "factual_mortgage_company[name]":{
        required: true
      },
      "factual_mortgage_company[address]":{
        required: true
      },
      "factual_mortgage_company[city]":{
        required: true
      },
      "factual_mortgage_company[state]":{
        required: true
      },
      "factual_mortgage_company[zip]":{
        required: true
      },
      "factual_mortgage_company[country]":{
        required: true
      },
      "factual_mortgage_company[latitude]":{
        required: true
      },
      "factual_mortgage_company[longitude]":{
        required: true
      },
      "factual_mortgage_company[phone]":{
        required: true
      },
      "factual_mortgage_company[email]":{
        email: true
      },
    },
    messages: {
      "factual_mortgage_company[factual_id]":{
        required: "Please enter factual."
      },
      "factual_mortgage_company[name]":{
        required: "Please enter name."
      },
      "factual_mortgage_company[address]":{
        required: "Please enter address."
      },
      "factual_mortgage_company[city]":{
        required: "Please enter city."
      },
      "factual_mortgage_company[state]":{
        required: "Please enter state."
      },
      "factual_mortgage_company[zip]":{
        required: "Please enter zip."
      },
      "factual_mortgage_company[country]":{
        required: "Please enter country."
      },
      "factual_mortgage_company[latitude]":{
        required: "Please enter latitude."
      },
      "factual_mortgage_company[longitude]":{
        required: "Please enter longitude."
      },
      "factual_mortgage_company[phone]":{
        required: "Please enter phone."
      },
      "factual_mortgage_company[email]":{
        email: "Please enter valid email."
      },
    }
  })

$('#new_institution,#edit_institution').validate({
  rules: {
    "institution[stname]":{
      required: true
    },
    "institution[cert]":{
      required: true
    },
    "institution[docket]":{
      required: true
    },
    "institution[active]":{
      required: true
    },
    "institution[address]":{
      required: true
    },
    "institution[asset]":{
      required: true
    },
    "institution[bkclass]":{
      required: true
    },
    "institution[changec1]":{
      required: true
    },
    "institution[changec2]":{
      required: true
    },
    "institution[changec3]":{
      required: true
    },
    "institution[changec4]":{
      required: true
    },
    "institution[changec5]":{
      required: true
    },
    "institution[charter]":{
      required: true
    },
    "institution[chrtagnt]":{
      required: true
    },
    "institution[conserve]":{
      required: true
    },
    "institution[city]":{
      required: true
    },
    "institution[clcode]":{
      required: true
    },
    "institution[cmsa_no]":{
      required: true
    },
    "institution[county]":{
      required: true
    },
    "institution[dateupdt]":{
      required: true
    },
    "institution[denovo]":{
      required: true
    },
    "institution[dep]":{
      required: true
    },
    "institution[effdate]":{
      required: true
    },
    "institution[endefymd]":{
      required: true
    },
    "institution[estymd]":{
      required: true
    },
    "institution[fdicdbs]":{
      required: true
    },
    "institution[fdicregn]":{
      required: true
    },
    "institution[fdicsupv]":{
      required :true
    },
    "institution[fed]":{
      required: true
    },
    "institution[fed_rssd]":{
      required: true
    },
    "institution[fedchrtr]":{
      required :true
    },
    "institution[fldoff]":{
      required: true
    },
    "institution[iba]":{
      required: true
    },
    "institution[inactive]":{
      required: true
    },
    "institution[insagnt1]":{
      required: true
    },
    "institution[insdate]":{
      required: true
    },
    "institution[instcrcd]":{
      required: true
    },
    "institution[insbif]":{
      required: true
    },
    "institution[inscoml]":{
      required: true
    },
    "institution[insdif]":{
      required: true
    },
    "institution[insfdic]":{
      required: true
    },
    "institution[inssaif]":{
      required: true
    },
    "institution[inssave]":{
      required: true
    },
    "institution[msa_no]":{
      required: true
    },
    "institution[name]":{
      required: true
    },
    "institution[newcert]":{
      required: true
    },
    "institution[oakar]":{
      required: true
    },
    "institution[otsdist]":{
      required: true
    },
    "institution[otsregnm]":{
      required: true
    },
    "institution[procdate]":{
      required: true
    },
    "institution[qbprcoml]":{
      required: true
    },
    "institution[regagnt]":{
      required: true
    },
    "institution[repdte]":{
      required: true
    },
    "institution[risdate]":{
      required: true
    },
    "institution[stchrtr]":{
      required: true
    },
    "institution[rundate]":{
      required: true
    },
    "institution[sasser]":{
      required: true
    },
    "institution[law_sasser_flg]":{
      required: true
    },
    "institution[stalp]":{
      required: true
    },
    "institution[stcnty]":{
      required: true
    },
    "institution[stnum]": {
      required: true
    },
    "institution[zip]":{
      required: true
    },
    "institution[suprv_fd]":{
      required: true
    },
    "institution[occdist]":{
      required: true
    },
    "institution[uninum]":{
      required: true
    },
    "institution[ultcert]":{
      required: true
    },
    "institution[offices]":{
      required: true
    },
    "institution[csa_flg]":{
      required: true
    },
    "institution[cbsa_no]":{
      required: true
    },
    "institution[cbsa_metro]":{
      required: true
    },
    "institution[cbsa_metro_flg]":{
      required: true
    },
    "institution[cbsa_micro_flg]":{
      required: true
    },
    "institution[cbsa_div_no]":{
      required: true
    },
    "institution[cbsa_div_flg]":{
      required: true
    }
  },
  messages: {
    "institution[stname]":{
      required: "Please enter stname."
    },
    "institution[cert]":{
      required: "Please enter cert."
    },
    "institution[docket]":{
      required: "Please enter docket."
    },
    "institution[active]":{
      required: "Please enter active."
    },
    "institution[address]":{
      required: "Please enter address."
    },
    "institution[asset]":{
      required: "Please enter asset."
    },
    "institution[bkclass]":{
      required: "Please enter bkclass."
    },
    "institution[changec1]":{
      required: "Please enter changec1."
    },
    "institution[changec2]":{
      required: "Please enter changec2."
    },
    "institution[changec3]":{
      required: "Please enter changec3."
    },
    "institution[changec4]":{
      required: "Please enter changec4."
    },
    "institution[changec5]":{
      required: "Please enter changec5."
    },
    "institution[charter]":{
      required: "Please enter charter."
    },
    "institution[chrtagnt]":{
      required: "Please enter chrtagnt."
    },
    "institution[conserve]":{
      required: "Please enter conserve."
    },
    "institution[city]":{
      required: "Please enter city."
    },
    "institution[clcode]":{
      required: "Please enter clcode."
    },
    "institution[cmsa_no]":{
      required: "Please enter cmsa_no ."
    },
    "institution[county]":{
      required: "Please enter county."
    },
    "institution[dateupdt]":{
      required: "Please enter dateupdt."
    },
    "institution[denovo]":{
      required: "Please enter denovo."
    },
    "institution[dep]":{
      required: "Please enter dep."
    },
    "institution[effdate]":{
      required: "Please enter effdate."
    },
    "institution[endefymd]":{
      required: "Please enter endefymd."
    },
    "institution[estymd]":{
      required: "Please enter estymd."
    },
    "institution[fdicdbs]":{
      required: "Please enter fdicdbs."
    },
    "institution[fdicregn]":{
      required: "Please enter fdicregn."
    },
    "institution[fdicsupv]":{
      required: "Please enter fdicsupv."
    },
    "institution[fed]":{
      required: "Please enter fed."
    },
    "institution[fed_rssd]":{
      required: "Please enter fed_rssd."
    },
    "institution[fedchrtr]":{
      required: "Please enter fedchrtr."
    },
    "institution[fldoff]":{
      required: "Please enter fldoff."
    },
    "institution[iba]":{
      required: "Please enter iba."
    },
    "institution[inactive]":{
      required: "Please enter inactive."
    },
    "institution[insagnt1]":{
      required: "Please enter insagnt1."
    },
    "institution[insdate]":{
      required: "Please enter insdate."
    },
    "institution[instcrcd]":{
      required: "Please enter instcrcd."
    },
    "institution[insbif]":{
      required: "Please enter insbif."
    },
    "institution[inscoml]":{
      required: "Please enter inscoml."
    },
    "institution[insdif]":{
      required: "Please enter insdif."
    },
    "institution[insfdic]":{
      required: "Please enter insfdic."
    },
    "institution[inssaif]":{
      required: "Please enter inssaif."
    },
    "institution[inssave]":{
      required: "Please enter inssave."
    },
    "institution[msa_no]":{
      required: "Please enter msa_no."
    },
    "institution[name]":{
      required: "Please enter name."
    },
    "institution[newcert]":{
      required: "Please enter newcert."
    },
    "institution[oakar]":{
      required: "Please enter oakar."
    },
    "institution[otsdist]":{
      required: "Please enter otsdist."
    },
    "institution[otsregnm]":{
      required: "Please enter otsregnm."
    },
    "institution[procdate]":{
      required: "Please enter procdate."
    },
    "institution[qbprcoml]":{
      required: "Please enter qbprcoml."
    },
    "institution[regagnt]":{
      required: "Please enter regagnt."
    },
    "institution[repdte]":{
      required: "Please enter repdte."
    },
    "institution[risdate]":{
      required: "Please enter risdate."
    },
    "institution[stchrtr]":{
      required: "Please enter stchrtr."
    },
    "institution[rundate]":{
      required: "Please enter rundate."
    },
    "institution[sasser]":{
      required: "Please enter sasser."
    },
    "institution[law_sasser_flg]":{
      required: "Please enter law sasser flg."
    },
    "institution[stalp]":{
      required: "Please enter stalp."
    },
    "institution[stcnty]":{
      required: "Please enter stcnty."
    },
    "institution[stnum]": {
      required: "Please enter stnum."
    },
    "institution[zip]":{
      required: "Please enter zip."
    },
    "institution[suprv_fd]":{
      required: "Please enter suprv fd."
    },
    "institution[occdist]":{
      required: "Please enter occdist."
    },
    "institution[uninum]":{
      required: "Please enter uninum."
    },
    "institution[ultcert]":{
      required: "Please enter ultcert."
    },
    "institution[offices]":{
      required: "Please enter offices."
    },
    "institution[csa_flg]":{
      required: "Please enter csa flg."
    },
    "institution[cbsa_no]":{
      required: "Please enter cbsa no."
    },
    "institution[cbsa_metro]":{
      required: "Please enter cbsa metro."
    },
    "institution[cbsa_metro_flg]":{
      required: "Please enter cbsa metro flg."
    },
    "institution[cbsa_micro_flg]":{
      required: "Please enter cbsa micro flg."
    },
    "institution[cbsa_div_no]":{
      required: "Please enter cbsa div no."
    },
    "institution[cbsa_div_flg]":{
      required: "Please enter cbsa div flg."
    },
  }
})

});

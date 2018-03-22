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

  $('#new_cms_page,#edit_cms_page').validate({
    rules: {
      "cms_page[page_name]":{
        required: true
      },
      "cms_page[page_slug]":{
        required: true
      }
    },
    messages: {
      "cms_page[page_name]":{
        required: "Please enter page name."
      },
      "cms_page[page_slug]":{
        required: "Please enter page slug."
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

$('#new_fdic_institution,#edit_fdic_institution').validate({
  rules: {
    "fdic_institution[stname]":{
      required: true
    },
    "fdic_institution[cert]":{
      required: true
    },
    "fdic_institution[docket]":{
      required: true
    },
    "fdic_institution[active]":{
      required: true
    },
    "fdic_institution[address]":{
      required: true
    },
    "fdic_institution[asset]":{
      required: true
    },
    "fdic_institution[bkclass]":{
      required: true
    },
    "fdic_institution[changec1]":{
      required: true
    },
    "fdic_institution[changec2]":{
      required: true
    },
    "fdic_institution[changec3]":{
      required: true
    },
    "fdic_institution[changec4]":{
      required: true
    },
    "fdic_institution[changec5]":{
      required: true
    },
    "fdic_institution[charter]":{
      required: true
    },
    "fdic_institution[chrtagnt]":{
      required: true
    },
    "fdic_institution[conserve]":{
      required: true
    },
    "fdic_institution[city]":{
      required: true
    },
    "fdic_institution[clcode]":{
      required: true
    },
    "fdic_institution[cmsa_no]":{
      required: true
    },
    "fdic_institution[county]":{
      required: true
    },
    "fdic_institution[dateupdt]":{
      required: true
    },
    "fdic_institution[denovo]":{
      required: true
    },
    "fdic_institution[dep]":{
      required: true
    },
    "fdic_institution[effdate]":{
      required: true
    },
    "fdic_institution[endefymd]":{
      required: true
    },
    "fdic_institution[estymd]":{
      required: true
    },
    "fdic_institution[fdicdbs]":{
      required: true
    },
    "fdic_institution[fdicregn]":{
      required: true
    },
    "fdic_institution[fdicsupv]":{
      required :true
    },
    "fdic_institution[fed]":{
      required: true
    },
    "fdic_institution[fed_rssd]":{
      required: true
    },
    "fdic_institution[fedchrtr]":{
      required :true
    },
    "fdic_institution[fldoff]":{
      required: true
    },
    "fdic_institution[iba]":{
      required: true
    },
    "fdic_institution[inactive]":{
      required: true
    },
    "fdic_institution[insagnt1]":{
      required: true
    },
    "fdic_institution[insdate]":{
      required: true
    },
    "fdic_institution[instcrcd]":{
      required: true
    },
    "fdic_institution[insbif]":{
      required: true
    },
    "fdic_institution[inscoml]":{
      required: true
    },
    "fdic_institution[insdif]":{
      required: true
    },
    "fdic_institution[insfdic]":{
      required: true
    },
    "fdic_institution[inssaif]":{
      required: true
    },
    "fdic_institution[inssave]":{
      required: true
    },
    "fdic_institution[msa_no]":{
      required: true
    },
    "fdic_institution[name]":{
      required: true
    },
    "fdic_institution[newcert]":{
      required: true
    },
    "fdic_institution[oakar]":{
      required: true
    },
    "fdic_institution[otsdist]":{
      required: true
    },
    "fdic_institution[otsregnm]":{
      required: true
    },
    "fdic_institution[procdate]":{
      required: true
    },
    "fdic_institution[qbprcoml]":{
      required: true
    },
    "fdic_institution[regagnt]":{
      required: true
    },
    "fdic_institution[repdte]":{
      required: true
    },
    "fdic_institution[risdate]":{
      required: true
    },
    "fdic_institution[stchrtr]":{
      required: true
    },
    "fdic_institution[rundate]":{
      required: true
    },
    "fdic_institution[sasser]":{
      required: true
    },
    "fdic_institution[law_sasser_flg]":{
      required: true
    },
    "fdic_institution[stalp]":{
      required: true
    },
    "fdic_institution[stcnty]":{
      required: true
    },
    "fdic_institution[stnum]": {
      required: true
    },
    "fdic_institution[zip]":{
      required: true
    },
    "fdic_institution[suprv_fd]":{
      required: true
    },
    "fdic_institution[occdist]":{
      required: true
    },
    "fdic_institution[uninum]":{
      required: true
    },
    "fdic_institution[ultcert]":{
      required: true
    },
    "fdic_institution[offices]":{
      required: true
    },
    "fdic_institution[csa_flg]":{
      required: true
    },
    "fdic_institution[cbsa_no]":{
      required: true
    },
    "fdic_institution[cbsa_metro]":{
      required: true
    },
    "fdic_institution[cbsa_metro_flg]":{
      required: true
    },
    "fdic_institution[cbsa_micro_flg]":{
      required: true
    },
    "fdic_institution[cbsa_div_no]":{
      required: true
    },
    "fdic_institution[cbsa_div_flg]":{
      required: true
    }
  },
  messages: {
    "fdic_institution[stname]":{
      required: "Please enter stname."
    },
    "fdic_institution[cert]":{
      required: "Please enter cert."
    },
    "fdic_institution[docket]":{
      required: "Please enter docket."
    },
    "fdic_institution[active]":{
      required: "Please enter active."
    },
    "fdic_institution[address]":{
      required: "Please enter address."
    },
    "fdic_institution[asset]":{
      required: "Please enter asset."
    },
    "fdic_institution[bkclass]":{
      required: "Please enter bkclass."
    },
    "fdic_institution[changec1]":{
      required: "Please enter changec1."
    },
    "fdic_institution[changec2]":{
      required: "Please enter changec2."
    },
    "fdic_institution[changec3]":{
      required: "Please enter changec3."
    },
    "fdic_institution[changec4]":{
      required: "Please enter changec4."
    },
    "fdic_institution[changec5]":{
      required: "Please enter changec5."
    },
    "fdic_institution[charter]":{
      required: "Please enter charter."
    },
    "fdic_institution[chrtagnt]":{
      required: "Please enter chrtagnt."
    },
    "fdic_institution[conserve]":{
      required: "Please enter conserve."
    },
    "fdic_institution[city]":{
      required: "Please enter city."
    },
    "fdic_institution[clcode]":{
      required: "Please enter clcode."
    },
    "fdic_institution[cmsa_no]":{
      required: "Please enter cmsa_no ."
    },
    "fdic_institution[county]":{
      required: "Please enter county."
    },
    "fdic_institution[dateupdt]":{
      required: "Please enter dateupdt."
    },
    "fdic_institution[denovo]":{
      required: "Please enter denovo."
    },
    "fdic_institution[dep]":{
      required: "Please enter dep."
    },
    "fdic_institution[effdate]":{
      required: "Please enter effdate."
    },
    "fdic_institution[endefymd]":{
      required: "Please enter endefymd."
    },
    "fdic_institution[estymd]":{
      required: "Please enter estymd."
    },
    "fdic_institution[fdicdbs]":{
      required: "Please enter fdicdbs."
    },
    "fdic_institution[fdicregn]":{
      required: "Please enter fdicregn."
    },
    "fdic_institution[fdicsupv]":{
      required: "Please enter fdicsupv."
    },
    "fdic_institution[fed]":{
      required: "Please enter fed."
    },
    "fdic_institution[fed_rssd]":{
      required: "Please enter fed_rssd."
    },
    "fdic_institution[fedchrtr]":{
      required: "Please enter fedchrtr."
    },
    "fdic_institution[fldoff]":{
      required: "Please enter fldoff."
    },
    "fdic_institution[iba]":{
      required: "Please enter iba."
    },
    "fdic_institution[inactive]":{
      required: "Please enter inactive."
    },
    "fdic_institution[insagnt1]":{
      required: "Please enter insagnt1."
    },
    "fdic_institution[insdate]":{
      required: "Please enter insdate."
    },
    "fdic_institution[instcrcd]":{
      required: "Please enter instcrcd."
    },
    "fdic_institution[insbif]":{
      required: "Please enter insbif."
    },
    "fdic_institution[inscoml]":{
      required: "Please enter inscoml."
    },
    "fdic_institution[insdif]":{
      required: "Please enter insdif."
    },
    "fdic_institution[insfdic]":{
      required: "Please enter insfdic."
    },
    "fdic_institution[inssaif]":{
      required: "Please enter inssaif."
    },
    "fdic_institution[inssave]":{
      required: "Please enter inssave."
    },
    "fdic_institution[msa_no]":{
      required: "Please enter msa_no."
    },
    "fdic_institution[name]":{
      required: "Please enter name."
    },
    "fdic_institution[newcert]":{
      required: "Please enter newcert."
    },
    "fdic_institution[oakar]":{
      required: "Please enter oakar."
    },
    "fdic_institution[otsdist]":{
      required: "Please enter otsdist."
    },
    "fdic_institution[otsregnm]":{
      required: "Please enter otsregnm."
    },
    "fdic_institution[procdate]":{
      required: "Please enter procdate."
    },
    "fdic_institution[qbprcoml]":{
      required: "Please enter qbprcoml."
    },
    "fdic_institution[regagnt]":{
      required: "Please enter regagnt."
    },
    "fdic_institution[repdte]":{
      required: "Please enter repdte."
    },
    "fdic_institution[risdate]":{
      required: "Please enter risdate."
    },
    "fdic_institution[stchrtr]":{
      required: "Please enter stchrtr."
    },
    "fdic_institution[rundate]":{
      required: "Please enter rundate."
    },
    "fdic_institution[sasser]":{
      required: "Please enter sasser."
    },
    "fdic_institution[law_sasser_flg]":{
      required: "Please enter law sasser flg."
    },
    "fdic_institution[stalp]":{
      required: "Please enter stalp."
    },
    "fdic_institution[stcnty]":{
      required: "Please enter stcnty."
    },
    "fdic_institution[stnum]": {
      required: "Please enter stnum."
    },
    "fdic_institution[zip]":{
      required: "Please enter zip."
    },
    "fdic_institution[suprv_fd]":{
      required: "Please enter suprv fd."
    },
    "fdic_institution[occdist]":{
      required: "Please enter occdist."
    },
    "fdic_institution[uninum]":{
      required: "Please enter uninum."
    },
    "fdic_institution[ultcert]":{
      required: "Please enter ultcert."
    },
    "fdic_institution[offices]":{
      required: "Please enter offices."
    },
    "fdic_institution[csa_flg]":{
      required: "Please enter csa flg."
    },
    "fdic_institution[cbsa_no]":{
      required: "Please enter cbsa no."
    },
    "fdic_institution[cbsa_metro]":{
      required: "Please enter cbsa metro."
    },
    "fdic_institution[cbsa_metro_flg]":{
      required: "Please enter cbsa metro flg."
    },
    "fdic_institution[cbsa_micro_flg]":{
      required: "Please enter cbsa micro flg."
    },
    "fdic_institution[cbsa_div_no]":{
      required: "Please enter cbsa div no."
    },
    "fdic_institution[cbsa_div_flg]":{
      required: "Please enter cbsa div flg."
    },
  }
})

});

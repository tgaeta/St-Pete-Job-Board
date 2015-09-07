$(document).ready ->
  $('#applyForm').formValidation
    framework: 'bootstrap'
    icon:
      valid: 'glyphicon glyphicon-ok'
      invalid: 'glyphicon glyphicon-remove'
      validating: 'glyphicon glyphicon-refresh'
    addOns: reCaptcha2:
      element: 'captchaContainer'
      language: 'en'
      theme: 'light'
      siteKey: '6LchxQQTAAAAAFzgKQlwwvlS5vNWTvztZds3L3EV'
      timeout: 120
      message: 'The captcha is not valid'
    fields:
      'job_application[first_name]': validators: notEmpty: message: 'The first name is required'
      'job_application[last_name]': validators: notEmpty: message: 'The last name is required'
      'job_application[email]': validators: notEmpty: message: 'The email is required'
      'job_application[resume]': validators: notEmpty: message: 'The resume is required'
  return

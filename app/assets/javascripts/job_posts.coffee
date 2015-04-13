$(document).ready ->
  $('#select_tag').selectize
    maxItems: 1
    valueField: 'tag_name',
    labelField: 'tag_name',
    searchField: ['tag_name']
    options: [
      {tag_name: "Admin/Office"}
      {tag_name: "Business"}
      {tag_name: "Customer Service"}
      {tag_name: "Education"}
      {tag_name: "Engineering"}
      {tag_name: "Finance"}
      {tag_name: "Food/Beverage"}
      {tag_name: "Gengeral Labor"}
      {tag_name: "Government"}
      {tag_name: "Healthcare"}
      {tag_name: "Hospitality"}
      {tag_name: "Human Resources"}
      {tag_name: "Internet"}
      {tag_name: "Legal"}
      {tag_name: "Manufacturing"}
      {tag_name: "Marketing"}
      {tag_name: "Media"}
      {tag_name: "Nonprofit"}
      {tag_name: "Real Estate"}
      {tag_name: "Retail/Wholesale"}
      {tag_name: "Sales"}
      {tag_name: "Salon/Spa/Fitness"}
      {tag_name: "Science"}
      {tag_name: "Skilled Trades"}
      {tag_name: "Software"}
      {tag_name: "Systems/Networking"}
      {tag_name: "Tech Support"}
      {tag_name: "Transportation"}
      {tag_name: "TV/Video/Radio"}
      {tag_name: "Web Design/Development"}
      {tag_name: "Writing"}
      {tag_name: "Other"}
    ]
  tinymce.init
    selector: 'textarea'
    menubar: true
    statusbar: true
    toolbar: false
    setup: (editor) ->
      editor.on 'keyup', (e) ->
        # Revalidate the coverLetter field
        $('#tinyMCEForm').formValidation 'revalidateField', 'coverLetter'
        return
      return
  $('#tinyMCEForm').formValidation
    framework: 'bootstrap'
    excluded: [ ':disabled' ]
    feedbackIcons:
      valid: 'glyphicon glyphicon-ok'
      invalid: 'glyphicon glyphicon-remove'
      validating: 'glyphicon glyphicon-refresh'
    fields:
      fullName: validators: notEmpty: message: 'The full name is required and cannot be empty'
      coverLetter: validators: callback:
        message: 'The coverLetter must be between 5 and 200 characters long'
        callback: (value, validator, $field) ->
          # Get the plain text without HTML
          text = tinyMCE.activeEditor.getContent(format: 'text')
          text.length <= 200 and text.length >= 5
  return

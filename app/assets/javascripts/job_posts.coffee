$(document).ready ->
  tinymce.init
    selector: 'textarea'
    menubar: false
    statusbar: false
    toolbar: 'undo redo | styleselect | bold italic'
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

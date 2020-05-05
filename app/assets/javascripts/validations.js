ready = function() {
	$("#post_form_validation").validate();
	$("#sign_up_form_validation").validate();
	$("#sign_in_form_validation").validate();
}
$(document).ready(ready);
$(document).on('page:load', ready)
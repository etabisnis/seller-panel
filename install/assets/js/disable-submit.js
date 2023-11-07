// disabled button
$( document ).ready(function() {
	$('form.disable-on-submit').disableOnSubmit({
		duration: 100000,
	    buttonTemplate: '<i class="mdi mdi-settings mdi-spin"></i>',
	    submitInputText: 'Please wait...',
	});
});
jQuery(document).on('ready', function($) {
    "use strict";

    /**================================================
        TOOL TIP
    ================================================**/
    // Tooltip
    $(function () {
        $('[rel=tooltip]').tooltip(
        	{
        		trigger: "hover"
        	}
        );
    });

    /**================================================
        FORM
    ================================================**/
    // disbled enter
    $(window).keydown(function(event){
        if(event.keyCode == 13) {
          event.preventDefault();
          return false;
        }
    });

    /**================================================
        BUTTON
    ================================================**/
    $('button[type=submit]').on('click', function(){
        $(this).html('Please wait..');
        $('button[type=submit]').addClass('disabled');
    });

    /**================================================
        ALERT
    ================================================**/
    $('.alert-dismiss').fadeTo(5000, 500).slideUp(500, function(){
        $('.alert-dismiss').slideUp(500);
    });

}(jQuery)); // End jQuery
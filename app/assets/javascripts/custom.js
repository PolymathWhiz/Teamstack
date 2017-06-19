$(document).ready(function() {
    $(".country_select").select2();
});

//Override the default confirm dialog by rails
$.rails.allowAction = function(link) {
    if (link.data("confirm") == undefined) {
        return true;
    }
    $.rails.showConfirmationDialog(link);
    return false;
}

//User click confirm button
$.rails.confirmed = function(link) {
    link.data("confirm", null);
    link.trigger("click.rails");
}

//Display the confirmation dialog
$.rails.showConfirmationDialog = function(link) {
    var message = link.data("confirm");
    swal({
        title: message,
        text: "Your account and all of its related data will be permanently deleted. This action cannot be undone.",
        type: 'warning',
        confirmButtonText: 'Yes, delete account',
        confirmButtonColor: '#d9534f',
        showCancelButton: true,
    }).then(function(e) {
        $.rails.confirmed(link);
    });
};

// NProgress
$(document).on('turbolinks:click', function() {
    NProgress.start();
});

$(document).on('turbolinks:render', function() {
    NProgress.done();
    NProgress.remove();
});

// Character Counter
$(document).ready(function() {
    $("#user_bio").on('keyup paste', function() {

        var characters = $("#user_bio").val().length;
        var totalCharacters = 250;

        $("#counter").text((totalCharacters - characters) + " characters left.");
    });
});
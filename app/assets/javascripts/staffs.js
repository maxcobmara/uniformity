$(document).ready(function() {
	$('#size_select').change(function() {
        $.ajax({
		   url: "update_text",
           data: {
               item_name: $("#size_select option:selected").text()
           },
           dataType: "script"
        });
    });
});
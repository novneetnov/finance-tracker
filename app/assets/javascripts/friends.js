var init_friend_lookup = function() {

	var form_div = $('#friend-lookup-form');

	form_div.on('ajax:send', function(event, xhr){
		show_spinner();
	});

	// How is the 'data' the entire _lookup.html.erb ?
	form_div.on('ajax:success', function(event, data, status) {
		hide_spinner();
		$('#friend-lookup').replaceWith(data);
		init_friend_lookup();
	});

	form_div.on('ajax:error', function(event, xhr, status, error) {
		hide_spinner();
		$('#friend-lookup-results').replaceWith('');
		$('#friend-lookup-errors').replaceWith('Person was not found');
		init_friend_lookup();
	});

};

$(document).ready(function() {
	init_friend_lookup();
});

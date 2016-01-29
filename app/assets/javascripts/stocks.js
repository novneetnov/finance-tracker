var init_stock_lookup = function() {

	var form_div = $('#stock-lookup-form');

	form_div.on('ajax:send', function(event, xhr){
		show_spinner();
	});

	// How is the 'data' the entire _lookup.html.erb ?
	form_div.on('ajax:success', function(event, data, status) {
		hide_spinner();
		$('#stock-lookup').replaceWith(data);
		init_stock_lookup();
	});

	form_div.on('ajax:error', function(event, xhr, status, error) {
		hide_spinner();
		$('#stock-lookup-results').replaceWith('');
		$('#stock-lookup-errors').replaceWith('Stock was not found');
		init_stock_lookup();
	});

};

$(document).ready(function() {
	init_stock_lookup();
});

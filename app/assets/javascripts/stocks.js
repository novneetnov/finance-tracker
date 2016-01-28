var init_stock_lookup = function() {
	// How is the 'data' the entire _lookup.html.erb ?
	$('#stock-lookup-form').on('ajax:success', function(event, data, status) {
		$('#stock-lookup').replaceWith(data);
		init_stock_lookup();
	});

	$('#stock-lookup-form').on('ajax:error', function(event, xhr, status, error) {
		alert("hello");
		$('#stock-lookup-results').replaceWith('');
		$('#stock-lookup-errors').replaceWith('Stock was not found');
		init_stock_lookup();
	});
};

$(document).ready(function() {
	init_stock_lookup();
});

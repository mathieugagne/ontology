// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function() {
	$('#ancestor component_name').autocomplete({source: "/ajax/types"});
	$('#descendant component_name').autocomplete({source: "/ajax/types"});
	$('#predicate predicate_name').autocomplete({source: "/ajax/types"});
});

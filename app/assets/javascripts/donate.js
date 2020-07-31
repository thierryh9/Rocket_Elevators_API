$(document).ready(function(){
	$('#ex1').on('input', function(){
		$("#donate_number").text($('#ex1').val())
	})
})
$(document).ready(function(){
	$("#donate_number").text($('#ex1').val())
	$('#ex1').on('input', function(){
		$("#donate_number").text($('#ex1').val())
	})
})
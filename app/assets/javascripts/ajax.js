$(document).ready(function(){
	$('#sudoku').on('submit', function(event){
		alert('hi');
		event.preventDefault();
		var sudo_array = $('#sudoku').serializeArray();
		var new_array= []
		for (x = 2; x < sudo_array.length; x++){
			new_array[x-2] = sudo_array[x].value
		};
		$.ajax({

			type: "POST",
			url: "/",
			data: {array: new_array},
			success: function(result){
				// console.log(result);
				$('#result').html(result);
			}
		})
	})
})
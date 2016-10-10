<script src="https://code.jquery.com/jquery-1.12.4.min.js"> </script>
<script>
	$(document).ready(function(){
		
		$.ajax({
			url:"http://192.168.1.49:8082/niems/Model/user/selectAll.jsp?callback=?",
			type:"get",
			dataType:"json",
			async:false,
			success:function(data){
				alert(data);
			}
		});
	});
</script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<center>
<h1>NIEMS(Web-Service)</h1>
</center>
<div class="row">
  <div class="col-md-3"></div>
  <div class="col-md-6">
  
  
  <form class="form-horizontal" id="formLogin">
  <div class="form-group">
    <label for="inputEmail3" class="col-sm-2 control-label">User</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="inputUser" placeholder="User">
    </div>
  </div>
  <div class="form-group">
    <label for="inputPassword3" class="col-sm-2 control-label">Password</label>
    <div class="col-sm-10">
      <input type="password" class="form-control" id="inputPassword" placeholder="Password">
    </div>
  </div>
 
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <button class="btn btn-default" id="signIn">Sign in</button>
    </div>
  </div>
</form>
<center>
	<a style="display:none"  href="#" id='logOut'>Logout</a>
</center>

  
  </div>
  <div class="col-md-3"></div>
</div>


<script src="https://code.jquery.com/jquery-1.12.4.min.js"> </script>
<script>
	$(document).ready(function(){
		$("#signIn").click(function(){
			$.ajax({
				url:"/niems/login.jsp",
				type:"post",
				dataType:"json",
				data:{"user":$("#inputUser").val(),"password":$("#inputPassword").val()},
				async:false,
				success:function(data){
					
					if(data[0]=='success'){
						alert("Authentication is Successfully.");
						$("#logOut").show();
						$("#formLogin").hide();
					}else{
						alert("Access denied. \nPress contact to Administor.");
					}
				}
			});
			return false;	
		});
		
		$("#logOut").click(function(){
			
			$.ajax({
				url:"/niems/logout.jsp",
				type:"get",
				dataType:"json",
				//data:{"user":$("#inputUser").val(),"password":$("#inputPassword").val()},
				async:false,
				success:function(data){
					
					if(data[0]=='success'){
						alert("Logout is success.");
						$("#logOut").hide();
						$("#formLogin").show();
					}
				}
			});
			return false;	
			
			
		});
	});
</script>




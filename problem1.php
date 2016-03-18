<?php
	$flg = false;
   if( isset($_POST["fl_name"])) {
		$name = $_POST["fl_name"];
		$emailid = $_POST["emailid"];
		$twitter = $_POST["twtr"];
		$flg = true;
		$input = array('name' => $name,'email' => $emailid,'twitter' => $twitter);  
   }
?>
<!DOCTYPE html>
<html>
<head>
	<title>Problem 1</title>
	<meta charset="UTF-8">
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
	
	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
	<!-- Latest compiled JavaScript -->
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	
	<script type="text/javascript">
		function validateForm(){
			var eml = $('#email').val();
			var atpos = eml.indexOf("@");
			var dotpos = eml.lastIndexOf(".");
			if (atpos<1 || dotpos<atpos+2 || dotpos+2>=eml.length) {
				alert("Enter a valid email address!");
				return false;
			}else {
				return true;
			}
		}
	</script>
</head>
<body>
<?php
if ($flg){
	echo "<h4>";
	print_r($input);
	echo "</h4>";
}else{
?>
	<div class="container">
		<div class="col-lg-6">
			<form id="form1" role="form" name="form1" method="post" action="" onSubmit="return validateForm();">
			  <div class="form-group">
					<label for="text">Name:</label>
					<input type="text" class="form-control" id="name" name="fl_name" placeholder="Enter first name + last name" autofocus required>
			  </div>
			  <div class="form-group">
					<label for="email">Email:</label>
					<input type="email" class="form-control" id="email" name="emailid" placeholder="Email id" required>
			  </div>
			  <div class="form-group">
					<label for="text">Twitter:</label>
					<input type="text" class="form-control" id="twitter" name="twtr" placeholder="@twitter_handle">
			  </div>
			  <button type="submit" class="btn btn-default">Submit</button>
			</form>
		</div>
	</div>
<?php
}
?>
</body>
</html>
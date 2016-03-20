<?php
	$flg = false;
?>
<!DOCTYPE html>
<html>
<head>
<title>Problem 5</title>
	<meta charset="UTF-8">
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
	
	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
	<!-- Latest compiled JavaScript -->
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<?php
		$dbhost = 'localhost';
		$dbuser = 'root';
		$dbpassword = '';
		$conn = mysql_connect($dbhost,$dbuser,$dbpassword);
		if(!$conn){
			die('Connection error:' . mysql_error());
		}
		mysql_select_db("problem5",$conn);
		if(isset($_POST["date"])){
			$date = $_POST["date"];
			$flg = true;
			$qry = "SELECT sum(Order_Product.qty) AS 'TotalProduct', sum(Order_Product.qty * Product.price) AS 'TotalPrice' FROM Product, Order_Product, orders WHERE (orders.date='".$date."') AND (Product.SKU = Order_Product.SKU) AND (orders.order_id = Order_Product.order_id);";
			$result = mysql_query($qry,$conn);		
		}
	?>
</head>
<body>
	<?php
		if($flg){
			while($rec = mysql_fetch_assoc($result)){
				//echo json_encode($records)."<br>";
				echo "<h3>Total Products: ".$rec['TotalProduct']."<br>Total Amount: $".$rec['TotalPrice']."</h3>";
			}
		}else{
	?>
	<div class="container">
		<div class="col-lg-6">
			<form id="form1" role="form" name="form1" method="post" action="#">
			  <div class="form-group">
					<label><h2>Enter date for an order list.</h2></label>
			  </div>
			  <div class="form-group">
					<label>Enter date:</label>
					<input type="text" class="form-control" id="date" name="date" placeholder="MM/DD/YYYY">
					<p></p>
					<button type="submit" class="btn btn-info">Get Order Info.</button>
			  </div>
			</form>
		</div>
	</div>
	<?php
		}
	?>
</body>
</html>
<html>
<head>
	<title>Problem 2</title>
</head>
<body>
<?php
	$employees = array('Travis' => 29, 'John' => 30, 'Manny' => 24, 'Gabriel' => 20, 'Yogi' => 22);
	asort($employees);
	$json_string = json_encode($employees);
	print_r($json_string);
?>
</body>
</html>
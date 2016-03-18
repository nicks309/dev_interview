<html>
<head>
	<title>Problem 2</title>
</head>
<body>
<?php
	$employees = array('Travis' => 29, 'John' => 30, 'Manny' => 24, 'Gabriel' => 20, 'Yogi' => 22);
	ksort($employees);
	echo "<pre>";
	echo json_encode($employees, JSON_PRETTY_PRINT);
	echo "</pre>";
?>
</body>
</html>

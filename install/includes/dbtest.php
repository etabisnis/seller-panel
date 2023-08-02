<?php
	// post
	$hostnamepost = $_POST['hostname'];
	$usernamepost = $_POST['username'];
	$passwordpost = $_POST['password'];
	$databasepost = $_POST['database'];

	// mysqli connection
	@$conn = mysqli_connect($hostnamepost, $usernamepost, $passwordpost);

	// database connection
	@$dbconn = mysqli_select_db($conn, $databasepost);

	// check empty database
	if($conn)
	{
		$sqlCommand = "SELECT count(*) AS TOTALNUMBEROFTABLES FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = '$databasepost'";
		$query = mysqli_query($conn, $sqlCommand);
		$tablesExists = array();
		while(null!==($row = mysqli_fetch_row($query))) { $tablesExists[] = $row[0]; }
	}

	// check error
	if(!$dbconn)
	{
		echo "<div class='alert alert-danger alert-dismiss'><button type='button' class='close' data-dismiss='alert'>&times;</button>Connection error..!!  please check your connection or try again..!!</div>";
	}
	else if($tablesExists[0]>=1)
	{
		echo "<div class='alert alert-danger alert-dismiss'><button type='button' class='close' data-dismiss='alert'>&times;</button>Please choose empty database</div>";
	}
	else
	{
		echo '<div class="alert alert-success alert-dismiss">Successfully Connected</div>';
	}
?>
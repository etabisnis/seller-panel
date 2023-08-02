<?php

// Class database
class Database{

	// Function to the database and tables and fill them with the default data
	function create_database($data){

		// Connect to the database
		$con = mysqli_connect($data['hostname'],$data['username'],$data['password'],'');

		// Check for errors
		if(mysqli_connect_errno()){
			echo "Failed to connect to MySQL: " . mysqli_connect_error();
		}
		else
		{
			$query = "CREATE DATABASE IF NOT EXISTS ".$data['database'];
			mysqli_query($con,$query);
			return true;
		}

		// Close the connection
		mysqli_close($con);
	}
	
	function create_tables($data)
	{
		// Connect to the database
		$mysqli = new mysqli($data['hostname'],$data['username'],$data['password'],$data['database']);

		// Check for errors
		if(mysqli_connect_errno())
		return false;

		// Open the default SQL file
		$query = file_get_contents('assets/install.sql');

		// Execute a multi query
		$mysqli->multi_query($query);

		$mysqli->close();
		sleep(10);
        $mysql = new mysqli($data['hostname'],$data['username'],$data['password'],$data['database']);

		$mysql->query("INSERT INTO `users` (`u_username`, `u_useremail`, `u_password`, `u_userrole`, `u_loginstatus`, `u_status`) VALUES ('".$data['adminname']."','".$data['email']."','".md5($data['syspassword'])."', 'admin', '', '1')");
		
		// Close the connection
		$mysql->close();

		return true;
	}	
}
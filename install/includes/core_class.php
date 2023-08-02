<?php

// Class core
class Core {

	// Function to validate the post data
	function validate_post($data)
	{
		// Validating the hostname, the database name and the username. The password is optional.
		return !empty($data['hostname']) && !empty($data['username']) && !empty($data['database']);
	}

	// Function to show an error
	function show_message($type,$message) {
		return $message;
	}

	// write db file
	function write_config($data) {

		// Config path
		$template_path 	    = 'database/database.php';
		$db_inc_path 	    = 'database/database.inc.php';
		$output_path 	    = '../application/config/database.php';

		// Open the file
		$database_file = file_get_contents($template_path);

		// Replace database file
		$new  = str_replace("%HOSTNAME%",$data['hostname'],$database_file);
		$new  = str_replace("%USERNAME%",$data['username'],$new);
		$new  = str_replace("%PASSWORD%",$data['password'],$new);
		$new  = str_replace("%DATABASE%",$data['database'],$new);

		// Update the new database.php file
		$handle = fopen($output_path,'w+');

		// Create inc file
		$back_path = '../';
		copy($db_inc_path, $back_path.'database.inc.php');

		// Chmod the file, in case the user forgot
		@chmod($output_path,0777);

		// Verify file permissions
		if(is_writable($output_path)) {

			// Write the file
			if(fwrite($handle,$new)) {
				return true;
			}
			else
			{
				return false;
			}
		}
		else
		{
			return false;
		}
	}
}
<?php

// install path
$app_path = '../application/';
$default_config_file = '../application/config/config.php';
$default_database_file = '../application/config/database.php';
$db_dump_file = 'database/database.php';
$sql_dump_file = 'assets/install.sql';
$db_inc_file = '../database.inc.php';

// curl
function curl_installed()
{
    if(in_array('curl', get_loaded_extensions())){
        return true;
    }
    else
    {
        return false;
    }
}

// PDO
function pdo_installed(){
	if(defined('PDO::ATTR_DRIVER_NAME')){
		return true;
	}
	else
	{
		return false;
	}
}

// get tokent
$permitted_chars = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
function generate_string($input, $strength = 16) {
    $input_length = strlen($input);
    $random_string = '';
    for($i = 0; $i < $strength; $i++) {
        $random_character = $input[mt_rand(0, $input_length - 1)];
        $random_string .= $random_character;
    }
    return $random_string;
}

// check empty directory
function emptyDir($dir)
{
    if (is_dir($dir)) {
        $scn = scandir($dir);
        foreach ($scn as $files) {
            if ($files !== '.') {
                if ($files !== '..') {
                    if (!is_dir($dir . '/' . $files)) {
                        unlink($dir . '/' . $files);
                    } else {
                        emptyDir($dir . '/' . $files);
                        rmdir($dir . '/' . $files);
                    }
                }
            }
        }
    }
}
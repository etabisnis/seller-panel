<?php

	// install path
	$path = '../';
	$install = 'install';
	$dir = $path.$install;

	// include files
	require_once('database/database.inc.php');
	require_once('includes/core_class.php');
	require_once('includes/database_class.php');
	require_once('includes/functions.php');

	// check file exists
	if(file_exists($db_inc_file)){
		header('Location: install-completed.php');
	}

	// install folder delete
	if (isset($_POST['delete'])) {
		if (is_dir($dir)) {
			if(file_exists($db_inc_file))
			{
				emptyDir($dir);
				rmdir($dir);
				header('Location: '.$path.'');
			}
		}
	}

	// submit to install
	if($_SERVER['REQUEST_METHOD'] == 'POST' && $_POST) {

		// core database functions
		$core = new Core();
		$database = new Database();

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
		if(!is_writable($default_config_file))
		{
			$dbconnerror = 'Please make the config.php file writable. <br><b>Example:</b> chmod 777 - /application/config/config.php';
		}
		else if(!is_writable($default_database_file))
		{
			$dbconnerror = 'Please make the database.php file writable. <br><b>Example:</b> chmod 777 - /application/config/database.php';
		}
		else if(!$conn)
		{
			$dbconnerror = 'Database connection error..!!  please check your connection or try again..!!';
		}
		else if(!$dbconn)
		{
			$dbconnerror = '<b>'.$databasepost.'</b> database not found..!! please create your database';
		}
		else if($tablesExists[0]>=1)
		{
			$dbconnerror = 'Please choose empty database';
		}
		else
		{
			// Validate the post data
		   	if ($core->validate_post($_POST) == true)
		   	{
		   		// First create the database, then create tables, then write config file
		   		if ($database->create_database($_POST) == false) {
		   			$message = $core->show_message('error',"Unable to create database, please verify your settings");
		   		}
		   		else if ($database->create_tables($_POST) == false) {
		   			$message = $core->show_message('error',"Unable to create table's, please verify your settings.");
		   		}
		   		else if ($core->write_config($_POST) == false) {
		   			$message = $core->show_message('error',"The database configuration file could not be written, Please chmod application/config/database.php file to 777");
		   		}
		   		// If no errors
		   		if(!isset($message)) {
		   			header('Location: install-completed.php?install_completed=success');
		   		}
		   	}
		   	else
		   	{
		   		$message = $core->show_message('error','The host, username, password, and database name are required.');
		   	}
		}
	}
require_once('header.php');
?>
						<?php if (!file_exists($db_inc_file)) { if (is_dir('../install')) {  ?>
							<div class="text-center">
								<h4 class="mb-3">Welcome to <?php echo APP_TITLE; ?></h4>
								<h6 class="mb-4 text-danger welcome_status">Application not installed, make it install.</h6>
							</div>
							<form id="install_form" class="install_form val-min-h-auto disable-on-submit" method="post">
								<div id="app_now_ins" class="display-none mb-4">
									<div class="app_now_ins_content"></div>
								</div>
								<?php if(isset($dbconnerror)){ ?>
									<div class="alert alert-danger alert-dismiss">
										 <button type="button" class="close" data-dismiss="alert">&times;</button>
										<?php echo $dbconnerror; ?>
									</div>
								<?php } ?>
								<fieldset>
									<div class="bg-light p-3 mb-4">
										<h4>Step 1 / 4</h4>
										<p class="mb-0">Startup</p>
									</div>
									<h6 class="mb-4"><b>Note:</b> Press next button to complete the below steps.</h6>
								</fieldset>
								<fieldset>
									<div class="form-top">
										<div class="bg-light p-3 mb-4">
											<h4>Step 2 / 4</h4>
											<p class="mb-0">Setup Requirements</p>
										</div>
										<div class="mb-3">
											<div>
												<h5>System Information</h5>
											</div>
											<div>
												<label class="mr-3">Build Date</label>
												<label class="badge badge-secondary">11-November-2023</label>
											</div>
											<div>
												<label class="mr-3">Application Version</label>
												<?php if(APP_VERSION){ ?>
													<label class="badge badge-secondary"><?php echo APP_VERSION; ?></label>
												<?php }else{ ?>
													<label class="badge badge-danger"><?php echo 'Failed to check'; ?></label>
												<?php } ?>
											</div>
											<div>
												<label class="mr-3">Php Version</label>
												<?php if(phpversion()){ ?>
												<label class="badge badge-secondary"><?php echo 'Current PHP version: ' . phpversion(); ?></label>
												<?php }else{ ?>
												<label class="badge badge-danger"><?php echo 'Failed to check'; ?></label>
												<?php } ?>
											</div>
										</div>
										<div class="mb-3">
											<div>
												<h5>File / Permissions</h5>
											</div>
											<div>
												<label class="mr-3">Config Writable</label>
												<?php
													if(is_writable($default_config_file))
													{
														if(is_writable($default_config_file))
														{
															echo '<label class="text-success"><i class="mdi mdi-check"></i> Checked</label>';
														}
														else
														{
															echo '<label class="text-danger"><i class="mdi mdi-close"></i> Please make the config.php file writable.</label>';
															echo '<p class="text-danger"><b>Example:</b> chmod 777 - /application/config/config.php</p>';
														}
													}
													else
													{
														echo '<span class="text-danger"><i class="mdi mdi-close"></i> ../application/config/config.php file is missing.</span>';
													}
												?>
											</div>
											<div>
												<label class="mr-3">Database Writable</label>
												<?php
													if(is_writable($default_database_file))
													{
														if(is_writable($default_database_file))
														{
															echo '<label class="text-success"><i class="mdi mdi-check"></i> Checked</label>';
														}
														else
														{
															echo '<label class="text-danger"><i class="mdi mdi-close"></i> Please make the database.php file writable.</label>';
															echo '<p class="text-danger"><b>Example:</b> chmod 777 - /application/config/database.php</p>';
														}
													}
													else
													{
														echo '<span class="text-danger"><i class="mdi mdi-close"></i> ../application/config/database.php file is missing.</span>';
													}
												?>
											</div>
											<div>
												<label class="mr-3">Database Replace File</label>
												<?php
													if(file_exists($db_dump_file))
													{
														echo '<label class="text-success"><i class="mdi mdi-check"></i> Checked</label>';
													}
													else
													{
														echo '<label class="text-danger"><i class="mdi mdi-close"></i> Failed</label>';
													}
												?>
											</div>
											<div>
												<label class="mr-3">Sql Dump File</label>
												<?php
													if(file_exists($sql_dump_file))
													{
														echo '<label class="text-success"><i class="mdi mdi-check"></i> Checked</label>';
													}
													else
													{
														echo '<label class="text-danger"><i class="mdi mdi-close"></i> Failed</label>';
													}
												?>
											</div>
										</div>
										<div class="mb-3">
											<div>
												<h5>Extensions</h5>
											</div>
											<div>
												<label class="mr-3">Curl</label>
												<?php if(curl_installed()){ ?>
													<label class="text-success"><i class="mdi mdi-check"></i> <?php echo 'Checked'; ?></label>
												<?php }else{ ?>
													<label class="text-danger"><i class="mdi mdi-close"></i> <?php echo 'Failed to check'; ?></label>
												<?php } ?>
											</div>
											<div>
												<label class="mr-3">PDO</label>
												<?php if(pdo_installed()){ ?>
													<label class="text-success"><i class="mdi mdi-check"></i> <?php echo 'Checked'; ?></label>
												<?php }else{ ?>
													<label class="text-danger"><i class="mdi mdi-close"></i> <?php echo 'Failed to check'; ?></label>
												<?php } ?>
											</div>
										</div>
									</div>
								</fieldset>
								<fieldset>
									<div class="form-top">
										<div class="bg-light p-3 mb-4">
											<h4>Step 3 / 4</h4>
											<p class="mb-0">Database Setup</p>
										</div>
										<div class="mb-4 mt-2 text-center">
											<div id="gif_loader" class="display-none"></div>
											<div id="dbtestconnmsg"></div>
										</div>
										<div class="mb-4">
											<div class="row d-flex align-items-center">
												<div class="col-lg-4">
													<label for="hostname">Database Host <span class="text-danger">*</span></label>
												</div>
												<div class="col-lg-8">
													<input type="text" name="hostname" id="hostname" class="form-control" placeholder="localhost" value="localhost" autocomplete="off" />
												</div>
											</div>
										</div>
										<div class="mb-4">
											<div class="row d-flex align-items-center">
												<div class="col-lg-4">
													<label for="username">Database Username <span class="text-danger">*</span></label>
												</div>
												<div class="col-lg-8">
													<input type="text" name="username" id="username" class="form-control" placeholder="admin" autocomplete="off" />
												</div>
											</div>
										</div>
										<div class="mb-4">
											<div class="row d-flex align-items-center">
												<div class="col-lg-4">
													<label for="password">Database Password <span class="text-danger">*</span></label>
												</div>
												<div class="col-lg-8">
													<input type="password" name="password" id="password" class="form-control" placeholder="admin" autocomplete="off" />
												</div>
											</div>
										</div>
										<div class="mb-4">
											<div class="row d-flex align-items-center">
												<div class="col-lg-4">
													<label for="database">Database Name <span class="text-danger">*</span></label>
												</div>
												<div class="col-lg-8">
													<input type="text" name="database" id="database" class="form-control" placeholder="app_abc" autocomplete="off" />
												</div>
											</div>
										</div>
									</div>
									<div class="text-right">
										<input type="button" id="chk_submit" class="btn btn-sm btn-danger" value="Test Connection">
									</div>
								</fieldset>
								<fieldset>
								</fieldset>
							</form>
						<?php }} ?>
					</div>
				</div>
			</div>
		</div>
	</div>

<?php require_once('footer.php'); ?>